/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.upms.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.haorong.cloud.common.core.util.Result;
import com.haorong.cloud.common.log.annotation.SysLog;
import com.haorong.cloud.upms.api.entity.SysMaterialGroup;
import com.haorong.cloud.upms.service.ISysMaterialGroupService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 素材分组
 *
 * @author haorong
 * @since 2022/2/26 16:29
 */
@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/materialgroup")
@Tag(description = "materialgroup", name = "素材分组")
public class SysMaterialGroupController {

	private final ISysMaterialGroupService materialGroupService;

	@Operation(summary = "素材分组列表")
	@SaCheckPermission("upms:materialgroup:page")
	@GetMapping("/page")
	public Result<IPage<SysMaterialGroup>> page(Page page, SysMaterialGroup sysMaterialGroup) {
		IPage<SysMaterialGroup> iPage = materialGroupService.getPage(page, sysMaterialGroup);
		return Result.success(iPage);
	}

	@Operation(summary = "素材分组列表")
	@SaCheckPermission("upms:materialgroup:get")
	@GetMapping("/list")
	public Result<List<SysMaterialGroup>> list(SysMaterialGroup sysMaterialGroup) {
		return Result.success(materialGroupService.getList(sysMaterialGroup));
	}

	@SysLog("新增素材分组")
	@Operation(summary = "素材分组新增")
	@SaCheckPermission("upms:materialgroup:add")
	@PostMapping
	public Result<Boolean> add(@RequestBody SysMaterialGroup sysMaterialGroup) {
		return Result.success(materialGroupService.save(sysMaterialGroup));
	}

	@SysLog("修改素材分组")
	@Operation(summary = "素材分组修改")
	@SaCheckPermission("upms:materialgroup:edit")
	@PutMapping
	public Result<Boolean> edit(@RequestBody SysMaterialGroup sysMaterialGroup) {
		return Result.success(materialGroupService.updateById(sysMaterialGroup));
	}

	@SysLog("删除素材分组")
	@Operation(summary = "素材分组删除")
	@SaCheckPermission("upms:materialgroup:del")
	@DeleteMapping("/{id}")
	public Result<Boolean> del(@PathVariable String id) {
		return Result.success(materialGroupService.removeById(id));
	}

}
