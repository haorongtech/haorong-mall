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
import com.haorong.cloud.upms.api.entity.SysDictValue;
import com.haorong.cloud.upms.service.ISysDictValueService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.web.bind.annotation.*;

/**
 * 字典键值
 *
 * @author haorong
 * @date 2022/10/21
 */
@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/dictvalue")
@Tag(description = "dictvalue", name = "字典键值")
public class SysDictValueController {

	private final ISysDictValueService sysDictValueService;

	@Operation(summary = "字典键值列表")
	@SaCheckPermission("upms:sysdictvalue:page")
	@GetMapping("/page")
	public Result page(Page page, SysDictValue sysDictValue) {
		return Result.success(sysDictValueService.page(page, Wrappers.query(sysDictValue)));
	}

	@Operation(summary = "字典键值查询")
	@SaCheckPermission("upms:sysdictvalue:get")
	@GetMapping("/{id}")
	public Result getById(@PathVariable String id) {
		return Result.success(sysDictValueService.getById(id));
	}

	@Operation(summary = "字典键值新增")
	@SysLog("新增字典键值")
	@SaCheckPermission("upms:sysdictvalue:add")
	@PostMapping
	public Result add(@RequestBody SysDictValue sysDictValue) {
		return Result.success(sysDictValueService.saveDictValue(sysDictValue));
	}

	@Operation(summary = "字典键值修改")
	@SysLog("修改字典键值")
	@SaCheckPermission("upms:sysdictvalue:edit")
	@PutMapping
	@CacheEvict(value = CacheConstants.DICT_CACHE, allEntries = true)
	public Result edit(@RequestBody SysDictValue sysDictValue) {
		return Result.success(sysDictValueService.updateById(sysDictValue));
	}

	@Operation(summary = "字典键值删除")
	@SysLog("删除字典键值")
	@SaCheckPermission("upms:sysdictvalue:del")
	@DeleteMapping("/{id}")
	@CacheEvict(value = CacheConstants.DICT_CACHE, allEntries = true)
	public Result del(@PathVariable String id) {
		return Result.success(sysDictValueService.removeById(id));
	}

	@Operation(summary = "通过字典类型查询字典键值")
	@GetMapping("/type/{type}")
	@Cacheable(value = CacheConstants.DICT_CACHE, key = "#type", unless = "#result.data.isEmpty()")
	public Result getValueByDictType(@PathVariable String type) {
		return Result.success(
				sysDictValueService.list(Wrappers.<SysDictValue>lambdaQuery().eq(SysDictValue::getDictType, type)));
	}

}
