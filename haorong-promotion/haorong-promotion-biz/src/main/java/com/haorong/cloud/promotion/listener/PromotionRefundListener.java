/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.promotion.listener;

import com.haorong.cloud.common.core.constant.RocketMqConstants;
import com.haorong.cloud.common.core.entity.OrderRefundSuccessEvent;
import com.haorong.cloud.common.myabtis.tenant.HxTenantContextHolder;
import com.haorong.cloud.promotion.handler.PromotionRefundEventHandler;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.spring.annotation.RocketMQMessageListener;
import org.apache.rocketmq.spring.core.RocketMQListener;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 退款成功事件监听器-营销服务
 */
@Slf4j
@Component
@RequiredArgsConstructor
@RocketMQMessageListener(topic = RocketMqConstants.ORDER_REFUND_SUCCESS_NOTIFY_TOPIC,
		consumerGroup = "promotion-service-refund-group")
public class PromotionRefundListener implements RocketMQListener<OrderRefundSuccessEvent> {

	private final List<PromotionRefundEventHandler> handlers;

	@Override
	public void onMessage(OrderRefundSuccessEvent event) {
		HxTenantContextHolder.setTenantId(event.getTenantId());
		log.info("退款成功事件监听器-营销服务收到消息：{}", event);
		handlers.forEach(handler -> {
			try {
				handler.handle(event);
			}
			catch (Exception e) {
				log.error("退款事件处理失败", e);
			}
		});
	}

}
