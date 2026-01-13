/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.product.controller.app;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.haorong.cloud.common.core.util.Result;
import com.haorong.cloud.common.security.util.SecurityUtils;
import com.haorong.cloud.product.api.entity.GoodsCollect;
import com.haorong.cloud.product.service.IGoodsCollectService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/app/collect")
@Tag(description = "collect", name = "用户收藏-API")
public class AppGoodsCollectController {

	private final IGoodsCollectService userCollectService;

	@Operation(summary = "用户收藏列表")
	@GetMapping("/page")
	public Result page(Page page, GoodsCollect userCollect) {
		userCollect.setUserId(SecurityUtils.getUser().getUserId());
		return Result.success(userCollectService.getPage(page, userCollect));
	}

	@Operation(summary = "新增用户收藏")
	@PostMapping
	public Result save(@RequestBody GoodsCollect userCollect) {
		userCollect.setUserId(SecurityUtils.getUser().getUserId());
		return Result.success(userCollectService.saveCollect(userCollect));
	}

	@Operation(summary = "用户取消收藏")
	@DeleteMapping("/{id}")
	public Result delete(@PathVariable("id") String id) {
		return Result.success(userCollectService.removeById(id));
	}

	@Operation(summary = "查询用户收藏数量")
	@GetMapping("/count")
	public Result count() {
		return Result.success(userCollectService.count(
				Wrappers.<GoodsCollect>lambdaQuery().eq(GoodsCollect::getUserId, SecurityUtils.getUser().getUserId())));
	}

	@Operation(summary = "购物车移入收藏夹")
	@PostMapping("/save-batch")
	public Result saveBatch(@RequestBody List<GoodsCollect> goodsCollectList) {
		return Result.success(userCollectService.saveBatchCollect(goodsCollectList));
	}

}
