/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.upms.service.impl;

import cn.dev33.satoken.secure.SaSecureUtil;
import cn.hutool.core.date.LocalDateTimeUtil;
import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.haorong.cloud.common.core.constant.CommonConstants;
import com.haorong.cloud.common.myabtis.tenant.HxTenantContextHolder;
import com.haorong.cloud.common.security.handler.HxBusinessException;
import com.haorong.cloud.upms.api.dto.RegisterTenantDTO;
import com.haorong.cloud.upms.api.entity.*;
import com.haorong.cloud.upms.mapper.SysTenantMapper;
import com.haorong.cloud.upms.service.*;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 租户管理
 *
 * @author haorong
 * @since 2022/2/26 16:51
 */
@Service
@AllArgsConstructor
public class SysTenantServiceImpl extends ServiceImpl<SysTenantMapper, SysTenant> implements ISysTenantService {

	private final ISysRoleService sysRoleService;

	private final ISysDeptService sysDeptService;

	private final ISysUserService sysUserService;

	private final ISysUserRoleService sysUserRoleService;

	private final ISysMenuService sysMenuService;

	private final ISysRoleMenuService sysRoleMenuService;

	private final ISysTenantPackageService sysTenantPackageService;

	private final ISysTenantMenuService sysTenantMenuService;

	@Override
	@Transactional(rollbackFor = Exception.class)
	public boolean saveTenant(SysTenant sysTenant) {

		if (Objects.nonNull(sysUserService.findUserByName(sysTenant.getUsername().trim()))) {
			throw new HxBusinessException("该用户已存在: " + sysTenant.getUsername());
		}
		if (Objects.nonNull(sysUserService.findUserByPhone(sysTenant.getPhone().trim()))) {
			throw new HxBusinessException("该手机号已存在: " + sysTenant.getPhone());
		}
		// 新增租户
		super.save(sysTenant);
		this.registerSysTenant(sysTenant, CommonConstants.REGISTER_TYPE_USERNAME);
		return Boolean.TRUE;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public boolean register(RegisterTenantDTO registerTenantDTO) {
		String phone = registerTenantDTO.getPhone().trim();
		SysUser user = sysUserService.findUserByPhone(phone);
		if (ObjectUtil.isNotNull(user)) {
			throw new HxBusinessException("该手机号已注册");
		}
		String packageId = registerTenantDTO.getPackageId();
		SysTenant sysTenant = new SysTenant();
		sysTenant.setName(registerTenantDTO.getName());
		sysTenant.setPhone(phone);
		sysTenant.setStatus(CommonConstants.YES);
		sysTenant.setAuthBeginTime(LocalDateTime.now());
		sysTenant.setAuthEndTime(LocalDateTimeUtil.offset(sysTenant.getAuthBeginTime(), 7, ChronoUnit.DAYS));
		super.save(sysTenant);
		sysTenant.setPackageId(packageId);
		this.registerSysTenant(sysTenant, CommonConstants.REGISTER_TYPE_PHONE);
		return Boolean.TRUE;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public void registerSysTenant(SysTenant sysTenant, String type) {

		HxTenantContextHolder.setTenantId(sysTenant.getId());
		// 新增角色
		SysRole sysRole = new SysRole();
		sysRole.setRoleCode(CommonConstants.ROLE_ADMIN_CODE);
		sysRole.setRoleName(CommonConstants.ROLE_ADMIN_NAME);
		sysRoleService.save(sysRole);
		// 新增部门
		SysDept sysDept = new SysDept();
		sysDept.setDeptName(sysTenant.getName());
		sysDept.setParentId(CommonConstants.PARENT_ID);
		sysDept.setSort(1);
		sysDeptService.save(sysDept);
		// 新增用户
		SysUser sysUser = new SysUser();
		switch (type) {
			case CommonConstants.REGISTER_TYPE_USERNAME -> sysUser.setUsername(sysTenant.getUsername());
			case CommonConstants.REGISTER_TYPE_PHONE -> sysUser.setUsername(sysTenant.getPhone());
		}
		sysUser.setPhone(sysTenant.getPhone());
		sysUser.setPassword(SaSecureUtil.md5(sysTenant.getPassword()));
		sysUser.setDeptId(sysDept.getId());
		sysUser.setStatus(CommonConstants.NORMAL_STATUS);
		sysUser.setType(CommonConstants.USER_TYPE_PRIMARY);
		sysUserService.save(sysUser);
		// 查询套餐包
		SysTenantPackage sysTenantPackage = sysTenantPackageService.getById(sysTenant.getPackageId());
		if (ObjectUtil.isNull(sysTenantPackage)) {
			throw new HxBusinessException("套餐包不存在");
		}
		// 新增角色关联菜单
		Set<SysMenu> sysMenuSet = new HashSet<>();
		Arrays.asList(sysTenantPackage.getAppKey())
			.forEach(key -> sysMenuSet
				.addAll(sysMenuService.list(Wrappers.<SysMenu>lambdaQuery().eq(SysMenu::getApplicationKey, key))));
		// 租户授权菜单
		List<SysTenantMenu> tenantMenuList = sysMenuSet.stream().map(menu -> {
			SysTenantMenu tenantMenu = new SysTenantMenu();
			tenantMenu.setMenuId(menu.getId());
			return tenantMenu;
		}).collect(Collectors.toList());
		sysTenantMenuService.saveBatch(tenantMenuList);
		// 新增角色关联菜单
		List<SysRoleMenu> roleMenuList = tenantMenuList.stream().map(menu -> {
			SysRoleMenu roleMenu = new SysRoleMenu();
			roleMenu.setRoleId(sysRole.getId());
			roleMenu.setMenuId(menu.getMenuId());
			return roleMenu;
		}).collect(Collectors.toList());
		sysRoleMenuService.saveBatch(roleMenuList);

		// 新增用户关联角色
		SysUserRole sysUserRole = new SysUserRole();
		sysUserRole.setUserId(sysUser.getId());
		sysUserRole.setRoleId(sysRole.getId());
		sysUserRoleService.save(sysUserRole);
	}

}
