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
import com.haorong.cloud.upms.api.entity.SysMenu;
import com.haorong.cloud.upms.api.vo.MenuVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 菜单
 *
 * @author haorong
 * @since 2022/2/26 16:46
 */
@Mapper
public interface SysMenuMapper extends BaseMapper<SysMenu> {

	/**
	 * 通过角色主键查询菜单
	 *
	 * @author haorong
	 * @date 2022/7/18
	 * @param roleId
	 * @return: java.util.List<com.haorong.cloud.upms.common.vo.MenuVO>
	 */
	List<MenuVO> listMenuByRoleId(String roleId);

	/**
	 * 查询租户菜单树
	 * @param tenantId
	 * @return
	 */
	@InterceptorIgnore(tenantLine = "true")
	List<SysMenu> selectTenantMenuTree(String tenantId);

}
