/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.order.controller.app;

import com.haorong.cloud.common.core.util.Result;
import com.haorong.cloud.order.api.entity.OrderItemEntity;
import com.haorong.cloud.order.service.IOrderItemService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 子订单
 *
 * @author haorong
 * @since 2022/3/7 14:01
 */
@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/app/orderitem")
@Tag(description = "app-orderitem", name = "商城子订单-API")
public class AppOrderItemController {

	private final IOrderItemService orderItemService;

	@Operation(summary = "通过订单id查询")
	@GetMapping("/{id}")
	public Result<OrderItemEntity> getById(@PathVariable String id) {
		return Result.success(orderItemService.getOrderItemById(id));
	}

}
