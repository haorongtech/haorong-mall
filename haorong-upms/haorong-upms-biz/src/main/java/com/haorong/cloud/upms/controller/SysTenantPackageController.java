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
import com.haorong.cloud.common.core.util.Result;
import com.haorong.cloud.common.log.annotation.SysLog;
import com.haorong.cloud.upms.api.entity.SysTenantPackage;
import com.haorong.cloud.upms.service.ISysTenantPackageService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

/**
 * 租户套餐
 *
 * @author haorong
 * @since 2022/2/26 16:37
 */
@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/tenantpackage")
@Tag(description = "tenantpackage", name = "租户套餐")
public class SysTenantPackageController {

	private final ISysTenantPackageService sysTenantPackageService;

	@Operation(summary = "查询全部租户套餐")
	@GetMapping("/list")
	public Result list(SysTenantPackage sysTenantPackage) {
		return Result.success(sysTenantPackageService.list(Wrappers.query(sysTenantPackage)));
	}

	@Operation(summary = "租户套餐列表")
	@SaCheckPermission("upms:tenantpackage:page")
	@GetMapping("/page")
	public Result page(Page page, SysTenantPackage sysTenantPackage) {
		return Result.success(sysTenantPackageService.page(page, Wrappers.query(sysTenantPackage)));
	}

	@Operation(summary = "租户套餐查询")
	@SaCheckPermission("upms:tenantpackage:get")
	@GetMapping("/{id}")
	public Result getById(@PathVariable String id) {
		return Result.success(sysTenantPackageService.getById(id));
	}

	@Operation(summary = "租户套餐新增")
	@SysLog("新增租户套餐")
	@SaCheckPermission("upms:tenantpackage:add")
	@PostMapping
	public Result add(@RequestBody SysTenantPackage sysTenantPackage) {
		return Result.success(sysTenantPackageService.save(sysTenantPackage));
	}

	@Operation(summary = "租户套餐修改")
	@SysLog("修改租户套餐")
	@SaCheckPermission("upms:tenantpackage:edit")
	@PutMapping
	public Result edit(@RequestBody SysTenantPackage sysTenantPackage) {
		return Result.success(sysTenantPackageService.updateById(sysTenantPackage));
	}

	@Operation(summary = "租户删除套餐")
	@SysLog("删除租户套餐")
	@SaCheckPermission("upms:tenantpackage:del")
	@DeleteMapping("/{id}")
	public Result del(@PathVariable String id) {
		return Result.success(sysTenantPackageService.removeById(id));
	}

}
