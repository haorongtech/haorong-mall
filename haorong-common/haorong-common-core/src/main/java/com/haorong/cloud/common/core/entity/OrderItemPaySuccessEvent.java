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

/**
 * 订单项支付成功内部事件实体
 *
 * @author haorong
 * @date 2025/4/8
 */
@Data
public class OrderItemPaySuccessEvent {

	@Schema(description = "主键")
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

	@Schema(description = "支付金额（总金额-优惠券优惠金额+运费 = 支付金额）")
	private BigDecimal paymentPrice;

	@Schema(description = "规格信息")
	private String specsInfo;

}
