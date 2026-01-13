/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.pay.controller.app;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.haorong.cloud.common.core.util.Result;
import com.haorong.cloud.pay.api.entity.PayTradeOrder;
import com.haorong.cloud.pay.service.IPayTradeOrderService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/app/order")
@RequiredArgsConstructor
@Tag(description = "order", name = "支付订单")
public class AppPayOrderController {

	private final IPayTradeOrderService payTradeOrderService;

	@Operation(summary = "通过订单号查询")
	@GetMapping("/{orderNo}")
	public Result getOrder(@PathVariable("orderNo") String orderNo) {
		return Result.success(payTradeOrderService
			.getOne(Wrappers.<PayTradeOrder>lambdaQuery().eq(PayTradeOrder::getOutTradeNo, orderNo)));
	}

}
