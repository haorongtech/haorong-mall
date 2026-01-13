/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.upms.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.haorong.cloud.upms.api.entity.SysRole;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 角色
 *
 * @author haorong
 * @since 2022/2/26 16:50
 */
@Mapper
public interface SysRoleMapper extends BaseMapper<SysRole> {

	/**
	 * 通过用户id查询角色
	 *
	 * @author haorong
	 * @date 2022/8/23
	 * @param userId
	 * @return: java.util.List<java.lang.String>
	 */
	List<String> listRoleIdsByUserId(String userId);

	/**
	 * 分页查询
	 * @param page
	 * @param sysRole
	 * @return
	 */
	IPage<SysRole> selectRolePage(Page page, @Param("query") SysRole sysRole);

}
