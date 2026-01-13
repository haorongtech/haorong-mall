/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.upms.mapper;

import com.baomidou.mybatisplus.annotation.InterceptorIgnore;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.haorong.cloud.upms.api.entity.SysUser;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * 系统用户
 *
 * @author haorong
 * @since 2022/2/26 16:50
 */
@Mapper
public interface SysUserMapper extends BaseMapper<SysUser> {

	/**
	 * 用户列表查询
	 * @param page
	 * @param sysUser
	 * @author haorong
	 * @date 2022/5/31
	 * @return: com.baomidou.mybatisplus.core.metadata.IPage<com.haorong.cloud.upms.common.entity.SysUser>
	 */
	IPage<SysUser> adminPage(Page page, @Param("query") SysUser sysUser);

	@InterceptorIgnore(tenantLine = "true")
	SysUser selectUserByName(@Param("username") String username);

	@InterceptorIgnore(tenantLine = "true")
	int selectCount(@Param("query") SysUser sysUser);

	@InterceptorIgnore(tenantLine = "true")
	SysUser selectUserByPhone(@Param("phone") String phone);

}
