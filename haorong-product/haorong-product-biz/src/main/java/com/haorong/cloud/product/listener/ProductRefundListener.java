/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.product.listener;

import com.haorong.cloud.common.core.constant.RocketMqConstants;
import com.haorong.cloud.common.core.entity.OrderItemRefundSuccessEvent;
import com.haorong.cloud.common.core.entity.OrderRefundSuccessEvent;
import com.haorong.cloud.common.myabtis.tenant.HxTenantContextHolder;
import com.haorong.cloud.product.api.dto.GoodsSkuStockReqDTO;
import com.haorong.cloud.product.service.IGoodsSkuService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.rocketmq.spring.annotation.RocketMQMessageListener;
import org.apache.rocketmq.spring.core.RocketMQListener;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * 退款成功事件监听器-商品服务
 */
@Slf4j
@Component
@RequiredArgsConstructor
@RocketMQMessageListener(topic = RocketMqConstants.ORDER_REFUND_SUCCESS_NOTIFY_TOPIC,
		consumerGroup = "product-service-refund-group")
public class ProductRefundListener implements RocketMQListener<OrderRefundSuccessEvent> {

	private final IGoodsSkuService goodsSkuService;

	@Override
	public void onMessage(OrderRefundSuccessEvent orderRefundSuccessEvent) {
		HxTenantContextHolder.setTenantId(orderRefundSuccessEvent.getTenantId());
		log.info("退款成功事件监听器-商品服务务收到消息：{}", orderRefundSuccessEvent);
		OrderItemRefundSuccessEvent orderItem = orderRefundSuccessEvent.getOrderItem();
		GoodsSkuStockReqDTO goodsSkuStockRqDTO = new GoodsSkuStockReqDTO();
		goodsSkuStockRqDTO.setStockNum(orderItem.getBuyQuantity());
		goodsSkuStockRqDTO.setSkuId(orderItem.getSkuId());
		goodsSkuStockRqDTO.setSpuId(orderItem.getSpuId());
		List<GoodsSkuStockReqDTO> goodsSkuStockRqDTOList = new ArrayList<>();
		goodsSkuStockRqDTOList.add(goodsSkuStockRqDTO);
		goodsSkuService.rollbackStockList(goodsSkuStockRqDTOList);
	}

}
