/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.auth.service;

import cn.dev33.satoken.context.SaHolder;
import cn.dev33.satoken.secure.SaSecureUtil;
import cn.dev33.satoken.stp.SaTokenInfo;
import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.extra.servlet.JakartaServletUtil;
import cn.hutool.http.useragent.UserAgent;
import cn.hutool.http.useragent.UserAgentUtil;
import com.haorong.cloud.common.core.constant.CommonConstants;
import com.haorong.cloud.common.core.enums.DeviceTypeEnum;
import com.haorong.cloud.common.core.util.IpUtils;
import com.haorong.cloud.common.log.event.HxLoginLogEvent;
import com.haorong.cloud.common.myabtis.tenant.HxTenantContextHolder;
import com.haorong.cloud.common.security.entity.HxUser;
import com.haorong.cloud.common.security.util.SecurityUtils;
import com.haorong.cloud.upms.api.entity.SysLoginLog;
import com.haorong.cloud.upms.api.entity.SysUser;
import com.haorong.cloud.upms.api.remote.RemoteSysUserService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.apache.dubbo.config.annotation.DubboReference;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.util.ArrayList;
import java.util.Objects;

@Component
@RequiredArgsConstructor
public class LoginService {

	@DubboReference
	private final RemoteSysUserService remoteSysUserService;

	private final ApplicationEventPublisher applicationEventPublisher;

	public SaTokenInfo login(String username, String password) {
		HxUser hxUser = getUserDetails(remoteSysUserService.getUserInfo(username));
		if (ObjectUtil.isNull(hxUser)) {
			throw new RuntimeException("用户不存在");
		}
		if (!hxUser.getPassword().equals(SaSecureUtil.md5(password))) {
			saveLoginLog(hxUser, "账号或密码错误");
			throw new RuntimeException("账号或密码错误");
		}
		if (!CommonConstants.NORMAL_STATUS.equals(hxUser.getStatus())) {
			saveLoginLog(hxUser, "状态异常不可登录");
			throw new RuntimeException("状态异常不可登录");
		}
		SecurityUtils.loginByDevice(hxUser, DeviceTypeEnum.TOB);
		return StpUtil.getTokenInfo();
	}

	public SaTokenInfo smsLogin(String phone) {
		HxUser hxUser = getUserDetails(remoteSysUserService.getUserInfoByPhone(phone));
		if (ObjectUtil.isNull(hxUser)) {
			throw new RuntimeException("用户不存在");
		}
		if (!CommonConstants.NORMAL_STATUS.equals(hxUser.getStatus())) {
			saveLoginLog(hxUser, "状态异常不可登录");
			throw new RuntimeException("状态异常不可登录");
		}
		SecurityUtils.loginByDevice(hxUser, DeviceTypeEnum.TOB);
		return StpUtil.getTokenInfo();
	}

	private void saveLoginLog(HxUser hxUser, String msg) {
		HttpServletRequest request = ((ServletRequestAttributes) Objects
			.requireNonNull(RequestContextHolder.getRequestAttributes())).getRequest();
		// 处理登录日志
		String userName = hxUser.getUsername();
		String agent = SaHolder.getRequest().getHeader("User-Agent").toLowerCase();
		UserAgent ua = UserAgentUtil.parse(agent);
		SysLoginLog sysLoginLog = new SysLoginLog();
		sysLoginLog.setStatus(CommonConstants.LOGIN_LOG_STATUS_0);
		sysLoginLog.setIpAddr(JakartaServletUtil.getClientIP(request));
		sysLoginLog.setLocation(IpUtils.getWhoisAddress(sysLoginLog.getIpAddr()));
		sysLoginLog.setCreateBy(userName);
		sysLoginLog.setOs(ua.getOs().toString());
		sysLoginLog.setBrowser(ua.getBrowser().toString());
		sysLoginLog.setMsg(StrUtil.format("用户: {} 登录失败，异常: {} ", userName, msg));
		sysLoginLog.setUserName(userName);
		HxTenantContextHolder.setTenantId(hxUser.getTenantId());
		applicationEventPublisher.publishEvent(new HxLoginLogEvent(this, sysLoginLog));

	}

	private HxUser getUserDetails(SysUser result) {
		if (ObjectUtil.isNull(result)) {
			throw new RuntimeException("用户不存在");
		}
		HxUser hxUser = new HxUser();
		BeanUtil.copyProperties(result, hxUser);
		hxUser.setUserId(result.getId());
		hxUser.setPermissions(new ArrayList<>(result.getPermissions()));
		return hxUser;
	}

}
