/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.upms.service;

import cn.hutool.core.lang.tree.TreeNode;
import com.baomidou.mybatisplus.extension.service.IService;
import com.haorong.cloud.upms.api.entity.SysMenu;
import com.haorong.cloud.upms.api.vo.MenuVO;

import java.util.List;

/**
 * 系统菜单
 *
 * @author haorong
 * @since 2022/2/26 16:47
 */
public interface ISysMenuService extends IService<SysMenu> {

	/**
	 * 通过角色主键查询菜单
	 * @param roleId
	 * @author haorong
	 * @date 2022/7/18
	 * @return: java.util.List<com.haorong.cloud.upms.common.vo.MenuVO>
	 */
	List<MenuVO> findMenuByRoleId(String roleId);

	/**
	 * 保存
	 *
	 * @author: haorong
	 * @date: 2023/4/27 13:32
	 * @param: [sysMenu]
	 * @return: boolean
	 **/
	boolean saveMenu(SysMenu sysMenu);

	/**
	 * 删除
	 *
	 * @author: haorong
	 * @date: 2023/4/27 13:32
	 * @param: [id]
	 * @return: boolean
	 **/
	boolean removeMenuById(String id);

	/**
	 * 修改
	 *
	 * @author: haorong
	 * @date: 2023/4/27 13:32
	 * @param: [sysMenu]
	 * @return: boolean
	 **/
	boolean updateMenuById(SysMenu sysMenu);

	/**
	 * 查询登录用户菜单树
	 * @return
	 */
	List<TreeNode<String>> getLoginUserMenuTree();

	/**
	 * 查询租户下的菜单树
	 * @param tenantId
	 * @return
	 */
	List<TreeNode<String>> getTenantMenuTree(String tenantId);

}
