/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.pay.api.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * 退款订单
 *
 * @author haorong
 * @since 2022/3/18 10:07
 */
@Data
@Schema(description = "退款订单")
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName(value = "pay_refund_order")
public class PayRefundOrder extends Model<PayRefundOrder> {

	@Schema(description = "主键")
	@TableId(type = IdType.ASSIGN_ID)
	private String id;

	@Schema(description = "渠道号")
	private String channelMchId;

	@Schema(description = "渠道退款单号")
	private String channelRefundNo;

	@Schema(description = "退款状态：0.待退款；1.退款中；2.已退款；3.退款失败；4.待确认")
	private String refundStatus;

	@Schema(description = "商户退款单号")
	private String refundTradeNo;

	@Schema(description = "额外参数")
	private String extra;

	@Schema(description = "渠道退款错误码")
	private String errCode;

	@Schema(description = "渠道退款错误描述")
	private String errMsg;

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

	@Schema(description = "租户id")
	private String tenantId;

	@Schema(description = "通知地址")
	private String notifyUrl;

	@Schema(description = "支付金额")
	private BigDecimal payAmount;

	@Schema(description = "退款金额（元）")
	private BigDecimal refundAmount;

	@Schema(description = "商户支付订单号")
	private String outTradeNo;

	@Schema(description = "退款成功时间")
	private LocalDateTime refundSuccessTime;

	@Schema(description = "用户ID")
	private String userId;

}
