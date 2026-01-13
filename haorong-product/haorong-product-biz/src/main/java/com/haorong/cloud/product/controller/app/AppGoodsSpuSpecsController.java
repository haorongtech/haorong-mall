/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.product.controller.app;

import com.haorong.cloud.common.core.util.Result;
import com.haorong.cloud.product.api.entity.GoodsSpuSpecs;
import com.haorong.cloud.product.service.IGoodsSpuSpecsService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 商品sku关联规格值
 *
 * @author haorong
 * @since 2022/3/1 10:13
 */
@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/app/goodsspuspecs")
@Tag(description = "app-goodsspuspecs", name = "商品规格-API")
public class AppGoodsSpuSpecsController {

	private final IGoodsSpuSpecsService goodsSpuSpecsService;

	@Operation(summary = "商品spu规格列表")
	@GetMapping("/list")
	public Result list(GoodsSpuSpecs goodsSpuSpecs) {
		return Result.success(goodsSpuSpecsService.getList(goodsSpuSpecs));
	}

}
