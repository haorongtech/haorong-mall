/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.order.api.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * 商城退款单
 *
 * @author haorong
 * @date 2022/5/31
 */
@Data
@Schema(description = "商城退款单")
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName(value = "order_refund")
public class OrderRefund extends Model<OrderRefund> {

	@Schema(description = "主键")
	@TableId(type = IdType.ASSIGN_ID)
	private String id;

	@Schema(description = "订单主键")
	private String orderId;

	@Schema(description = "订单项主键")
	private String orderItemId;

	@Schema(description = "退款状态")
	private String status;

	@Schema(description = "退款状态：0.未退款；1.退款中；2.退款成功；3.退款失败；")
	private String arrivalStatus;

	@Schema(description = "退款金额")
	private BigDecimal refundAmount;

	@Schema(description = "退款流水号")
	private String refundTradeNo;

	@Schema(description = "退款原因")
	private String refundReason;

	@Schema(description = "拒绝退款原因")
	private String refuseReason;

	@TableField(fill = FieldFill.INSERT)
	@Schema(description = "创建人")
	private String createBy;

	@TableField(fill = FieldFill.UPDATE)
	@Schema(description = "修改人")
	private String updateBy;

	@TableField(fill = FieldFill.INSERT)
	@Schema(description = "创建时间")
	private LocalDateTime createTime;

	@TableField(fill = FieldFill.UPDATE)
	@Schema(description = "修改时间")
	private LocalDateTime updateTime;

	@TableLogic
	@TableField(fill = FieldFill.INSERT)
	@Schema(description = "逻辑删除：0.显示；1.隐藏；")
	private String delFlag;

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

	@Schema(description = "子订单信息")
	@TableField(exist = false)
	private OrderItemEntity orderItem;

	@Schema(description = "操作状态：2.拒绝；4.退款")
	@TableField(exist = false)
	private String operateStatus;

}
