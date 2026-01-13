/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.common.core.entity;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
public class OrderRefundSuccessEvent {

	@Schema(description = "主键")
	private String id;

	@Schema(description = "订单主键")
	private String orderId;

	@Schema(description = "订单项主键")
	private String orderItemId;

	@Schema(description = "退款状态")
	private String status;

	@Schema(description = "退款到账状态：0.未退款；1.退款中；2.退款成功；3.退款失败；")
	private String arrivalStatus;

	@Schema(description = "退款金额")
	private BigDecimal refundAmount;

	@Schema(description = "退款流水号")
	private String refundTradeNo;

	@Schema(description = "退款原因")
	private String refundReason;

	@Schema(description = "拒绝退款原因")
	private String refuseReason;

	@Schema(description = "退款入账账户")
	private String userReceivedAccount;

	@Schema(description = "退款单号")
	private String refundId;

	@Schema(description = "用户Id")
	private String userId;

	@Schema(description = "租户id")
	private String tenantId;

	@Schema(description = "退款类型")
	private String refundType;

	@Schema(description = "用户优惠券id")
	private String couponUserId;

	@Schema(description = "支付类型")
	private String paymentType;

	private OrderItemRefundSuccessEvent orderItem;

}
