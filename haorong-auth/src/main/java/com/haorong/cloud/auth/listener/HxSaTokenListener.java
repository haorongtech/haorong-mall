/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.auth.listener;

import cn.dev33.satoken.context.SaHolder;
import cn.dev33.satoken.listener.SaTokenListener;
import cn.dev33.satoken.stp.parameter.SaLoginParameter;
import cn.hutool.core.util.StrUtil;
import cn.hutool.extra.servlet.JakartaServletUtil;
import cn.hutool.http.useragent.UserAgent;
import cn.hutool.http.useragent.UserAgentUtil;
import cn.hutool.json.JSONUtil;
import com.haorong.cloud.common.core.constant.CacheConstants;
import com.haorong.cloud.common.core.constant.CommonConstants;
import com.haorong.cloud.common.core.enums.DeviceTypeEnum;
import com.haorong.cloud.common.core.util.IpUtils;
import com.haorong.cloud.common.log.event.HxLoginLogEvent;
import com.haorong.cloud.common.myabtis.tenant.HxTenantContextHolder;
import com.haorong.cloud.common.security.entity.HxUser;
import com.haorong.cloud.upms.api.entity.SysLoginLog;
import com.haorong.cloud.upms.api.entity.SysUserOnline;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.time.LocalDateTime;
import java.util.Objects;
import java.util.concurrent.TimeUnit;

/**
 * Sa-Token 侦听器
 *
 * @author haorong
 * @date 2022/7/8
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class HxSaTokenListener implements SaTokenListener {

	private final ApplicationEventPublisher applicationEventPublisher;

	private final StringRedisTemplate redisTemplate;

	/** 每次登录时触发 */
	@Override
	public void doLogin(String loginType, Object loginId, String tokenValue, SaLoginParameter loginModel) {
		// 非后台登录无需往下执行
		if (!DeviceTypeEnum.TOB.getDevice().equals(loginModel.getDeviceType())) {
			return;
		}
		HttpServletRequest request = ((ServletRequestAttributes) Objects
			.requireNonNull(RequestContextHolder.getRequestAttributes())).getRequest();
		// 处理登录日志
		HxUser hxUser = (HxUser) SaHolder.getStorage().get(CacheConstants.USER_CACHE);

		String tenantId = hxUser.getTenantId();
		String userName = hxUser.getUsername();
		String agent = SaHolder.getRequest().getHeader("User-Agent").toLowerCase();
		UserAgent ua = UserAgentUtil.parse(agent);
		SysLoginLog sysLoginLog = new SysLoginLog();
		sysLoginLog.setStatus(CommonConstants.LOGIN_LOG_STATUS_1);
		sysLoginLog.setIpAddr(JakartaServletUtil.getClientIP(request));
		sysLoginLog.setLocation(IpUtils.getWhoisAddress(sysLoginLog.getIpAddr()));
		sysLoginLog.setCreateBy(userName);
		sysLoginLog.setOs(ua.getOs().toString());
		sysLoginLog.setBrowser(ua.getBrowser().toString());
		sysLoginLog.setMsg(StrUtil.format("用户：{} 登录成功", userName));
		sysLoginLog.setUserName(userName);
		HxTenantContextHolder.setTenantId(tenantId);
		// 缓存在线用户信息
		SysUserOnline sysUserOnline = new SysUserOnline();
		sysUserOnline.setTokenId(tokenValue);
		sysUserOnline.setTokenTimeout(loginModel.getTimeout());
		sysUserOnline.setBrowser(sysLoginLog.getBrowser());
		sysUserOnline.setOs(sysLoginLog.getOs());
		sysUserOnline.setUserName(sysLoginLog.getUserName());
		sysUserOnline.setLoginTime(LocalDateTime.now());
		sysUserOnline.setIpAddr(sysLoginLog.getIpAddr());
		sysUserOnline.setLocation(sysLoginLog.getLocation());
		sysUserOnline.setTenantId(tenantId);
		String key = CacheConstants.SYS_ONLINE_KEY + tenantId + ":" + tokenValue;
		redisTemplate.opsForValue()
			.set(key, JSONUtil.toJsonStr(sysUserOnline), loginModel.getTimeout(), TimeUnit.SECONDS);
		try {
			applicationEventPublisher.publishEvent(new HxLoginLogEvent(this, sysLoginLog));
		}
		catch (Exception e) {
			log.error(e.getMessage());
		}
	}

	@Override
	public void doLogout(String loginType, Object loginId, String tokenValue) {
		redisTemplate.delete(CacheConstants.SYS_ONLINE_KEY + tokenValue);
	}

	@Override
	public void doKickout(String loginType, Object loginId, String tokenValue) {
		redisTemplate.delete(CacheConstants.SYS_ONLINE_KEY + tokenValue);
	}

	@Override
	public void doReplaced(String loginType, Object loginId, String tokenValue) {
		redisTemplate.delete(CacheConstants.SYS_ONLINE_KEY + tokenValue);
	}

	@Override
	public void doDisable(String s, Object o, String s1, int i, long l) {
	}

	@Override
	public void doUntieDisable(String s, Object o, String s1) {
	}

	@Override
	public void doOpenSafe(String s, String s1, String s2, long l) {
	}

	@Override
	public void doCloseSafe(String s, String s1, String s2) {
	}

	@Override
	public void doCreateSession(String s) {
	}

	@Override
	public void doLogoutSession(String s) {
	}

	@Override
	public void doRenewTimeout(String s, Object o, String s1, long l) {

	}

}
