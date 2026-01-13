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
import lombok.Getter;
import org.springframework.context.ApplicationEvent;

import java.util.List;

/**
 * @author: haorong
 * @date: 2023/4/24 11:57
 */
public class HxOrderPayEvent extends ApplicationEvent {

	@Getter
	private final OrderInfo order;

	@Getter
	private final List<OrderItemEntity> orderItemEntityList;

	public HxOrderPayEvent(Object source, OrderInfo order, List<OrderItemEntity> orderItemEntityList) {
		super(source);
		this.order = order;
		this.orderItemEntityList = orderItemEntityList;
	}

}
