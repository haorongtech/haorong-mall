/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.order.api.enums;

/**
 * 订单状态枚举
 *
 * @author haorong
 * @since 2022/3/8 9:55
 */
public enum OrderStatusEnum {

	WAITING_FOR_PAYMENT("1", "待付款"), WAITING_FOR_DELIVERY("2", "待发货"), WAITING_FOR_RECEIPT("3", "待收货"),
	COMPLETED("4", "已完成"), REFUNDING("5", "退款中"), CANCELED("11", "已取消");

	private String code;

	private String desc;

	OrderStatusEnum(String code, String desc) {
		this.code = code;
		this.desc = desc;
	}

	/**
	 * 自己定义一个静态方法,通过code返回枚举描述
	 *
	 * @author haorong
	 * @date 2022/5/31
	 * @param code
	 * @return: java.lang.String
	 */
	public static String getValue(String code) {

		for (OrderStatusEnum orderStatusEnum : values()) {
			if (orderStatusEnum.getCode().equals(code)) {
				return orderStatusEnum.getDesc();
			}
		}
		return null;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

}
