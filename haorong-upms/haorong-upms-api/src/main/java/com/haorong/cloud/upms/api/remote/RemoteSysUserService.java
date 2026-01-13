/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.upms.api.remote;

import com.haorong.cloud.upms.api.entity.SysUser;

/**
 * 系统用户 feign
 *
 * @author haorong
 * @date 2022/6/28
 */
public interface RemoteSysUserService {

	/**
	 * 通过用户名查询用户、角色信息
	 *
	 * @author haorong
	 * @date 2022/6/28
	 * @param username
	 * @return: com.haorong.cloud.upms.common.entity.SysUser
	 */
	SysUser getUserInfo(String username);

	/**
	 * 通过手机号查询用户、角色信息
	 *
	 * @author haorong
	 * @date 2022/7/5
	 * @param phone
	 * @return: com.haorong.cloud.common.core.util.Result<com.haorong.cloud.upms.common.entity.SysUser>
	 */
	SysUser getUserInfoByPhone(String phone);

}
