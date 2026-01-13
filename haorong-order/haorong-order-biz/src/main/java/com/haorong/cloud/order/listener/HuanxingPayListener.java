/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.order.listener;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.haorong.cloud.common.core.constant.CommonConstants;
import com.haorong.cloud.common.core.constant.RocketMqConstants;
import com.haorong.cloud.common.myabtis.tenant.HxTenantContextHolder;
import com.haorong.cloud.order.api.entity.OrderInfo;
import com.haorong.cloud.order.api.entity.OrderItemEntity;
import com.haorong.cloud.order.event.HxOrderPayEvent;
import com.haorong.cloud.order.service.IOrderInfoService;
import com.haorong.cloud.order.service.IOrderItemService;
import com.haorong.cloud.pay.api.constants.PayConstants;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.spring.annotation.RocketMQMessageListener;
import org.apache.rocketmq.spring.core.RocketMQListener;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.time.LocalDateTime;
import java.util.List;

@Slf4j
@RequiredArgsConstructor
@Component
@RocketMQMessageListener(topic = RocketMqConstants.PAY_NOTIFY_TOPIC, consumerGroup = RocketMqConstants.PAY_NOTIFY_TOPIC)
public class HuanxingPayListener implements RocketMQListener<String> {

	private final IOrderInfoService orderInfoService;

	private final IOrderItemService orderItemService;

	private final ApplicationEventPublisher applicationEventPublisher;

	@Override
	public void onMessage(String message) {
		final JSONObject msg = JSONObject.parseObject(message);
		final String tenantId = msg.getString(PayConstants.TENANT_ID);
		if (!StringUtils.hasText(tenantId)) {
			log.warn("tenantId empty! ");
			return;
		}
		HxTenantContextHolder.setTenantId(tenantId);
		final String orderNo = msg.getString(PayConstants.OUT_TRADE_NO);
		if (!StringUtils.hasText(orderNo)) {
			log.warn("orderNo empty! ");
			return;
		}

		final LocalDateTime paySuccessTime = msg.getLocalDateTime(PayConstants.PAY_SUCCESS_TIME);
		if (paySuccessTime == null) {
			log.warn("paySuccessTime 为空，忽略消息");
			return;
		}
		final JSONObject extraParams = JSON.parseObject(msg.getString(PayConstants.EXTRA_PARAMS));
		if (extraParams == null || extraParams.isEmpty()) {
			log.warn("extraParams 为空，orderNo: {}", orderNo);
			return;
		}
		final String payType = extraParams.getString(PayConstants.EXTRA_PARAMS_PAY_TYPE);
		if (!StringUtils.hasText(payType)) {
			log.warn("payType empty! orderNo: " + orderNo);
			return;
		}

		final String transactionId = msg.getString(PayConstants.CHANNEL_ORDER_NO);
		OrderInfo orderInfo = orderInfoService
			.getOne(Wrappers.<OrderInfo>lambdaQuery().eq(OrderInfo::getOrderNo, orderNo));

		List<OrderItemEntity> orderItemEntityList = orderItemService
			.list(Wrappers.<OrderItemEntity>lambdaQuery().eq(OrderItemEntity::getOrderId, orderInfo.getId()));
		if (CollectionUtils.isEmpty(orderItemEntityList)) {
			log.warn("order items not found! orderNo: " + orderNo);
			return;
		}

		if (CommonConstants.NO.equals(orderInfo.getPayStatus())) {
			orderInfo.setPaymentTime(paySuccessTime);
			orderInfo.setPaymentType(payType);
			orderInfo.setTransactionId(transactionId);
			applicationEventPublisher.publishEvent(new HxOrderPayEvent(this, orderInfo, orderItemEntityList));
		}

	}

}
