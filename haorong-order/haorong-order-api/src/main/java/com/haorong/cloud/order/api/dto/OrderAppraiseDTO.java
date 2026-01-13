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

import java.util.List;

@Data
@Schema(description = "订单评价DTO")
public class OrderAppraiseDTO {

	@Schema(description = "spuId")
	private String spuId;

	@Schema(description = "订单主键")
	private String orderId;

	@Schema(description = "子订单主键")
	private String orderItemId;

	@Schema(description = "用户主键")
	private String userId;

	@Schema(description = "头像")
	private String avatarUrl;

	@Schema(description = "昵称")
	private String nickName;

	@Schema(description = "图片")
	private List<String> picUrls;

	@Schema(description = "商品评分")
	private Integer goodsScore;

	@Schema(description = "物流评分")
	private Integer logisticsScore;

	@Schema(description = "服务评分")
	private Integer serviceScore;

	@Schema(description = "评论内容")
	private String content;

}
