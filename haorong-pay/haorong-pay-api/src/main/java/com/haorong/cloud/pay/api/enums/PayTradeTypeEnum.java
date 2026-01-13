/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.pay.api.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
public enum PayTradeTypeEnum {

	/**
	 * 微信JSAPI支付
	 */
	WX_JSAPI_PAY("WX_JSAPI_PAY", "微信JSAPI支付"),

	/**
	 * 微信APP支付
	 */
	WX_APP_PAY("WX_APP_PAY", "微信APP支付"),

	/**
	 * 支付宝APP支付
	 */
	ALI_APP_PAY("ALI_APP_PAY", "支付宝APP支付"),

	/**
	 * 支付宝H5支付
	 */
	ALI_H5_PAY("ALI_H5_PAY", "支付宝H5支付"),

	/**
	 * 支付宝JSAPI支付
	 */
	ALI_JSAPI_PAY("ALI_JSAPI_PAY", "支付宝JSAPI支付"),

	/**
	 * 0元支付
	 */
	FREE_PAY("FREE_PAY", "0元支付");

	/**
	 * 名称
	 */
	@Getter
	private String name;

	/**
	 * 描述
	 */
	private String description;

}
