/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.product.listener;

import com.haorong.cloud.common.core.constant.RocketMqConstants;
import com.haorong.cloud.common.core.entity.OrderPaySuccessEvent;
import com.haorong.cloud.common.myabtis.tenant.HxTenantContextHolder;
import com.haorong.cloud.product.service.IGoodsSpuService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.spring.annotation.RocketMQMessageListener;
import org.apache.rocketmq.spring.core.RocketMQListener;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

/**
 * 支付成功事件监听器-商品服务
 */
@Slf4j
@Component
@RequiredArgsConstructor
@RocketMQMessageListener(topic = RocketMqConstants.ORDER_PAY_SUCCESS_NOTIFY_TOPIC,
		consumerGroup = "product-service-pay-group")
public class ProductPayEventListener implements RocketMQListener<OrderPaySuccessEvent> {

	private final IGoodsSpuService goodsSpuService;

	@Override
	public void onMessage(OrderPaySuccessEvent orderPaySuccessEvent) {
		HxTenantContextHolder.setTenantId(orderPaySuccessEvent.getTenantId());
		log.info("支付成功事件监听器-商品服务务收到消息：{}", orderPaySuccessEvent);
		if (!CollectionUtils.isEmpty(orderPaySuccessEvent.getItemList())) {
			// 增加销量
			orderPaySuccessEvent.getItemList().forEach(item -> {
				goodsSpuService.updateSalesVolume(item.getSpuId(), item.getBuyQuantity());
			});
		}
	}

}
