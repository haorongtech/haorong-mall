/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.common.core.util;

import cn.hutool.crypto.symmetric.AES;

public class AesUtils {

	private static final String AES_MODE = "ECB";

	private static final String AES_PADDING = "PKCS7Padding";

	public static String decrypt(String encodeKey, String value) {
		AES aes = new AES(AES_MODE, AES_PADDING, encodeKey.getBytes());
		return aes.decryptStr(value);
	}

}
