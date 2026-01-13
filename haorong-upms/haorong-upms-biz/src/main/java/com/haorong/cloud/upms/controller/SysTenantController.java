/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.upms.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.haorong.cloud.common.core.constant.CommonConstants;
import com.haorong.cloud.common.core.util.Result;
import com.haorong.cloud.common.log.annotation.SysLog;
import com.haorong.cloud.upms.api.dto.RegisterTenantDTO;
import com.haorong.cloud.upms.api.entity.SysTenant;
import com.haorong.cloud.upms.service.ISysTenantService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

/**
 * 租户管理
 *
 * @author haorong
 * @since 2022/2/26 16:37
 */
@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/tenant")
@Tag(description = "tenant", name = "租户管理")
public class SysTenantController {

	private final ISysTenantService sysTenantService;

	@Operation(summary = "租户列表")
	@SaCheckPermission("upms:systenant:page")
	@GetMapping("/page")
	public Result page(Page page, SysTenant sysTenant) {
		return Result.success(sysTenantService.page(page, Wrappers.query(sysTenant)));
	}

	@Operation(summary = "租户查询")
	@SaCheckPermission("upms:systenant:get")
	@GetMapping("/{id}")
	public Result getById(@PathVariable String id) {
		return Result.success(sysTenantService.getById(id));
	}

	@Operation(summary = "租户新增")
	@SysLog("新增租户")
	@SaCheckPermission("upms:systenant:add")
	@PostMapping
	public Result add(@RequestBody SysTenant sysTenant) {
		return Result.success(sysTenantService.saveTenant(sysTenant));
	}

	@Operation(summary = "租户修改")
	@SysLog("修改租户")
	@SaCheckPermission("upms:systenant:edit")
	@PutMapping
	public Result edit(@RequestBody SysTenant sysTenant) {
		return Result.success(sysTenantService.updateById(sysTenant));
	}

	@Operation(summary = "租户删除")
	@SysLog("删除租户")
	@SaCheckPermission("upms:systenant:del")
	@DeleteMapping("/{id}")
	public Result del(@PathVariable String id) {
		return Result.success(sysTenantService.removeById(id));
	}

	@Operation(summary = "注册（创建租户）")
	@PostMapping("/register")
	public Result register(@RequestBody RegisterTenantDTO registerTenantDTO) {
		return Result.success(sysTenantService.register(registerTenantDTO));

	}

	@GetMapping("/list")
	public Result getList() {
		return Result.success(sysTenantService
			.list(Wrappers.<SysTenant>lambdaQuery().eq(SysTenant::getStatus, CommonConstants.NORMAL_STATUS)));
	}

}
