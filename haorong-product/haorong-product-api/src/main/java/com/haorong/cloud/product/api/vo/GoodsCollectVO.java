/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.product.api.vo;

import com.haorong.cloud.product.api.entity.GoodsSpu;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
@Schema(description = "用户收藏VO")
public class GoodsCollectVO {

	@Schema(description = "主键")
	private String id;

	@Schema(description = "用户主键")
	private String userId;

	@Schema(description = "商品id")
	private String spuId;

	@Schema(description = "加入时价格（元）")
	private BigDecimal salesPrice;

	@Schema(description = "创建时间")
	private LocalDateTime createTime;

	@Schema(description = "商品信息")
	private GoodsSpu goodsSpu;

}
