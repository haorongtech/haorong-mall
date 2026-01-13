/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.promotion.api.enums;

/**
 * 用户优惠券状态 状态：0.未使用；1.已使用；2.已过期；3.冻结；
 *
 * @author haorong
 * @since 2022/10/28 14:10
 */
public enum CouponUserStatusEnum {

	/** 未使用 */
	STATUS_0("0", "未使用"),
	/** 已使用 */
	STATUS_1("1", "已使用"),
	/** 已过期 */
	STATUS_2("2", "已过期"),
	/** 冻结 */
	STATUS_3("3", "冻结");

	/** code */
	private String code;

	/** 描述 */
	private String desc;

	CouponUserStatusEnum(String code, String desc) {
		this.code = code;
		this.desc = desc;
	}

	/**
	 * 自己定义一个静态方法,通过code返回枚举描述
	 *
	 * @author haorong
	 * @date 2022/6/16
	 * @param code
	 * @return: java.lang.String
	 */
	public static String getValue(String code) {

		for (CouponUserStatusEnum couponUserStatusEnum : values()) {
			if (couponUserStatusEnum.getCode().equals(code)) {
				return couponUserStatusEnum.getDesc();
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
