/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.pay.api.enums;

public enum PayTerminalTypeEnum {

	MINI_PROGRAM("0", "小程序"), APP("1", "App"), H5("2", "H5"), PC("3", "PC"), OFFICIAL_ACCOUNT("4", "公众号");

	private final String code;

	private final String desc;

	PayTerminalTypeEnum(String code, String desc) {
		this.code = code;
		this.desc = desc;
	}

	public String getCode() {
		return code;
	}

	public String getDesc() {
		return desc;
	}

	public static PayTerminalTypeEnum fromCode(String code) {
		for (PayTerminalTypeEnum type : PayTerminalTypeEnum.values()) {
			if (type.getCode().equals(code)) {
				return type;
			}
		}
		return null;
	}

}
