/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.upms.controller;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.haorong.cloud.common.core.util.Result;
import com.haorong.cloud.common.myabtis.tenant.HxTenantContextHolder;
import com.haorong.cloud.upms.api.dto.SysTenantMenuDTO;
import com.haorong.cloud.upms.service.ISysTenantMenuService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

/**
 * 租户分配菜单
 *
 * @author haorong
 * @since 2022/2/26 16:37
 */
@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/tenant-menu")
@Tag(description = "tenantMenu", name = "租户分配菜单")
public class SysTenantMenuController {

	private final ISysTenantMenuService sysTenantMenuService;

	/**
	 * 用户租户分配菜单回显
	 * @param tenantId
	 * @return
	 */
	@Operation(summary = "查询租户关联菜单列表")
	@GetMapping("/list/{tenantId}")
	public Result get(@PathVariable("tenantId") String tenantId) {
		try {
			HxTenantContextHolder.setTenantId(tenantId);
			return Result.success(sysTenantMenuService.list(Wrappers.query()));
		}
		finally {
			HxTenantContextHolder.removeTenantId();
		}
	}

	/**
	 * 租户菜单分配
	 * @param sysTenantMenuDTO
	 * @return
	 */
	@Operation(summary = "保存租户菜单")
	@PostMapping("/save")
	public Result save(@RequestBody SysTenantMenuDTO sysTenantMenuDTO) {
		try {
			HxTenantContextHolder.setTenantId(sysTenantMenuDTO.getTenantId());
			sysTenantMenuService.saveTenantMenu(sysTenantMenuDTO);
			return Result.success();
		}
		finally {
			HxTenantContextHolder.removeTenantId();
		}
	}

}
