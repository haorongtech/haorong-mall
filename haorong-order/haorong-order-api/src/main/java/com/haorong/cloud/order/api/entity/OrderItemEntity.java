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
 * 子订单信息
 *
 * @author haorong
 * @since 2022/2/22 14:28
 */
@Data
@Schema(description = "子订单信息")
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName(value = "order_item")
public class OrderItemEntity extends Model<OrderItemEntity> {

	@Schema(description = "主键")
	@TableId(type = IdType.ASSIGN_ID)
	private String id;

	@Schema(description = "订单主键")
	private String orderId;

	@Schema(description = "spuId")
	private String spuId;

	@Schema(description = "skuId")
	private String skuId;

	@Schema(description = "spu名称")
	private String spuName;

	@Schema(description = "商品图")
	private String picUrl;

	@Schema(description = "销售价格（元）")
	private BigDecimal salesPrice;

	@Schema(description = "购买数量")
	private Integer buyQuantity;

	@Schema(description = "总金额（元）")
	private BigDecimal totalPrice;

	@Schema(description = "运费（元）")
	private BigDecimal freightPrice;

	@Schema(description = "优惠券优惠金额（元）")
	private BigDecimal couponPrice;

	@Schema(description = "支付金额（总金额-优惠券优惠金额+运费 = 支付金额）")
	private BigDecimal paymentPrice;

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

	@Schema(description = "状态")
	private String status;

	@Schema(description = "租户id")
	private String tenantId;

	@Schema(description = "规格信息")
	private String specsInfo;

	@TableField(exist = false)
	private OrderRefund orderRefund;

}
