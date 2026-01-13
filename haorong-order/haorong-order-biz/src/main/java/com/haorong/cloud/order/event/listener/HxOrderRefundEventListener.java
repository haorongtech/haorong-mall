/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.order.event.listener;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.haorong.cloud.common.core.constant.RocketMqConstants;
import com.haorong.cloud.common.core.entity.OrderItemRefundSuccessEvent;
import com.haorong.cloud.common.core.entity.OrderRefundSuccessEvent;
import com.haorong.cloud.order.api.entity.OrderInfo;
import com.haorong.cloud.order.api.entity.OrderItemEntity;
import com.haorong.cloud.order.api.entity.OrderRefund;
import com.haorong.cloud.order.api.enums.OrderArrivalStatusEnum;
import com.haorong.cloud.order.api.enums.OrderItemStatusEnum;
import com.haorong.cloud.order.api.enums.OrderStatusEnum;
import com.haorong.cloud.order.event.HxOrderRefundEvent;
import com.haorong.cloud.order.service.IOrderInfoService;
import com.haorong.cloud.order.service.IOrderItemService;
import com.haorong.cloud.order.service.IOrderRefundService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.spring.core.RocketMQTemplate;
import org.springframework.beans.BeanUtils;
import org.springframework.context.event.EventListener;
import org.springframework.messaging.support.GenericMessage;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import java.util.List;

/**
 * @author: haorong
 * @date: 2023/4/24 11:57
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class HxOrderRefundEventListener {

	private final IOrderRefundService orderRefundService;

	private final IOrderItemService orderItemService;

	private final IOrderInfoService orderInfoService;

	private final RocketMQTemplate rocketMQTemplate;

	/**
	 * 退款单 状态更改
	 * @param event
	 */
	@EventListener(HxOrderRefundEvent.class)
	public void refundStatusEventListener(HxOrderRefundEvent event) {
		// 退款单信息
		OrderRefund orderRefund = event.getOrderRefund();
		if (null == orderRefund) {
			log.warn("orderRefund not found!");
			return;
		}
		orderRefund.setArrivalStatus(OrderArrivalStatusEnum.REFUND_SUCCESS.getCode());
		orderRefundService.updateById(orderRefund);

		OrderItemEntity orderItemEntity = event.getOrderItemEntity();
		orderItemEntity.setStatus(OrderItemStatusEnum.REFUNDED.getCode());
		orderItemService.updateById(orderItemEntity);

		OrderInfo orderInfo = event.getOrderInfo();

		// 查询所有子订单
		List<OrderItemEntity> orderItemEntityList = orderItemService.list(Wrappers.<OrderItemEntity>lambdaQuery()
			.eq(OrderItemEntity::getOrderId, orderRefund.getOrderId())
			.ne(OrderItemEntity::getId, orderItemEntity.getId())
			.ne(OrderItemEntity::getStatus, OrderItemStatusEnum.REFUNDED.getCode()));

		OrderRefundSuccessEvent orderRefundSuccessEvent = new OrderRefundSuccessEvent();
		BeanUtils.copyProperties(orderRefund, orderRefundSuccessEvent);
		orderRefundSuccessEvent.setPaymentType(orderInfo.getPaymentType());

		OrderItemRefundSuccessEvent orderItemRefundSuccessEvent = new OrderItemRefundSuccessEvent();
		BeanUtils.copyProperties(orderItemEntity, orderItemRefundSuccessEvent);
		orderRefundSuccessEvent.setOrderItem(orderItemRefundSuccessEvent);
		// 判断是否全部完成退款
		if (CollectionUtils.isEmpty(orderItemEntityList)) {
			// 取消订单
			OrderInfo info = new OrderInfo();
			info.setId(orderRefund.getOrderId());
			info.setStatus(OrderStatusEnum.CANCELED.getCode());
			orderInfoService.updateById(info);
			orderRefundSuccessEvent.setCouponUserId(orderInfo.getCouponUserId());
		}
		rocketMQTemplate.syncSend(RocketMqConstants.ORDER_REFUND_SUCCESS_NOTIFY_TOPIC,
				new GenericMessage<>(orderRefundSuccessEvent), RocketMqConstants.TIME_OUT);
	}

}
