/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.upms.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.haorong.cloud.common.core.util.Result;
import com.haorong.cloud.common.log.annotation.SysLog;
import com.haorong.cloud.upms.api.entity.SysStorageConfig;
import com.haorong.cloud.upms.service.ISysStorageConfigService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

/**
 * 文件存储配置
 *
 * @author haorong
 * @since 2022/2/26 16:48
 */
@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/storage-config")
@Tag(description = "storageconfig", name = "文件存储配置")
public class SysStorageConfigController {

	private final ISysStorageConfigService sysStorageConfigService;

	@Operation(summary = "文件存储配置列表")
	@SaCheckPermission("upms:storageconfig:page")
	@GetMapping("/page")
	public Result page(Page page, SysStorageConfig sysStorageConfig) {
		return Result.success(sysStorageConfigService.page(page, Wrappers.query(sysStorageConfig)));
	}

	@Operation(summary = "文件存储配置查询")
	@SaCheckPermission("upms:storageconfig:get")
	@GetMapping("/{id}")
	public Result getById(@PathVariable String id) {
		return Result.success(sysStorageConfigService.getById(id));
	}

	@Operation(summary = "文件存储配置新增")
	@SysLog("新增文件存储配置")
	@SaCheckPermission("upms:storageconfig:add")
	@PostMapping
	public Result add(@RequestBody SysStorageConfig sysStorageConfig) {
		return Result.success(sysStorageConfigService.saveStorageConfig(sysStorageConfig));
	}

	@Operation(summary = "文件存储配置修改")
	@SysLog("修改文件存储配置")
	@SaCheckPermission("upms:storageconfig:edit")
	@PutMapping
	public Result edit(@RequestBody SysStorageConfig sysStorageConfig) {
		String id = sysStorageConfig.getId();
		if (StrUtil.isBlank(id)) {
			return Result.fail("文件存储配置主键为空");
		}
		return Result.success(sysStorageConfigService.updateStorageConfigById(sysStorageConfig));
	}

	@Operation(summary = "文件存储配置删除")
	@SysLog("删除文件存储配置")
	@SaCheckPermission("upms:storageconfig:del")
	@DeleteMapping("/{id}")
	public Result del(@PathVariable String id) {
		return Result.success(sysStorageConfigService.removeById(id));
	}

}
