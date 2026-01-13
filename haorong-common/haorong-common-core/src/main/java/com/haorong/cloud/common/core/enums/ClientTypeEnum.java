/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.common.core.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 客户端类型
 *
 * @author haorong
 * @since 2022/3/10 14:10
 */
@Getter
@AllArgsConstructor
public enum ClientTypeEnum {

	/** 微信小程序 */
	WX_MA("WX_MA", "微信小程序"),
	/** 普通H5 */
	H5("H5", "普通H5"),
	/** APP */
	APP("APP", "APP");

	/** code */
	private final String code;

	/** 描述 */
	private final String desc;

	/**
	 * 自己定义一个静态方法,通过code返回枚举描述
	 *
	 * @author haorong
	 * @date 2022/6/16
	 * @param code
	 * @return: java.lang.String
	 */
	public static String getValue(String code) {

		for (ClientTypeEnum clientTypeEnum : values()) {
			if (clientTypeEnum.getCode().equals(code)) {
				return clientTypeEnum.getDesc();
			}
		}
		return null;
	}

}
