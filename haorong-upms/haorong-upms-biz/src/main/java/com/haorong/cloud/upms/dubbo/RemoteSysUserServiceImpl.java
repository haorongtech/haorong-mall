/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.upms.dubbo;

import cn.hutool.core.util.ObjectUtil;
import com.haorong.cloud.common.myabtis.tenant.HxTenantContextHolder;
import com.haorong.cloud.upms.api.entity.SysUser;
import com.haorong.cloud.upms.api.remote.RemoteSysUserService;
import com.haorong.cloud.upms.service.ISysUserService;
import lombok.RequiredArgsConstructor;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.stereotype.Service;

/**
 * @author lijia
 * @description
 * @date 2024/11/22
 */
@Service
@DubboService
@RequiredArgsConstructor
public class RemoteSysUserServiceImpl implements RemoteSysUserService {

	private final ISysUserService sysUserService;

	@Override
	public SysUser getUserInfo(String username) {
		// 首先通过用户名获取用户信息
		SysUser sysUser = sysUserService.findUserByName(username);
		if (ObjectUtil.isNull(sysUser)) {
			return null;
		}
		// 从用户信息中获取租户ID，设置到线程变量中
		HxTenantContextHolder.setTenantId(sysUser.getTenantId());
		return sysUserService.findUserInfo(sysUser);
	}

	@Override
	public SysUser getUserInfoByPhone(String phone) {
		// 首先通过手机号获取用户信息
		SysUser sysUser = sysUserService.findUserByPhone(phone);
		if (ObjectUtil.isNull(sysUser)) {
			return null;
		}
		// 从用户信息中获取租户ID，设置到线程变量中
		HxTenantContextHolder.setTenantId(sysUser.getTenantId());
		return sysUserService.findUserInfo(sysUser);
	}

}
