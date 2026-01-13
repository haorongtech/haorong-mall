/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.common.core.util;

import cn.hutool.core.util.IdUtil;

/**
 * 全局唯一ID工具类
 *
 * @author haorong
 * @since 2022/3/14 16:24
 */
public class SnowflakeIdUtils {

	/**
	 * 订单编号
	 *
	 * @author haorong
	 * @date 2022/7/2
	 * @return: java.lang.String
	 */
	public static String orderNo() {
		return IdUtil.getSnowflake(1, 1).nextIdStr();
	}

	/**
	 * 退款单号
	 *
	 * @author haorong
	 * @date 2022/7/2
	 * @return: java.lang.String
	 */
	public static String refundOrderNo() {
		return IdUtil.getSnowflake(1, 2).nextIdStr();
	}

}
