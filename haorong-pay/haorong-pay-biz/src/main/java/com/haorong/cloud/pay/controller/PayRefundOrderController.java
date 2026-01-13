/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.pay.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.haorong.cloud.common.core.util.Result;
import com.haorong.cloud.pay.api.entity.PayRefundOrder;
import com.haorong.cloud.pay.service.IPayRefundOrderService;
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
@RequestMapping("/refundorder")
@RequiredArgsConstructor
@Tag(description = "refundorder", name = "退款订单")
public class PayRefundOrderController {

	private final IPayRefundOrderService payRefundOrderService;

	@Operation(summary = "通过id查询")
	@SaCheckPermission("pay:payrefundorder:get")
	@GetMapping("/{id}")
	public Result getById(@PathVariable("id") String id) {
		return Result.success(payRefundOrderService.getById(id));
	}

	@Operation(summary = "分页查询")
	@SaCheckPermission("pay:payrefundorder:page")
	@GetMapping("/page")
	public Result getPage(Page page, PayRefundOrder payRefundOrder) {
		return Result.success(payRefundOrderService.page(page, Wrappers.query(payRefundOrder)));
	}

}
