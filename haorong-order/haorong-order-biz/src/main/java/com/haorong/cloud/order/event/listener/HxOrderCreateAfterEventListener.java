/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.order.event.listener;

import com.haorong.cloud.common.core.constant.RocketMqConstants;
import com.haorong.cloud.common.myabtis.tenant.HxTenantContextHolder;
import com.haorong.cloud.order.api.constant.MallOrderConstants;
import com.haorong.cloud.order.api.dto.OrderConsumerDTO;
import com.haorong.cloud.order.api.entity.OrderConfig;
import com.haorong.cloud.order.api.entity.OrderInfo;
import com.haorong.cloud.order.api.entity.OrderItemEntity;
import com.haorong.cloud.order.event.HxOrderCreateAfterEvent;
import com.haorong.cloud.order.service.IOrderConfigService;
import com.haorong.cloud.order.service.IShoppingCartService;
import com.haorong.cloud.promotion.api.dto.CouponUserReqDTO;
import com.haorong.cloud.promotion.api.enums.CouponUserStatusEnum;
import com.haorong.cloud.promotion.api.remote.RemoteCouponUserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.DubboReference;
import org.apache.rocketmq.spring.core.RocketMQTemplate;
import org.springframework.context.event.EventListener;
import org.springframework.messaging.support.GenericMessage;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.Objects;

/**
 * 创建订单后事件监听
 *
 * @author: haorong
 * @date: 2023/4/24 11:57
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class HxOrderCreateAfterEventListener {

	private final RocketMQTemplate rocketMQTemplate;

	@DubboReference
	private final RemoteCouponUserService remoteCouponUserService;

	private final IShoppingCartService shoppingCartService;

	private final IOrderConfigService orderConfigService;

	/**
	 * 清除购物车
	 * @param event
	 */
	@Async
	@EventListener(HxOrderCreateAfterEvent.class)
	public void clearShoppingCartEventListener(HxOrderCreateAfterEvent event) {
		if (!MallOrderConstants.ORDER_CREATE_WAY_1.equals(event.getCreateWay())) {
			return;
		}
		final OrderInfo orderInfo = event.getOrderInfo();
		final List<OrderItemEntity> orderItemEntityList = event.getOrderItemEntityList();
		shoppingCartService.clear(orderInfo.getUserId(),
				orderItemEntityList.stream()
					.map(OrderItemEntity::getSpuId)
					.distinct() // 去重，如果有可能有重复的商品ID
					.toList());
	}

	/**
	 * rocketmq 延迟消息 30分钟取消订单
	 * @param event
	 */
	@Async
	@EventListener(HxOrderCreateAfterEvent.class)
	public void sendMqEventListener(HxOrderCreateAfterEvent event) {
		OrderConfig orderConfig = orderConfigService.getConfig();
		if (Objects.isNull(orderConfig)) {
			return;
		}

		int level = StringUtils.hasText(orderConfig.getOrderCancelTimeout())
				? Integer.parseInt(orderConfig.getOrderCancelTimeout()) : RocketMqConstants.ORDER_CANCEL_LEVEL;
		final OrderInfo orderInfo = event.getOrderInfo();
		OrderConsumerDTO orderConsumerDTO = new OrderConsumerDTO();
		orderConsumerDTO.setOrderId(orderInfo.getId());
		orderConsumerDTO.setTenantId(HxTenantContextHolder.getTenantId());
		rocketMQTemplate.syncSend(RocketMqConstants.ORDER_CANCEL_TOPIC, new GenericMessage<>(orderConsumerDTO),
				RocketMqConstants.TIME_OUT, level);
	}

	/**
	 * TODO 发送微信小程序模板消息
	 * @param event
	 */
	@Async
	@EventListener(HxOrderCreateAfterEvent.class)
	public void sendWxMsgEventListener(HxOrderCreateAfterEvent event) {
		log.info("sendWxMsgEventListener");
	}

	/**
	 * 修改使用的优惠券状态
	 * @param event
	 */
	@Async
	@EventListener(HxOrderCreateAfterEvent.class)
	public void updateUserCouponStatusEventListener(HxOrderCreateAfterEvent event) {
		final OrderInfo orderInfo = event.getOrderInfo();
		if (!StringUtils.hasText(orderInfo.getCouponUserId())) {
			return;
		}
		CouponUserReqDTO couponUserReqDTO = new CouponUserReqDTO();
		couponUserReqDTO.setId(orderInfo.getCouponUserId());
		couponUserReqDTO.setCouponUserStatusEnum(CouponUserStatusEnum.STATUS_3);
		remoteCouponUserService.updateCouponUserStatus(couponUserReqDTO);

	}

}
