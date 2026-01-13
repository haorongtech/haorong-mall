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

import java.time.LocalDateTime;

/**
 * 回调通知记录
 *
 * @author haorong
 * @since 2022/3/18 10:07
 */
@Data
@Schema(description = "回调通知记录")
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName(value = "pay_notify_record")
public class PayNotifyRecord extends Model<PayNotifyRecord> {

	@Schema(description = "主键")
	@TableId(type = IdType.ASSIGN_ID)
	private String id;

	@Schema(description = "商户订单号")
	private String outTradeNo;

	@Schema(description = "渠道订单号")
	private String channelOrderNo;

	@Schema(description = "请求报文")
	private String request;

	@Schema(description = "响应报文")
	private String response;

	@TableField(fill = FieldFill.INSERT)
	@Schema(description = "创建人")
	private String createBy;

	@TableField(fill = FieldFill.INSERT)
	@Schema(description = "创建时间")
	private LocalDateTime createTime;

	@TableLogic
	@TableField(fill = FieldFill.INSERT)
	@Schema(description = "逻辑删除：0.显示；1.隐藏；")
	private String delFlag;

	@Schema(description = "租户id")
	private String tenantId;

	@Schema(description = "回调类型：1.支付回调；2.退款回调")
	private String type;

}
