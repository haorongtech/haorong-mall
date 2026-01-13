/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.order.api.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotEmpty;
import lombok.Data;

import java.util.List;

/**
 * 发货单
 *
 * @author lijia
 * @date 2025/4/27
 */

@Data
public class OrderDeliveryDTO {

	@Schema(description = "订单ID")
	@NotEmpty(message = "订单ID不能为空")
	private String orderId;

	@Schema(description = "物流公司编码")
	@NotEmpty(message = "物流公司编码不能为空")
	private String logisticsCompanyCode;

	@Schema(description = "物流公司名称")
	@NotEmpty(message = "物流公司名称不能为空")
	private String logisticsCompanyName;

	@Schema(description = "物流单号")
	@NotEmpty(message = "物流单号不能为空")
	private String logisticsNo;

}
