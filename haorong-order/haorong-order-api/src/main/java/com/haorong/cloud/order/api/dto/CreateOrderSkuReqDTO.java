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

import java.math.BigDecimal;

/**
 * 订单商品DTO
 *
 * @author haorong
 * @date 2022/6/10
 */
@Data
@Schema(description = "订单商品DTO")
public class CreateOrderSkuReqDTO {

	@Schema(description = "spuId")
	private String spuId;

	@Schema(description = "skuId")
	private String skuId;

	@Schema(description = "购买数量")
	private Integer quantity;

	@Schema(description = "运费（元）")
	private BigDecimal freightPrice;

	@Schema(description = "优惠券优惠金额（元）")
	private BigDecimal couponPrice;

	@Schema(description = "支付金额（总金额-优惠券优惠金额+运费 = 支付金额）")
	private BigDecimal paymentPrice;

}
