/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.order.api.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

@Data
@Schema(description = "订单消费者DTO")
public class OrderConsumerDTO {

	@Schema(description = "订单ID")
	private String orderId;

	@Schema(description = "租户id")
	private String tenantId;

	@Schema(description = "退款流水号")
	private String refundTradeNo;

	@Schema(description = "订单单号")
	private String orderNo;

}
