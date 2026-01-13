/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.upms.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.haorong.cloud.upms.api.entity.SysRole;

import java.util.List;

/**
 * 角色
 *
 * @author haorong
 * @since 2022/2/26 16:47
 */
public interface ISysRoleService extends IService<SysRole> {

	/**
	 * 验证方法
	 *
	 * @author haorong
	 * @date 2022/9/2
	 * @param sysRole
	 * @return: boolean
	 */
	boolean checkRole(SysRole sysRole);

	/**
	 * 通过用户id查询角色
	 *
	 * @author haorong
	 * @date 2022/9/2
	 * @param userId
	 * @return: java.util.List<java.lang.String>
	 */
	List<String> findRoleIdsByUserId(String userId);

	/**
	 * 分页查询
	 * @param page
	 * @param sysRole
	 * @return
	 */
	IPage<SysRole> getPage(Page page, SysRole sysRole);

}
