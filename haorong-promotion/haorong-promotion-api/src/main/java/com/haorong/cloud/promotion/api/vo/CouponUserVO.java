/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.promotion.api.vo;

import com.baomidou.mybatisplus.annotation.TableField;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;

/**
 * 用户领券记录
 *
 * @author haorong
 * @date 2022/9/23
 */
@Data
@Schema(description = "用户领券记录")
public class CouponUserVO implements Serializable {

	@Schema(description = "主键")
	private String id;

	/**
	 * 用户领取数量
	 */
	@TableField(exist = false)
	private Long userReceiveCount;

}
