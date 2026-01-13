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
import com.haorong.cloud.product.api.entity.GoodsFootprint;
import com.haorong.cloud.product.service.IGoodsFootprintService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

/**
 * 用户足迹
 *
 * @author haorong
 * @since 2022/2/23 13:11
 */
@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/app/footprint")
@Tag(description = "footprint", name = "用户足迹-API")
public class AppGoodsFootprintController {

	private final IGoodsFootprintService userFootprintService;

	@Operation(summary = "用户足迹列表")
	@GetMapping("/page")
	public Result page(Page page, GoodsFootprint userFootprint) {
		userFootprint.setUserId(SecurityUtils.getUser().getUserId());
		return Result.success(userFootprintService.apiPage(page, Wrappers.lambdaQuery(userFootprint)));
	}

	@Operation(summary = "删除足迹")
	@DeleteMapping("/{id}")
	public Result del(@PathVariable String id) {
		return Result.success(userFootprintService.removeById(id));
	}

	@Operation(summary = "新增足迹")
	@PostMapping
	public Result add(@RequestBody GoodsFootprint userFootprint) {
		userFootprint.setUserId(SecurityUtils.getUser().getUserId());
		return Result.success(userFootprintService.save(userFootprint));
	}

}
