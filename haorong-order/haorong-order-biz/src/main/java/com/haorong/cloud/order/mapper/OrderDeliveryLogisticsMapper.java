/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.order.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.haorong.cloud.order.api.entity.OrderDeliveryLogistics;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 发货单物流轨迹
 *
 * @author haorong
 * @since 2025/4/27
 */
@Mapper
public interface OrderDeliveryLogisticsMapper extends BaseMapper<OrderDeliveryLogistics> {

	List<OrderDeliveryLogistics> selectByOrDeliveryId(@Param("deliveryId") String deliveryId);

}
