/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.common.security.util;

import cn.dev33.satoken.context.SaHolder;
import cn.dev33.satoken.stp.StpUtil;
import com.haorong.cloud.common.core.constant.CacheConstants;
import com.haorong.cloud.common.core.enums.DeviceTypeEnum;
import com.haorong.cloud.common.security.entity.HxUser;
import lombok.experimental.UtilityClass;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.util.Objects;

/**
 * 安全工具类
 *
 * @author haorong
 * @since 2022/11/25 21:25
 */
@UtilityClass
public class SecurityUtils {

	public static void login(HxUser hxUser) {
		SaHolder.getStorage().set(CacheConstants.USER_CACHE, hxUser);
		StpUtil.login(hxUser.getUserId());
		StpUtil.getTokenSession().set(CacheConstants.USER_CACHE, hxUser);
	}

	public static void loginByDevice(HxUser hxUser, DeviceTypeEnum deviceTypeEnum) {
		SaHolder.getStorage().set(CacheConstants.USER_CACHE, hxUser);
		StpUtil.login(hxUser.getUserId(), deviceTypeEnum.getDevice());
		StpUtil.getTokenSession().set(CacheConstants.USER_CACHE, hxUser);
	}

	private boolean isWebRequest() {
		ServletRequestAttributes servletRequestAttributes = (ServletRequestAttributes) RequestContextHolder
			.getRequestAttributes();
		return Objects.isNull(servletRequestAttributes);
	}

	/**
	 * 获取用户信息
	 * @return
	 */
	public HxUser getUser() {
		if (isWebRequest()) {
			return null;
		}
		// 未登录直接返回
		if (!StpUtil.isLogin()) {
			return null;
		}
		return (HxUser) StpUtil.getTokenSession().get(CacheConstants.USER_CACHE);
	}

	public String getUserId() {
		return getUser().getUserId();
	}

	public String getOpenId() {
		return getUser().getOpenId();
	}

}
