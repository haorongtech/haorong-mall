/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.order.api.enums;

/**
 * 商城订单项状态枚举
 *
 * @author haorong
 * @date 2022/5/31
 */
public enum OrderItemStatusEnum {

	PAID("1", "待发货"), SHIPPED("2", "已发货"), AFTER_SALE_PROCESSING("3", "售后处理中"), REFUNDED("6", "退款完成"),
	COMPLETED("8", "已完成"),;

	private final String code;

	private final String description;

	OrderItemStatusEnum(String code, String description) {
		this.code = code;
		this.description = description;
	}

	public String getCode() {
		return code;
	}

	public String getDescription() {
		return description;
	}

	public static OrderItemStatusEnum fromCode(String code) {
		for (OrderItemStatusEnum status : values()) {
			if (status.code.equals(code)) {
				return status;
			}
		}
		throw new IllegalArgumentException("未知的订单商品状态码: " + code);
	}

}
