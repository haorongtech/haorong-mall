/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.upms.api.dto;

import lombok.Data;

import java.io.Serial;
import java.io.Serializable;

/**
 * 注册租户
 *
 * @author haorong
 * @date 2022/1115
 */
@Data
public class RegisterTenantDTO implements Serializable {

	@Serial
	private static final long serialVersionUID = 1L;

	/**
	 * 公司名称
	 */
	private String name;

	/**
	 * 手机号
	 */
	private String phone;

	/**
	 * 套餐
	 */
	private String packageId;

}
