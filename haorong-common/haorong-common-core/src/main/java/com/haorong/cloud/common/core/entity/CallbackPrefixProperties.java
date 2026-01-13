/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.common.core.entity;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

/**
 * 回调前缀配置类
 *
 * @author haorong
 * @date 2025/6/18
 */
@Data
@Configuration
@ConfigurationProperties(prefix = "callback.prefix")
public class CallbackPrefixProperties {

	/**
	 * 支付回调前缀
	 */
	private String pay;

	/**
	 * 物流回调前缀
	 */
	private String logistics;

}
