/**
 * Copyright (c) 2025 沈阳浩荣科技有限公司
 * All rights reserved.
 * <p>
 * 注意：
 * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。
 */
package com.haorong.cloud.product.api.vo;

import com.alibaba.fastjson2.JSONArray;
import com.baomidou.mybatisplus.annotation.TableField;
import com.haorong.cloud.common.myabtis.handler.JsonArrayTypeHandler;
import lombok.Data;

@Data
public class GoodsFootprintDayVO {

	private String browseDate;

	@TableField(typeHandler = JsonArrayTypeHandler.class)
	private JSONArray items;

}
