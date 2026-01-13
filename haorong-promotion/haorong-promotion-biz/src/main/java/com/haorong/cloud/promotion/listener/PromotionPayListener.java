/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.promotion.listener;

import com.haorong.cloud.common.core.constant.RocketMqConstants;
import com.haorong.cloud.common.core.entity.OrderPaySuccessEvent;
import com.haorong.cloud.common.myabtis.tenant.HxTenantContextHolder;
import com.haorong.cloud.promotion.handler.PromotionPayEventHandler;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.spring.annotation.RocketMQMessageListener;
import org.apache.rocketmq.spring.core.RocketMQListener;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 支付成功事件监听器-营销服务
 */
@Slf4j
@Component
@RequiredArgsConstructor
@RocketMQMessageListener(topic = RocketMqConstants.ORDER_PAY_SUCCESS_NOTIFY_TOPIC,
		consumerGroup = "promotion-service-pay-group")
public class PromotionPayListener implements RocketMQListener<OrderPaySuccessEvent> {

	private final List<PromotionPayEventHandler> handlers;

	@Override
	public void onMessage(OrderPaySuccessEvent orderPaySuccessEvent) {
		HxTenantContextHolder.setTenantId(orderPaySuccessEvent.getTenantId());
		log.info("支付成功事件监听器-营销服务收到消息：{}", orderPaySuccessEvent);
		handlers.forEach(handler -> {
			try {
				handler.handle(orderPaySuccessEvent);
			}
			catch (Exception e) {
				log.error("支付事件处理失败", e);
			}
		});
	}

}
