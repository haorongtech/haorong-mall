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
import com.haorong.cloud.upms.api.entity.SysMaterial;
import com.haorong.cloud.upms.service.ISysMaterialService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

/**
 * 素材
 *
 * @author haorong
 * @since 2022/2/26 16:30
 */
@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/material")
@Tag(description = "material", name = "素材")
public class SysMaterialController {

	private final ISysMaterialService materialService;

	@Operation(summary = "素材列表")
	@SaCheckPermission("upms:material:page")
	@GetMapping("/page")
	public Result<IPage<SysMaterial>> page(Page page, SysMaterial material) {
		IPage<SysMaterial> iPage = materialService.getPage(page, material);
		return Result.success(iPage);
	}

	@SysLog("新增素材")
	@Operation(summary = "素材新增")
	@SaCheckPermission("upms:material:add")
	@PostMapping
	public Result<Boolean> add(@RequestBody SysMaterial material) {
		return Result.success(materialService.save(material));
	}

	@SysLog("修改素材")
	@Operation(summary = "素材修改")
	@SaCheckPermission("upms:material:edit")
	@PutMapping
	public Result<Boolean> edit(@RequestBody SysMaterial material) {
		return Result.success(materialService.updateById(material));
	}

	@SysLog("删除素材")
	@Operation(summary = "素材删除")
	@SaCheckPermission("upms:material:del")
	@DeleteMapping("/{id}")
	public Result<Boolean> del(@PathVariable String id) {
		return Result.success(materialService.removeById(id));
	}

}
