/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.order.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.haorong.cloud.order.api.entity.OrderItemEntity;
import org.apache.ibatis.annotations.Mapper;

import java.io.Serializable;
import java.util.List;

/**
 * 子订单
 *
 * @author haorong
 * @since 2022/2/26 16:32
 */
@Mapper
public interface OrderItemMapper extends BaseMapper<OrderItemEntity> {

	/**
	 * 通过订单ID查询子订单列表
	 *
	 * @author haorong
	 * @date 2022/6/11
	 * @param orderId
	 * @return: java.util.List<com.haorong.cloud.mall.common.entity.OrderItem>
	 */
	List<OrderItemEntity> selectByOrderId(String orderId);

	/**
	 * 查询子订单详情
	 *
	 * @author haorong
	 * @date 2022/7/2
	 * @param id
	 * @return: com.haorong.cloud.mall.common.entity.OrderItem
	 */
	OrderItemEntity selectOrderItemById(Serializable id);

}
