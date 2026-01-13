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
import com.haorong.cloud.product.api.entity.GoodsSpecsValue;
import com.haorong.cloud.product.service.IGoodsSpecsValueService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

/**
 * 商品规格值
 *
 * @author haorong
 * @since 2022/2/26 16:30
 */
@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/goodsspecsvalue")
@Tag(description = "goodsspecsvalue", name = "商品规格值")
public class GoodsSpecsValueController {

	private final IGoodsSpecsValueService goodsSpecsValueService;

	@Operation(summary = "商品规格值列表")
	@SaCheckPermission("product:goodsspecsvalue:page")
	@GetMapping("/page")
	public Result page(Page page, GoodsSpecsValue goodsSpecsValue) {
		return Result.success(goodsSpecsValueService.page(page, Wrappers.query(goodsSpecsValue)));
	}

	@Operation(summary = "查询全部商品规格值")
	@SaCheckPermission("product:goodsspecsvalue:get")
	@GetMapping("/list")
	public Result list(GoodsSpecsValue goodsSpecsValue) {
		return Result.success(goodsSpecsValueService
			.list(Wrappers.lambdaQuery(goodsSpecsValue).select(GoodsSpecsValue::getName, GoodsSpecsValue::getId)));
	}

	@Operation(summary = "商品规格值查询")
	@SaCheckPermission("product:goodsspecsvalue:get")
	@GetMapping("/{id}")
	public Result getById(@PathVariable String id) {
		return Result.success(goodsSpecsValueService.getById(id));
	}

	@SysLog("新增商品规格值")
	@Operation(summary = "商品规格值新增")
	@PostMapping
	public Result add(@RequestBody GoodsSpecsValue goodsSpecsValue) {
		if (goodsSpecsValueService.count(Wrappers.<GoodsSpecsValue>lambdaQuery()
			.eq(GoodsSpecsValue::getSpecsId, goodsSpecsValue.getSpecsId())
			.eq(GoodsSpecsValue::getName, goodsSpecsValue.getName().trim())) > 0) {
			return Result.fail("商品规格值已存在");
		}
		goodsSpecsValueService.save(goodsSpecsValue);
		return Result.success(goodsSpecsValue);
	}

	@SysLog("修改商品规格值")
	@Operation(summary = "商品规格值修改")
	@SaCheckPermission("product:goodsspecsvalue:edit")
	@PutMapping
	public Result edit(@RequestBody GoodsSpecsValue goodsSpecsValue) {
		if (goodsSpecsValueService.count(Wrappers.<GoodsSpecsValue>lambdaQuery()
			.eq(GoodsSpecsValue::getName, goodsSpecsValue.getName().trim())
			.ne(GoodsSpecsValue::getId, goodsSpecsValue.getId())) > 0) {
			return Result.fail("商品规格值已存在");
		}
		return Result.success(goodsSpecsValueService.updateById(goodsSpecsValue));
	}

	@SysLog("删除商品规格值")
	@Operation(summary = "商品规格值删除")
	@SaCheckPermission("product:goodsspecsvalue:del")
	@DeleteMapping("/{id}")
	public Result del(@PathVariable String id) {
		return Result.success(goodsSpecsValueService.removeById(id));
	}

}
