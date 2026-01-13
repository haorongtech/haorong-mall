/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.common.core.entity;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

/**
 * 订单支付成功内部事件实体
 *
 * @author haorong
 * @date 2025/4/8
 */

@Data
public class OrderPaySuccessEvent implements Serializable {

	private String orderId;

	private String orderNo;

	private String userId;

	private String paymentType;

	private BigDecimal paymentPrice;

	private BigDecimal freightPrice;

	private String couponUserId;

	private String tenantId;

	private BigDecimal totalPrice;

	private LocalDateTime paymentTime;

	private List<OrderItemPaySuccessEvent> itemList;

}
