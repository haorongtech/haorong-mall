/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.common.core.desensitization;

import com.haorong.cloud.common.core.config.AbstractDesensitization;

/**
 * 密码脱敏
 *
 * @author haorong
 * @date 2022/5/31
 */
public class PasswordDesensitization extends AbstractDesensitization {

	@Override
	public String serialize(String value) {
		return "******";
	}

}
