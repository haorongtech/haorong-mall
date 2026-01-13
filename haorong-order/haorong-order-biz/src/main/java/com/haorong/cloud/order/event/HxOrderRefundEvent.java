/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.order.event;

import com.haorong.cloud.order.api.entity.OrderInfo;
import com.haorong.cloud.order.api.entity.OrderItemEntity;
import com.haorong.cloud.order.api.entity.OrderRefund;
import lombok.Getter;
import org.springframework.context.ApplicationEvent;

/**
 * @author: haorong
 * @date: 2023/4/24 11:57
 */
public class HxOrderRefundEvent extends ApplicationEvent {

	@Getter
	private final OrderRefund orderRefund;

	@Getter
	private final OrderItemEntity orderItemEntity;

	@Getter
	private final OrderInfo orderInfo;

	public HxOrderRefundEvent(Object source, OrderRefund orderRefund, OrderItemEntity orderItemEntity,
			OrderInfo orderInfo) {
		super(source);
		this.orderRefund = orderRefund;
		this.orderItemEntity = orderItemEntity;
		this.orderInfo = orderInfo;
	}

}
