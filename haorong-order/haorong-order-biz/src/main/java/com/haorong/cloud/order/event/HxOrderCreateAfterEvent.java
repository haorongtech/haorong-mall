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
 * 订单创建后事件
 *
 * @author: haorong
 * @date: 2024/6/01 11:57
 */
public class HxOrderCreateAfterEvent extends ApplicationEvent {

	@Getter
	private final OrderInfo orderInfo;

	@Getter
	private final List<OrderItemEntity> orderItemEntityList;

	/**
	 * 订单创建方式：1.购物车下单；2.普通购买下单
	 */
	@Getter
	private final String createWay;

	public HxOrderCreateAfterEvent(Object source, OrderInfo orderInfo, List<OrderItemEntity> orderItemEntityList,
			String createWay) {
		super(source);
		this.orderInfo = orderInfo;
		this.orderItemEntityList = orderItemEntityList;
		this.createWay = createWay;
	}

}
