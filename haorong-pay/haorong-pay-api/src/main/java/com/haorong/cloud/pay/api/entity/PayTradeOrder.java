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
 * 支付订单
 *
 * @author haorong
 * @since 2022/3/18 10:07
 */
@Data
@Schema(description = "支付订单")
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName(value = "pay_trade_order")
public class PayTradeOrder extends Model<PayTradeOrder> {

	@Schema(description = "主键")
	@TableId(type = IdType.ASSIGN_ID)
	private String id;

	@Schema(description = "渠道号")
	private String channelMchId;

	@Schema(description = "商户订单号")
	private String outTradeNo;

	@Schema(description = "订单描述")
	private String description;

	@Schema(description = "交易类型")
	private String tradeType;

	@Schema(description = "用户id（openid、支付宝buyerId）")
	private String openId;

	@Schema(description = "支付状态：0.待支付；1.已支付；")
	private String payStatus;

	@Schema(description = "渠道订单号")
	private String channelOrderNo;

	@Schema(description = "额外参数")
	private String extra;

	@Schema(description = "渠道支付错误码")
	private String errCode;

	@Schema(description = "渠道支付错误描述")
	private String errMsg;

	@Schema(description = "支付成功时间")
	private LocalDateTime paySuccessTime;

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

	@Schema(description = "金额")
	private BigDecimal amount;

	@Schema(description = "同步跳转地址，仅支持http/https")
	private String returnUrl;

	@Schema(description = "用户付款中途退出返回商户网站的地址")
	private String quitUrl;

	@Schema(description = "支付端类型：0-小程序，1-App，2-H5，3-PC，4-公众号")
	private String terminalType;

	@Schema(description = "用户Id")
	private String userId;

}
