/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.order.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.haorong.cloud.order.api.entity.OrderDeliveryLogistics;
import com.haorong.cloud.order.mapper.OrderDeliveryLogisticsMapper;
import com.haorong.cloud.order.service.IOrderDeliveryLogisticsService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * 发货单物流轨迹
 *
 * @author haorong
 * @since 2022/3/7 14:18
 */
@Service
@RequiredArgsConstructor
public class OrderDeliveryLogisticsServiceImpl extends ServiceImpl<OrderDeliveryLogisticsMapper, OrderDeliveryLogistics>
		implements IOrderDeliveryLogisticsService {

}
