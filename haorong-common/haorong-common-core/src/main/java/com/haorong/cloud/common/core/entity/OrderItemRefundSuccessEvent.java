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

/**
 * 订单项支付成功内部事件实体
 *
 * @author haorong
 * @date 2025/4/8
 */
@Data
public class OrderItemRefundSuccessEvent {

	@Schema(description = "spuId")
	private String spuId;

	@Schema(description = "skuId")
	private String skuId;

	@Schema(description = "购买数量")
	private Integer buyQuantity;

}
