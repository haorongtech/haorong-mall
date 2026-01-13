/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.common.security.service.impl;

import cn.dev33.satoken.stp.StpInterface;
import com.haorong.cloud.common.security.util.SecurityUtils;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 自定义权限验证接口扩展
 *
 * @author haorong
 * @date 2022/6/27 23:04
 */
@Component
public class HxPermissionsImpl implements StpInterface {

	@Override
	public List<String> getPermissionList(Object loginId, String loginType) {
		// 返回此 loginId 拥有的权限列表
		return SecurityUtils.getUser().getPermissions();
	}

	@Override
	public List<String> getRoleList(Object loginId, String loginType) {
		return SecurityUtils.getUser().getRoles();
	}

}
