/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.upms.service.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.haorong.cloud.upms.api.dto.SysTenantMenuDTO;
import com.haorong.cloud.upms.api.entity.SysTenantMenu;
import com.haorong.cloud.upms.mapper.SysTenantMenuMapper;
import com.haorong.cloud.upms.service.ISysTenantMenuService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

/**
 * 租户分配菜单
 *
 * @author haorong
 * @since 2022/2/26 16:51
 */
@Service
public class SysTenantMenuServiceImpl extends ServiceImpl<SysTenantMenuMapper, SysTenantMenu>
		implements ISysTenantMenuService {

	@Override
	@Transactional(rollbackFor = Exception.class)
	public boolean saveTenantMenu(SysTenantMenuDTO sysTenantMenuDTO) {
		this.remove(Wrappers.query());
		List<SysTenantMenu> sysTenantMenuList = sysTenantMenuDTO.getMenuIds().stream().map(v -> {
			SysTenantMenu sysTenantMenu = new SysTenantMenu();
			sysTenantMenu.setMenuId(v);
			return sysTenantMenu;
		}).collect(Collectors.toList());
		return this.saveBatch(sysTenantMenuList);
	}

}
