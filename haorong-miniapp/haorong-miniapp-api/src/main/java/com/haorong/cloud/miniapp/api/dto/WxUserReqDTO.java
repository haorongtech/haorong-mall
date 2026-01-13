/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.miniapp.api.dto;

import lombok.Data;

import java.io.Serial;
import java.io.Serializable;

@Data
public class WxUserReqDTO implements Serializable {

	@Serial
	private static final long serialVersionUID = 1L;

	private String openId;

	private String userId;

	private String appId;

	private String wxUserId;

}
