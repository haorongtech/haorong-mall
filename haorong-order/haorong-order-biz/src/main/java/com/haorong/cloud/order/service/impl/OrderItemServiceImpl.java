/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.order.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.haorong.cloud.order.api.entity.OrderItemEntity;
import com.haorong.cloud.order.mapper.OrderItemMapper;
import com.haorong.cloud.order.service.IOrderItemService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * 子订单
 *
 * @author haorong
 * @since 2022/3/7 14:18
 */
@Service
@AllArgsConstructor
public class OrderItemServiceImpl extends ServiceImpl<OrderItemMapper, OrderItemEntity> implements IOrderItemService {

	@Override
	public OrderItemEntity getOrderItemById(String id) {
		return baseMapper.selectOrderItemById(id);
	}

}
