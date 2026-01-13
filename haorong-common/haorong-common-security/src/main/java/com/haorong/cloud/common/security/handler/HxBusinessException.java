/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.common.security.handler;

import com.haorong.cloud.common.core.constant.CommonConstants;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 自定义异常
 *
 * @author haorong
 * @date 2022/9/20
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class HxBusinessException extends RuntimeException {

	private Integer code;

	private String msg;

	public HxBusinessException() {
		this.code = CommonConstants.FAIL;
	}

	public HxBusinessException(String msg) {
		this.code = CommonConstants.FAIL;
		this.msg = msg;
	}

	public HxBusinessException(Integer code, String msg) {
		this.code = code;
		this.msg = msg;
	}

}
