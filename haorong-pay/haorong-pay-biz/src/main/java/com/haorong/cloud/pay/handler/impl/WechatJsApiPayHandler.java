/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.pay.handler.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.github.binarywang.wxpay.bean.request.WxPayUnifiedOrderV3Request;
import com.github.binarywang.wxpay.bean.result.enums.TradeTypeEnum;
import com.github.binarywang.wxpay.exception.WxPayException;
import com.github.binarywang.wxpay.service.WxPayService;
import com.haorong.cloud.common.core.constant.CommonConstants;
import com.haorong.cloud.common.core.entity.CallbackPrefixProperties;
import com.haorong.cloud.common.myabtis.tenant.HxTenantContextHolder;
import com.haorong.cloud.common.security.handler.HxBusinessException;
import com.haorong.cloud.pay.api.constants.PayConstants;
import com.haorong.cloud.pay.api.dto.CreateOrderReqDTO;
import com.haorong.cloud.pay.api.entity.PayTradeOrder;
import com.haorong.cloud.pay.api.enums.PayTerminalTypeEnum;
import com.haorong.cloud.pay.api.enums.PayTradeTypeEnum;
import com.haorong.cloud.pay.config.WxPayConfiguration;
import com.haorong.cloud.pay.handler.AbstractPayOrderHandler;
import com.haorong.cloud.pay.service.IPayTradeOrderService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;

@Service("WX_JSAPI_PAY")
@RequiredArgsConstructor
public class WechatJsApiPayHandler extends AbstractPayOrderHandler {

	private final IPayTradeOrderService payTradeOrderService;

	private final CallbackPrefixProperties callbackPrefixProperties;

	@Override
	public Object doPay(PayTradeOrder payTradeOrder) {
		String notifyUrl = String.format("%s/%s/notify/wx/%s/%s", payTradeOrder.getNotifyUrl(),
				callbackPrefixProperties.getPay(), HxTenantContextHolder.getTenantId(),
				payTradeOrder.getTerminalType());
		WxPayUnifiedOrderV3Request wxPayUnifiedOrderV3Request = new WxPayUnifiedOrderV3Request();
		wxPayUnifiedOrderV3Request.setOutTradeNo(payTradeOrder.getOutTradeNo());
		wxPayUnifiedOrderV3Request.setDescription(payTradeOrder.getDescription());
		wxPayUnifiedOrderV3Request.setNotifyUrl(notifyUrl);
		// 订单金额 start
		WxPayUnifiedOrderV3Request.Amount amount = new WxPayUnifiedOrderV3Request.Amount();
		amount.setTotal(payTradeOrder.getAmount().multiply(BigDecimal.valueOf(100)).intValue());
		amount.setCurrency(PayConstants.CURRENCY);
		wxPayUnifiedOrderV3Request.setAmount(amount);
		// 订单金额 end
		// 支付者 start
		WxPayUnifiedOrderV3Request.Payer payer = new WxPayUnifiedOrderV3Request.Payer();
		payer.setOpenid(payTradeOrder.getOpenId());
		wxPayUnifiedOrderV3Request.setPayer(payer);
		// 支付者 end
		WxPayService wxPayService = WxPayConfiguration.wxPayService(payTradeOrder.getTerminalType());
		try {
			return wxPayService.createOrderV3(TradeTypeEnum.JSAPI, wxPayUnifiedOrderV3Request);
		}
		catch (WxPayException e) {
			throw new HxBusinessException(e.getMessage());
		}
	}

	@Override
	public PayTradeOrder createOrder(CreateOrderReqDTO createOrderReqDTO) {
		// 先查询
		PayTradeOrder payTradeOrder = payTradeOrderService.getOne(Wrappers.<PayTradeOrder>lambdaQuery()
			.eq(PayTradeOrder::getOutTradeNo, createOrderReqDTO.getOutTradeNo())
			.eq(PayTradeOrder::getTerminalType, PayTerminalTypeEnum.MINI_PROGRAM.getCode()));
		if (null != payTradeOrder) {
			return payTradeOrder;
		}
		payTradeOrder = new PayTradeOrder();
		payTradeOrder.setPayStatus(CommonConstants.NO);
		payTradeOrder.setDescription(createOrderReqDTO.getSubject());
		payTradeOrder.setOpenId(createOrderReqDTO.getBuyerId());
		payTradeOrder.setOutTradeNo(createOrderReqDTO.getOutTradeNo());
		payTradeOrder.setTradeType(PayTradeTypeEnum.WX_JSAPI_PAY.getName());
		payTradeOrder.setAmount(new BigDecimal(createOrderReqDTO.getTotalAmount()));
		payTradeOrder.setNotifyUrl(createOrderReqDTO.getNotifyUrl());
		payTradeOrder.setExtra(createOrderReqDTO.getExtra());
		payTradeOrder.setTerminalType(PayTerminalTypeEnum.MINI_PROGRAM.getCode());
		payTradeOrderService.save(payTradeOrder);
		return payTradeOrder;
	}

}
