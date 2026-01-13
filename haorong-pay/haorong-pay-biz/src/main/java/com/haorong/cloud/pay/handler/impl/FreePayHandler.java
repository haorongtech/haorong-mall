/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.pay.handler.impl;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.haorong.cloud.common.core.constant.CommonConstants;
import com.haorong.cloud.common.core.constant.RocketMqConstants;
import com.haorong.cloud.common.myabtis.tenant.HxTenantContextHolder;
import com.haorong.cloud.pay.api.constants.PayConstants;
import com.haorong.cloud.pay.api.dto.CreateOrderReqDTO;
import com.haorong.cloud.pay.api.entity.PayTradeOrder;
import com.haorong.cloud.pay.api.enums.PayTradeTypeEnum;
import com.haorong.cloud.pay.handler.AbstractPayOrderHandler;
import com.haorong.cloud.pay.service.IPayTradeOrderService;
import lombok.RequiredArgsConstructor;
import org.apache.rocketmq.spring.core.RocketMQTemplate;
import org.springframework.messaging.support.GenericMessage;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Service("FREE_PAY")
@RequiredArgsConstructor
public class FreePayHandler extends AbstractPayOrderHandler {

	private final IPayTradeOrderService payTradeOrderService;

	private final RocketMQTemplate rocketMQTemplate;

	@Override
	@Transactional(rollbackFor = Exception.class)
	public Object doPay(PayTradeOrder payTradeOrder) {
		// 发送mq支付成功消息
		payTradeOrder.setPayStatus(CommonConstants.YES);
		payTradeOrder.setPaySuccessTime(LocalDateTime.now());
		payTradeOrderService.updateById(payTradeOrder);
		// rocketmq 通知
		JSONObject jsonObject = new JSONObject();
		jsonObject.put(PayConstants.OUT_TRADE_NO, payTradeOrder.getOutTradeNo());
		jsonObject.put(PayConstants.CHANNEL_ORDER_NO, payTradeOrder.getChannelOrderNo());
		jsonObject.put(PayConstants.PAY_SUCCESS_TIME, payTradeOrder.getPaySuccessTime());
		jsonObject.put(PayConstants.EXTRA_PARAMS, payTradeOrder.getExtra());
		jsonObject.put(PayConstants.TENANT_ID, HxTenantContextHolder.getTenantId());
		JSONObject json = JSON.parseObject(payTradeOrder.getExtra());
		rocketMQTemplate.syncSend(json.getString("mqNotifyUrl"), new GenericMessage<>(jsonObject),
				RocketMqConstants.TIME_OUT);
		return payTradeOrder;
	}

	@Override
	public PayTradeOrder createOrder(CreateOrderReqDTO createOrderReqDTO) {
		// 先查询
		PayTradeOrder payTradeOrder = payTradeOrderService.getOne(Wrappers.<PayTradeOrder>lambdaQuery()
			.eq(PayTradeOrder::getOutTradeNo, createOrderReqDTO.getOutTradeNo()));
		if (null != payTradeOrder) {
			return payTradeOrder;
		}
		payTradeOrder = new PayTradeOrder();
		payTradeOrder.setUserId(createOrderReqDTO.getUserId());
		payTradeOrder.setPayStatus(CommonConstants.NO);
		payTradeOrder.setDescription(createOrderReqDTO.getSubject());
		payTradeOrder.setOpenId(createOrderReqDTO.getBuyerId());
		payTradeOrder.setOutTradeNo(createOrderReqDTO.getOutTradeNo());
		payTradeOrder.setTradeType(PayTradeTypeEnum.FREE_PAY.getName());
		payTradeOrder.setAmount(new BigDecimal(createOrderReqDTO.getTotalAmount()));
		payTradeOrder.setExtra(createOrderReqDTO.getExtra());
		payTradeOrder.setChannelOrderNo(createOrderReqDTO.getOutTradeNo());
		payTradeOrderService.save(payTradeOrder);

		return payTradeOrder;
	}

}
