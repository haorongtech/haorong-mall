/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.miniapp.api.dto;

import jakarta.validation.constraints.NotEmpty;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;

/**
 * 微信用户DTO
 *
 * @author haorong
 * @date 2022/6/11
 */
@Data
public class WxUserLoginReqDTO implements Serializable {

	@Serial
	private static final long serialVersionUID = 1L;

	@NotEmpty(message = "appId不能为空")
	private String appId;

	private String jsCode;

	private String mallUserId;

	private String clientType;

	private String wxUserId;

	private String code;

}
