/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.pay.handler.impl;

import cn.hutool.json.JSONObject;
import com.alipay.api.AlipayClient;
import com.alipay.api.request.AlipayTradeWapPayRequest;
import com.alipay.api.response.AlipayTradeWapPayResponse;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.haorong.cloud.common.core.constant.CommonConstants;
import com.haorong.cloud.common.core.entity.CallbackPrefixProperties;
import com.haorong.cloud.common.myabtis.tenant.HxTenantContextHolder;
import com.haorong.cloud.common.security.handler.HxBusinessException;
import com.haorong.cloud.pay.api.dto.CreateOrderReqDTO;
import com.haorong.cloud.pay.api.entity.PayTradeOrder;
import com.haorong.cloud.pay.api.enums.PayTerminalTypeEnum;
import com.haorong.cloud.pay.api.enums.PayTradeTypeEnum;
import com.haorong.cloud.pay.config.AliPayConfiguration;
import com.haorong.cloud.pay.handler.AbstractPayOrderHandler;
import com.haorong.cloud.pay.service.IPayTradeOrderService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;

@Service("ALI_H5_PAY")
@RequiredArgsConstructor
public class AlipayH5PayHandler extends AbstractPayOrderHandler {

	private final IPayTradeOrderService payTradeOrderService;

	private final CallbackPrefixProperties callbackPrefixProperties;

	@Override
	public Object doPay(PayTradeOrder payTradeOrder) {
		try {
			String notifyUrl = String.format("%s/%s/notify/alipay/%s/%s", payTradeOrder.getNotifyUrl(),
					callbackPrefixProperties.getPay(), HxTenantContextHolder.getTenantId(),
					payTradeOrder.getTerminalType());
			AlipayClient alipayClient = AliPayConfiguration.getAlipayClient(payTradeOrder.getTerminalType());
			JSONObject bizContent = new JSONObject();
			/****** 必传参数 ******/
			bizContent.set("out_trade_no", payTradeOrder.getOutTradeNo());
			bizContent.set("total_amount", payTradeOrder.getAmount());
			bizContent.set("subject", payTradeOrder.getDescription());
			AlipayTradeWapPayRequest alipayTradeWapPayRequest = new AlipayTradeWapPayRequest();
			// 异步接收地址，仅支持http/https，公网可访问
			alipayTradeWapPayRequest.setNotifyUrl(notifyUrl);
			// 同步跳转地址，仅支持http/https
			alipayTradeWapPayRequest.setReturnUrl(payTradeOrder.getReturnUrl());
			// 用户付款中途退出返回商户网站的地址
			bizContent.set("quit_url", payTradeOrder.getQuitUrl());
			alipayTradeWapPayRequest.setBizContent(bizContent.toString());
			AlipayTradeWapPayResponse alipayTradeWapPayResponse = alipayClient
				.certificateExecute(alipayTradeWapPayRequest);
			if (!alipayTradeWapPayResponse.isSuccess()) {
				throw new HxBusinessException(
						alipayTradeWapPayResponse.getMsg() + alipayTradeWapPayResponse.getSubMsg());
			}
			return alipayTradeWapPayResponse;
		}
		catch (Exception e) {
			throw new HxBusinessException(e.getMessage());
		}
	}

	@Override
	public PayTradeOrder createOrder(CreateOrderReqDTO createOrderReqDTO) {
		// 先查询
		PayTradeOrder payTradeOrder = payTradeOrderService.getOne(Wrappers.<PayTradeOrder>lambdaQuery()
			.eq(PayTradeOrder::getOutTradeNo, createOrderReqDTO.getOutTradeNo())
			.eq(PayTradeOrder::getTerminalType, PayTerminalTypeEnum.H5.getCode()));
		if (null != payTradeOrder) {
			return payTradeOrder;
		}
		payTradeOrder = new PayTradeOrder();
		payTradeOrder.setPayStatus(CommonConstants.NO);
		payTradeOrder.setDescription(createOrderReqDTO.getSubject());
		payTradeOrder.setOpenId(createOrderReqDTO.getBuyerId());
		payTradeOrder.setOutTradeNo(createOrderReqDTO.getOutTradeNo());
		payTradeOrder.setTradeType(PayTradeTypeEnum.ALI_H5_PAY.getName());
		payTradeOrder.setAmount(new BigDecimal(createOrderReqDTO.getTotalAmount()));
		payTradeOrder.setExtra(createOrderReqDTO.getExtra());
		payTradeOrder.setTerminalType(PayTerminalTypeEnum.H5.getCode());
		payTradeOrderService.save(payTradeOrder);
		return payTradeOrder;
	}

}
