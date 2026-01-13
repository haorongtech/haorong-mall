/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.product.controller.admin;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.haorong.cloud.common.core.util.Result;
import com.haorong.cloud.common.log.annotation.SysLog;
import com.haorong.cloud.product.api.entity.GoodsSpecs;
import com.haorong.cloud.product.service.IGoodsSpecsService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

/**
 * 商品规格
 *
 * @author haorong
 * @since 2022/2/26 16:30
 */
@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/goodsspecs")
@Tag(description = "goodsspecs", name = "商品规格")
public class GoodsSpecsController {

	private final IGoodsSpecsService goodsSpecsService;

	@Operation(summary = "商品规格列表")
	@SaCheckPermission("product:goodsspecs:page")
	@GetMapping("/page")
	public Result page(Page page, GoodsSpecs goodsSpecs) {
		return Result.success(goodsSpecsService.page(page, Wrappers.query(goodsSpecs)));
	}

	@Operation(summary = "查询全部商品规格")
	@SaCheckPermission("product:goodsspecs:get")
	@GetMapping("/list")
	public Result list(GoodsSpecs goodsSpecs) {
		return Result.success(goodsSpecsService
			.list(Wrappers.lambdaQuery(goodsSpecs).select(GoodsSpecs::getName, GoodsSpecs::getId)));
	}

	@Operation(summary = "商品规格查询")
	@SaCheckPermission("product:goodsspecs:get")
	@GetMapping("/{id}")
	public Result getById(@PathVariable String id) {
		return Result.success(goodsSpecsService.getById(id));
	}

	@SysLog("新增商品规格")
	@Operation(summary = "商品规格新增")
	@PostMapping
	public Result add(@RequestBody GoodsSpecs goodsSpecs) {
		if (goodsSpecsService
			.count(Wrappers.<GoodsSpecs>lambdaQuery().eq(GoodsSpecs::getName, goodsSpecs.getName().trim())) > 0) {
			return Result.fail("商品规格已存在");
		}
		goodsSpecsService.save(goodsSpecs);
		return Result.success(goodsSpecs);
	}

	@SysLog("修改商品规格")
	@Operation(summary = "商品规格修改")
	@SaCheckPermission("product:goodsspecs:edit")
	@PutMapping
	public Result edit(@RequestBody GoodsSpecs goodsSpecs) {
		if (goodsSpecsService.count(Wrappers.<GoodsSpecs>lambdaQuery()
			.eq(GoodsSpecs::getName, goodsSpecs.getName().trim())
			.ne(GoodsSpecs::getId, goodsSpecs.getId())) > 0) {
			return Result.fail("商品规格已存在");
		}
		return Result.success(goodsSpecsService.updateById(goodsSpecs));
	}

	@SysLog("删除商品规格")
	@Operation(summary = "商品规格删除")
	@SaCheckPermission("product:goodsspecs:del")
	@DeleteMapping("/{id}")
	public Result del(@PathVariable String id) {
		return Result.success(goodsSpecsService.removeById(id));
	}

}
