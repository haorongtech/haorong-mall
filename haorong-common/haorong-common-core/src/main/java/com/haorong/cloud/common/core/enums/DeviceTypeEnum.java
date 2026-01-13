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
 * @author haorong
 * @description 登录设备类型枚举
 * @date 2024/05/06 13:52
 */
@Getter
@AllArgsConstructor
public enum DeviceTypeEnum {

	TOB("TOB"), TOC("TOC");

	private final String device;

}
