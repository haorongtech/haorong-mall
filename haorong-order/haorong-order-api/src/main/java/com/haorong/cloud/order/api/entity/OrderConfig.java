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

import java.time.LocalDateTime;

/**
 * 订单配置
 *
 * @author haorong
 * @date 2025/5/27
 */
@Data
@Schema(description = "订单配置")
@EqualsAndHashCode(callSuper = true)
@TableName(value = "order_config")
public class OrderConfig extends Model<OrderConfig> {

	@Schema(description = "主键")
	@TableId(type = IdType.ASSIGN_ID)
	private String id;

	@Schema(description = "通知地址")
	private String notifyUrl;

	@Schema(description = "订单超时取消时间级别")
	private String orderCancelTimeout;

	@Schema(description = "订单确认收货时间（天）")
	private Integer orderAutoConfirmDays;

	@Schema(description = "订单评价时间（天）")
	private Integer orderAutoCommentDays;

	@Schema(description = "快递100AppKey")
	private String kuaidi100AppKey;

	@Schema(description = "备注")
	private String remark;

	@Schema(description = "状态")
	private String status;

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

	@TableField(fill = FieldFill.INSERT)
	@Schema(description = "创建人")
	private String createBy;

	@TableField(fill = FieldFill.UPDATE)
	@Schema(description = "修改人")
	private String updateBy;

	@Schema(description = "租户ID")
	private String tenantId;

	@Schema(description = "微信发货状态")
	private String wxDeliveryStatus;

}
