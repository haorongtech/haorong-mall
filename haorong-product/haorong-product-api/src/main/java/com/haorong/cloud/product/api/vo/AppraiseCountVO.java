/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.product.api.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

@Data
@Schema(description = "评论数量")
public class AppraiseCountVO {

	// 全部
	private Integer allCount;

	// 好评
	private Integer goodCount;

	// 中评
	private Integer badCount;

	// 差评
	private Integer negativeCount;

	// 有图
	private Integer imageCount;

}
