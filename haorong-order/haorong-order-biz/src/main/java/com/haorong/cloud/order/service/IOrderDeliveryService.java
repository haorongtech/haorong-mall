/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.order.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.haorong.cloud.order.api.entity.OrderDelivery;
import com.kuaidi100.sdk.response.SubscribePushParamResp;

/**
 * 发货单
 *
 * @author haorong
 * @since 2022/3/7 14:18
 */
public interface IOrderDeliveryService extends IService<OrderDelivery> {

	/**
	 * 物流轨迹回调
	 * @param orderDelivery
	 * @param subscribePushParamResp
	 */
	void notifyLogistics(OrderDelivery orderDelivery, SubscribePushParamResp subscribePushParamResp);

	/**
	 * 根据订单号获取发货单
	 * @param orderId
	 * @return
	 */
	OrderDelivery getByOrderId(String orderId);

}
