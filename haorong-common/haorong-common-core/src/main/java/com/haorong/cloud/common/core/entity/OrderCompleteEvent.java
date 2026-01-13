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
 * 订单完成内部事件实体
 *
 * @author haorong
 * @date 2025/4/8
 */
@Data
public class OrderCompleteEvent {

	@Schema(description = "订单主键")
	private String orderId;

	@Schema(description = "订单编号")
	private String orderNo;

	@Schema(description = "spuId")
	private String spuId;

	@Schema(description = "租户ID")
	private String tenantId;

	@Schema(description = "用户ID")
	private String userId;

}
