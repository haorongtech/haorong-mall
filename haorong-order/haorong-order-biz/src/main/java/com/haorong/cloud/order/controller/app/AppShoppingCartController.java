/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.order.controller.app;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.haorong.cloud.common.core.util.Result;
import com.haorong.cloud.common.security.util.SecurityUtils;
import com.haorong.cloud.order.api.entity.ShoppingCart;
import com.haorong.cloud.order.service.IShoppingCartService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 购物车
 *
 * @author haorong
 * @since 2022/3/17 14:44
 */
@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/app/shopping-cart")
@Tag(description = "shoppingcart", name = "购物车-API")
public class AppShoppingCartController {

	private final IShoppingCartService shoppingCartService;

	@Operation(summary = "购物车列表")
	@GetMapping("/page")
	public Result page(Page page, ShoppingCart shoppingCart) {
		shoppingCart.setUserId(SecurityUtils.getUser().getUserId());
		return Result.success(shoppingCartService.apiPage(page, shoppingCart));
	}

	@Operation(summary = "购物车添加")
	@PostMapping
	public Result add(@RequestBody ShoppingCart shoppingCart) {
		shoppingCart.setUserId(SecurityUtils.getUser().getUserId());
		return Result.success(shoppingCartService.saveShoppingCart(shoppingCart));
	}

	@Operation(summary = "购物车修改")
	@PutMapping
	public Result edit(@RequestBody ShoppingCart shoppingCart) {
		shoppingCart.setUserId(SecurityUtils.getUser().getUserId());
		return Result.success(shoppingCartService.updateShoppingCartById(shoppingCart));
	}

	@Operation(summary = "购物车删除")
	@PostMapping("/del")
	public Result del(@RequestBody List<String> ids) {
		return Result.success(shoppingCartService.removeByIds(ids));
	}

	@Operation(summary = "查询购物车数量")
	@GetMapping("/count")
	public Result count() {
		String userId = SecurityUtils.getUser().getUserId();
		if (StrUtil.isEmpty(userId)) {
			return Result.success(0);
		}
		return Result.success(
				shoppingCartService.count(Wrappers.<ShoppingCart>lambdaQuery().eq(ShoppingCart::getUserId, userId)));
	}

}
