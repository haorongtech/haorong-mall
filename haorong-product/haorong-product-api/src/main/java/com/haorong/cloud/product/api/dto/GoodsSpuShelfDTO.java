/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.product.api.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.util.List;

@Data
@Schema(description = "商品上下架")
public class GoodsSpuShelfDTO implements Serializable {

	@Serial
	private static final long serialVersionUID = 1L;

	@NotEmpty(message = "状态不能为空")
	private String status;

	@NotNull(message = "商品不能为空")
	private List<String> spuIds;

}
