/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.upms.service.impl;

import cn.hutool.core.util.IdUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.haorong.cloud.common.core.constant.CacheConstants;
import com.haorong.cloud.common.myabtis.tenant.HxTenantContextHolder;
import com.haorong.cloud.upms.api.dto.SysRoleMenuDTO;
import com.haorong.cloud.upms.api.entity.SysRoleMenu;
import com.haorong.cloud.upms.mapper.SysRoleMenuMapper;
import com.haorong.cloud.upms.service.ISysRoleMenuService;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 角色关联菜单
 *
 * @author haorong
 * @since 2022/2/26 16:47
 */
@Service
public class SysRoleMenuServiceImpl extends ServiceImpl<SysRoleMenuMapper, SysRoleMenu> implements ISysRoleMenuService {

	@Override
	@Transactional(rollbackFor = Exception.class)
	@CacheEvict(value = CacheConstants.MENU_CACHE, allEntries = true)
	public boolean saveRoleMenu(SysRoleMenuDTO request) {
		String tenantId = HxTenantContextHolder.getTenantId();
		LocalDateTime now = LocalDateTime.now();
		super.remove(Wrappers.<SysRoleMenu>lambdaQuery().eq(SysRoleMenu::getRoleId, request.getRoleId()));
		List<String> menuIds = request.getMenuIds();
		List<SysRoleMenu> sysRoleMenus = menuIds.stream().map(menuId -> {
			SysRoleMenu roleMenu = new SysRoleMenu();
			roleMenu.setRoleId(request.getRoleId());
			roleMenu.setMenuId(menuId);
			roleMenu.setId(IdUtil.getSnowflakeNextIdStr());
			roleMenu.setTenantId(tenantId);
			roleMenu.setCreateTime(now);
			return roleMenu;
		}).collect(Collectors.toList());

		// 每批1000条
		int batchSize = 1000;
		for (int i = 0; i < sysRoleMenus.size(); i += batchSize) {
			int end = Math.min(i + batchSize, sysRoleMenus.size());
			List<SysRoleMenu> batchList = sysRoleMenus.subList(i, end);
			baseMapper.saveBatch(batchList);
		}
		return Boolean.TRUE;
	}

}
