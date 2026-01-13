/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.order.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.haorong.cloud.order.api.entity.OrderItemEntity;

/**
 * 子订单
 *
 * @author haorong
 * @since 2022/3/7 14:18
 */
public interface IOrderItemService extends IService<OrderItemEntity> {

	/**
	 * 查询详情
	 *
	 * @author haorong
	 * @date 2022/7/1
	 * @param id
	 * @return: com.haorong.cloud.mall.common.entity.OrderItem
	 */
	OrderItemEntity getOrderItemById(String id);

}
