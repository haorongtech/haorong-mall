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
import com.haorong.cloud.common.core.constant.CacheConstants;
import com.haorong.cloud.common.core.util.Result;
import com.haorong.cloud.common.log.annotation.SysLog;
import com.haorong.cloud.upms.api.entity.SysDict;
import com.haorong.cloud.upms.service.ISysDictService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.web.bind.annotation.*;

/**
 * 字典
 *
 * @author haorong
 * @date 2022/10/21
 */
@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/dict")
@Tag(description = "dict", name = "字典")
public class SysDictController {

	private final ISysDictService sysDictService;

	@Operation(summary = "字典列表")
	@SaCheckPermission("upms:sysdict:page")
	@GetMapping("/page")
	public Result page(Page page, SysDict sysDict) {
		return Result.success(sysDictService.page(page, Wrappers.query(sysDict)));
	}

	@Operation(summary = "字典查询")
	@SaCheckPermission("upms:sysdict:get")
	@GetMapping("/{id}")
	public Result getById(@PathVariable String id) {
		return Result.success(sysDictService.getById(id));
	}

	@Operation(summary = "字典新增")
	@SysLog("新增字典")
	@SaCheckPermission("upms:sysdict:add")
	@PostMapping
	@CacheEvict(value = CacheConstants.DICT_CACHE, allEntries = true)
	public Result add(@RequestBody SysDict sysDict) {
		return Result.success(sysDictService.save(sysDict));
	}

	@Operation(summary = "字典修改")
	@SysLog("修改字典")
	@SaCheckPermission("upms:sysdict:edit")
	@PutMapping
	@CacheEvict(value = CacheConstants.DICT_CACHE, allEntries = true)
	public Result edit(@RequestBody SysDict sysDict) {
		return Result.success(sysDictService.updateById(sysDict));
	}

	@Operation(summary = "字典删除")
	@SysLog("删除字典")
	@SaCheckPermission("upms:sysdict:del")
	@DeleteMapping("/{id}")
	@CacheEvict(value = CacheConstants.DICT_CACHE, allEntries = true)
	public Result del(@PathVariable String id) {
		return Result.success(sysDictService.removeById(id));
	}

	@Operation(summary = "字典缓存刷新")
	@GetMapping("/refresh")
	@CacheEvict(value = CacheConstants.DICT_CACHE, allEntries = true)
	public Result refreshCache() {
		return Result.success();
	}

}
