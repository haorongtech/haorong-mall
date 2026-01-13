/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.pay.handler;

import com.haorong.cloud.pay.api.dto.CreateOrderReqDTO;
import com.haorong.cloud.pay.api.entity.PayTradeOrder;

public interface PayOrderHandler {

	/**
	 * 创建订单
	 * @param createOrderReqDTO 预支付参数
	 * @return obj
	 */
	PayTradeOrder createOrder(CreateOrderReqDTO createOrderReqDTO);

	/**
	 * 调起渠道支付
	 * @param createOrderReqDTO 预支付参数
	 * @return obj
	 */
	Object pay(CreateOrderReqDTO createOrderReqDTO);

}
