/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.pay.handler.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.github.binarywang.wxpay.bean.request.WxPayRefundV3Request;
import com.github.binarywang.wxpay.exception.WxPayException;
import com.haorong.cloud.common.core.entity.CallbackPrefixProperties;
import com.haorong.cloud.common.myabtis.tenant.HxTenantContextHolder;
import com.haorong.cloud.common.security.handler.HxBusinessException;
import com.haorong.cloud.pay.api.dto.CreateRefundsReqDTO;
import com.haorong.cloud.pay.api.entity.PayRefundOrder;
import com.haorong.cloud.pay.api.entity.PayTradeOrder;
import com.haorong.cloud.pay.api.enums.PayRefundOrderStatusEnum;
import com.haorong.cloud.pay.config.WxPayConfiguration;
import com.haorong.cloud.pay.handler.AbstractPayRefundOrderHandler;
import com.haorong.cloud.pay.service.IPayRefundOrderService;
import com.haorong.cloud.pay.service.IPayTradeOrderService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;

@Service("WECHAT_REFUND")
@RequiredArgsConstructor
public class WechatRefundHandler extends AbstractPayRefundOrderHandler {

	private final IPayRefundOrderService payRefundOrderService;

	private final IPayTradeOrderService tradeOrderService;

	private final CallbackPrefixProperties callbackPrefixProperties;

	@Override
	public Object doRefund(PayRefundOrder payRefundOrder) {
		// 查询支付单
		PayTradeOrder payTradeOrder = tradeOrderService.getOne(
				Wrappers.<PayTradeOrder>lambdaQuery().eq(PayTradeOrder::getOutTradeNo, payRefundOrder.getOutTradeNo()));

		String notifyUrl = String.format("%s/%s/notify/refunds/wx/%s/%s", payRefundOrder.getNotifyUrl(),
				callbackPrefixProperties.getPay(), HxTenantContextHolder.getTenantId(),
				payTradeOrder.getTerminalType());

		WxPayRefundV3Request.Amount amount = new WxPayRefundV3Request.Amount();
		amount.setTotal(payRefundOrder.getPayAmount().multiply(BigDecimal.valueOf(100)).intValue());
		amount.setRefund(payRefundOrder.getRefundAmount().multiply(BigDecimal.valueOf(100)).intValue());
		amount.setCurrency("CNY");
		WxPayRefundV3Request wxPayRefundV3Request = new WxPayRefundV3Request();
		wxPayRefundV3Request.setAmount(amount);
		wxPayRefundV3Request.setOutTradeNo(payRefundOrder.getOutTradeNo());
		wxPayRefundV3Request.setOutRefundNo(payRefundOrder.getRefundTradeNo());
		wxPayRefundV3Request.setNotifyUrl(notifyUrl);
		try {
			return WxPayConfiguration.wxPayService(payTradeOrder.getTerminalType()).refundV3(wxPayRefundV3Request);
		}
		catch (WxPayException e) {
			throw new HxBusinessException(e.getReturnMsg());
		}
	}

	@Override
	public PayRefundOrder createRefundOrder(CreateRefundsReqDTO createRefundsReqDTO) {
		PayRefundOrder payRefundOrder = payRefundOrderService.getOne(Wrappers.<PayRefundOrder>lambdaQuery()
			.eq(PayRefundOrder::getChannelRefundNo, createRefundsReqDTO.getRefundTradeNo()));
		if (null != payRefundOrder) {
			return payRefundOrder;
		}
		payRefundOrder = new PayRefundOrder();
		payRefundOrder.setRefundAmount(createRefundsReqDTO.getRefundAmount());
		payRefundOrder.setPayAmount(createRefundsReqDTO.getTotalAmount());
		payRefundOrder.setRefundStatus(PayRefundOrderStatusEnum.STATUS_1.getCode());
		payRefundOrder.setRefundTradeNo(createRefundsReqDTO.getRefundTradeNo());
		payRefundOrder.setNotifyUrl(createRefundsReqDTO.getNotifyUrl());
		payRefundOrder.setOutTradeNo(createRefundsReqDTO.getOutTradeNo());
		payRefundOrder.setExtra(createRefundsReqDTO.getExtra());
		payRefundOrderService.save(payRefundOrder);
		return payRefundOrder;
	}

}
