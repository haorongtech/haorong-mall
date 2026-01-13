/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.upms.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.lang.tree.TreeNode;
import com.alibaba.fastjson2.JSONObject;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.haorong.cloud.common.core.constant.CacheConstants;
import com.haorong.cloud.common.core.constant.CommonConstants;
import com.haorong.cloud.common.myabtis.tenant.HxTenantContextHolder;
import com.haorong.cloud.common.security.handler.HxBusinessException;
import com.haorong.cloud.upms.api.entity.SysMenu;
import com.haorong.cloud.upms.api.entity.SysRoleMenu;
import com.haorong.cloud.upms.api.entity.SysTenantMenu;
import com.haorong.cloud.upms.api.vo.MenuVO;
import com.haorong.cloud.upms.mapper.SysMenuMapper;
import com.haorong.cloud.upms.mapper.SysRoleMapper;
import com.haorong.cloud.upms.mapper.SysRoleMenuMapper;
import com.haorong.cloud.upms.mapper.SysTenantMenuMapper;
import com.haorong.cloud.upms.service.ISysMenuService;
import lombok.AllArgsConstructor;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.stream.Collectors;

/**
 * 系统菜单
 *
 * @author haorong
 * @since 2022/2/26 16:47
 */
@Service
@AllArgsConstructor
public class SysMenuServiceImpl extends ServiceImpl<SysMenuMapper, SysMenu> implements ISysMenuService {

	private final SysRoleMenuMapper sysRoleMenuMapper;

	private final SysRoleMapper sysRoleMapper;

	private final SysTenantMenuMapper sysTenantMenuMapper;

	@Override
	@Cacheable(value = CacheConstants.MENU_CACHE, key = "#roleId + '_menu'", unless = "#result.isEmpty()")
	public List<MenuVO> findMenuByRoleId(String roleId) {
		return baseMapper.listMenuByRoleId(roleId);
	}

	@Override
	@CacheEvict(value = CacheConstants.MENU_CACHE, allEntries = true)
	public boolean updateMenuById(SysMenu sysMenu) {
		return this.updateById(sysMenu);
	}

	@Override
	public List<TreeNode<String>> getTenantMenuTree(String tenantId) {
		List<SysMenu> sysMenuList = null;
		// 平台租户查询全部菜单
		if (!CommonConstants.PLATFORM_TENANT_ID.equals(HxTenantContextHolder.getTenantId())) {
			sysMenuList = baseMapper.selectTenantMenuTree(tenantId);
		}
		else {
			sysMenuList = baseMapper.selectList(Wrappers.<SysMenu>lambdaQuery().orderByDesc(SysMenu::getSort));
		}

		List<TreeNode<String>> treeNodes = sysMenuList.stream()
			.sorted(Comparator.comparingInt(SysMenu::getSort))
			.map(menu -> {
				TreeNode<String> treeNode = new TreeNode<>();
				treeNode.setId(menu.getId());
				treeNode.setParentId(menu.getParentId());
				treeNode.setName(menu.getName());
				treeNode.setWeight(menu.getSort());
				Map<String, Object> extra = new HashMap<>();
				extra.put("icon", menu.getIcon());
				extra.put("type", menu.getType());
				extra.put("createTime", menu.getCreateTime());
				extra.put("permission", menu.getPermission());
				extra.put("path", menu.getPath());
				extra.put("component", menu.getComponent());
				extra.put("applicationKey", menu.getApplicationKey());
				extra.put("sort", menu.getSort());
				extra.put("redirect", menu.getRedirect());
				treeNode.setExtra(extra);
				return treeNode;
			})
			.collect(Collectors.toList());
		return treeNodes;
	}

	@Override
	public List<TreeNode<String>> getLoginUserMenuTree() {
		// 查询角色菜单
		Set<MenuVO> all = new HashSet<>();
		List<String> roles = sysRoleMapper.listRoleIdsByUserId(StpUtil.getLoginId().toString());
		for (String roleId : roles) {
			all.addAll(this.findMenuByRoleId(roleId));
		}
		// 平台租户不过滤菜单
		if (!CommonConstants.PLATFORM_TENANT_ID.equals(HxTenantContextHolder.getTenantId())) {
			// 查询租户菜单
			List<SysTenantMenu> sysTenantMenuList = sysTenantMenuMapper.selectList(Wrappers.query());
			List<String> tenantMenuIds = sysTenantMenuList.stream().map(SysTenantMenu::getMenuId).toList();
			// 取交集
			all = all.stream().filter(menu -> tenantMenuIds.contains(menu.getId())).collect(Collectors.toSet());
		}

		List<TreeNode<String>> treeNodes = all.stream()
			.filter(menuVo -> CommonConstants.MENU_TYPE_0.equals(menuVo.getType()))
			.sorted(Comparator.comparingInt(MenuVO::getSort))
			.map(menu -> {
				TreeNode<String> treeNode = new TreeNode<>();
				treeNode.setId(menu.getId());
				treeNode.setParentId(menu.getParentId());
				treeNode.setName(menu.getName());
				treeNode.setWeight(menu.getSort());
				Map<String, Object> extra = new HashMap<>();
				extra.put("icon", menu.getIcon());
				extra.put("type", menu.getType());
				extra.put("createTime", menu.getCreateTime());
				extra.put("permission", menu.getPermission());
				extra.put("path", menu.getPath());
				extra.put("component", menu.getComponent());
				extra.put("applicationKey", menu.getApplicationKey());
				extra.put("sort", menu.getSort());
				extra.put("redirect", menu.getRedirect());

				JSONObject jsonObject = new JSONObject();
				jsonObject.put("title", menu.getName());
				jsonObject.put("icon", menu.getIcon());
				jsonObject.put("order", menu.getSort());
				extra.put("meta", jsonObject);
				treeNode.setExtra(extra);
				return treeNode;
			})
			.collect(Collectors.toList());
		return treeNodes;
	}

	@Override
	@CacheEvict(value = CacheConstants.MENU_CACHE, allEntries = true)
	public boolean removeMenuById(String id) {
		long count = baseMapper.selectCount(Wrappers.<SysMenu>lambdaQuery().eq(SysMenu::getParentId, id));
		if (count > 0) {
			throw new HxBusinessException("请先删除下级菜单");
		}
		sysRoleMenuMapper.delete(Wrappers.<SysRoleMenu>lambdaQuery().eq(SysRoleMenu::getMenuId, id));
		return this.removeById(id);
	}

	@Override
	@CacheEvict(value = CacheConstants.MENU_CACHE, allEntries = true)
	@Transactional(rollbackFor = Exception.class)
	public boolean saveMenu(SysMenu sysMenu) {
		return this.save(sysMenu);
	}

}
