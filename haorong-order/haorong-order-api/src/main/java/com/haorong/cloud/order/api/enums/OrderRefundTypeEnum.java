/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.order.api.enums;

public enum OrderRefundTypeEnum {

	ONLY_REFUND("1", "仅退款"), RETURN_AND_REFUND("2", "退货退款");

	private final String code;

	private final String description;

	OrderRefundTypeEnum(String code, String description) {
		this.code = code;
		this.description = description;
	}

	public String getCode() {
		return code;
	}

	public String getDescription() {
		return description;
	}

	public static OrderRefundTypeEnum fromCode(String code) {
		for (OrderRefundTypeEnum status : values()) {
			if (status.code.equals(code)) {
				return status;
			}
		}
		throw new IllegalArgumentException("未知的售后类型状态码: " + code);
	}

}
