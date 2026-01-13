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
import com.github.binarywang.wxpay.bean.notify.WxPayNotifyV3Response;
import com.haorong.cloud.common.core.util.Result;
import com.haorong.cloud.common.myabtis.tenant.HxTenantContextHolder;
import com.haorong.cloud.pay.api.constants.PayConstants;
import com.haorong.cloud.pay.api.entity.PayNotifyRecord;
import com.haorong.cloud.pay.service.IPayNotifyRecordService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@RequestMapping("/notify")
@RequiredArgsConstructor
@Tag(description = "notify", name = "支付回调")
public class PayNotifyRecordController {

	private final IPayNotifyRecordService payNotifyRecordService;

	@Operation(summary = "微信支付回调通知")
	@PostMapping("/wx/{tenantId}/{terminalType}")
	public String notifyOrderWx(@PathVariable("tenantId") String tenantId,
			@PathVariable("terminalType") String terminalType, @RequestBody String notifyData) {
		if (!StringUtils.hasText(tenantId)) {
			return WxPayNotifyV3Response.fail("无效的tenantId");
		}
		HxTenantContextHolder.setTenantId(tenantId);
		return payNotifyRecordService.wxPayNotify(tenantId, terminalType, notifyData);
	}

	@Operation(summary = "支付宝支付回调")
	@PostMapping("/alipay/{tenantId}/{terminalType}")
	public String notifyOrderAli(@PathVariable("tenantId") String tenantId,
			@PathVariable("terminalType") String terminalType, HttpServletRequest request) {
		if (!StringUtils.hasText(tenantId)) {
			return PayConstants.ALIPAY_FAIL;
		}
		HxTenantContextHolder.setTenantId(tenantId);
		return payNotifyRecordService.aliPayNotify(tenantId, terminalType, request);
	}

	@Operation(summary = "微信退款回调通知")
	@PostMapping("/refunds/wx/{tenantId}/{terminalType}")
	public String notifyRefundOrderWx(@PathVariable("tenantId") String tenantId,
			@PathVariable("terminalType") String terminalType, @RequestBody String notifyData) {
		if (!StringUtils.hasText(tenantId)) {
			return WxPayNotifyV3Response.fail("无效的tenantId");
		}
		HxTenantContextHolder.setTenantId(tenantId);
		return payNotifyRecordService.wxPayRefundNotify(tenantId, terminalType, notifyData);
	}

	@Operation(summary = "通过id查询")
	@SaCheckPermission("pay:paynotifyrecord:get")
	@GetMapping("/{id}")
	public Result getById(@PathVariable("id") String id) {
		return Result.success(payNotifyRecordService.getById(id));
	}

	@Operation(summary = "分页查询")
	@SaCheckPermission("pay:paynotifyrecord:page")
	@GetMapping("/page")
	public Result getPage(Page page, PayNotifyRecord payNotifyRecord) {
		return Result.success(payNotifyRecordService.page(page, Wrappers.query(payNotifyRecord)));
	}

}
