/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.order.event.listener;

import com.haorong.cloud.common.core.constant.CommonConstants;
import com.haorong.cloud.common.core.constant.RocketMqConstants;
import com.haorong.cloud.common.core.entity.OrderItemPaySuccessEvent;
import com.haorong.cloud.common.core.entity.OrderPaySuccessEvent;
import com.haorong.cloud.order.api.constant.MallOrderConstants;
import com.haorong.cloud.order.api.entity.OrderInfo;
import com.haorong.cloud.order.api.entity.OrderItemEntity;
import com.haorong.cloud.order.api.enums.OrderItemStatusEnum;
import com.haorong.cloud.order.api.enums.OrderStatusEnum;
import com.haorong.cloud.order.event.HxOrderPayEvent;
import com.haorong.cloud.order.service.IOrderInfoService;
import com.haorong.cloud.order.service.IOrderItemService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.spring.core.RocketMQTemplate;
import org.springframework.beans.BeanUtils;
import org.springframework.context.event.EventListener;
import org.springframework.messaging.support.GenericMessage;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

/**
 * 支付成功事件监听
 *
 * @author: haorong
 * @date: 2023/4/24 11:57
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class HxOrderPayEventListener {

	private final IOrderInfoService orderInfoService;

	private final RocketMQTemplate rocketMQTemplate;

	private final IOrderItemService orderItemService;

	/**
	 * 订单状态修改
	 * @param event
	 */
	@EventListener(HxOrderPayEvent.class)
	public void hxPayEventListener(HxOrderPayEvent event) {
		// 获取订单信息
		OrderInfo orderInfo = event.getOrder();
		if (null == orderInfo) {
			log.warn("order not found!");
			return;
		}

		if (orderInfo.getDeliveryWay().equals(MallOrderConstants.DELIVERY_WAY_2)) {
			orderInfo.setStatus(OrderStatusEnum.WAITING_FOR_RECEIPT.getCode());
		}
		else {
			orderInfo.setStatus(OrderStatusEnum.WAITING_FOR_DELIVERY.getCode());
		}
		orderInfo.setPayStatus(CommonConstants.YES);
		orderInfoService.updateById(orderInfo);

		List<OrderItemEntity> orderItemEntityList = event.getOrderItemEntityList();
		orderItemEntityList.forEach(orderItem -> {
			if (orderInfo.getDeliveryWay().equals(MallOrderConstants.DELIVERY_WAY_2)) {
				orderItem.setStatus(OrderItemStatusEnum.SHIPPED.getCode());
			}
			else {
				orderItem.setStatus(OrderItemStatusEnum.PAID.getCode());
			}
		});
		orderItemService.updateBatchById(orderItemEntityList);

		OrderPaySuccessEvent orderPaySuccessEvent = new OrderPaySuccessEvent();
		BeanUtils.copyProperties(orderInfo, orderPaySuccessEvent);
		orderPaySuccessEvent.setOrderId(orderInfo.getId());

		List<OrderItemPaySuccessEvent> orderItemPaySuccessEventList = orderItemEntityList.stream().map(item -> {
			OrderItemPaySuccessEvent orderItemPaySuccessEvent = new OrderItemPaySuccessEvent();
			BeanUtils.copyProperties(item, orderItemPaySuccessEvent);
			orderItemPaySuccessEvent.setOrderId(orderInfo.getId());
			return orderItemPaySuccessEvent;
		}).collect(Collectors.toList());
		orderPaySuccessEvent.setItemList(orderItemPaySuccessEventList);

		// 通知销量增加、优惠券更改状态
		rocketMQTemplate.syncSend(RocketMqConstants.ORDER_PAY_SUCCESS_NOTIFY_TOPIC,
				new GenericMessage<>(orderPaySuccessEvent), RocketMqConstants.TIME_OUT);
	}

}
