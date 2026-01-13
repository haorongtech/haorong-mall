/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.common.sentinel.config;

import com.alibaba.cloud.sentinel.custom.SentinelAutoConfiguration;
import com.alibaba.csp.sentinel.adapter.spring.webmvc_v6x.callback.BlockExceptionHandler;
import com.haorong.cloud.common.sentinel.handler.HxUrlBlockHandler;
import org.springframework.boot.autoconfigure.AutoConfigureBefore;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * sentinel 配置类
 *
 * @author haorong
 */
@Configuration(proxyBeanMethods = false)
@AutoConfigureBefore(SentinelAutoConfiguration.class)
public class HxSentinelAutoConfiguration {

	@Bean
	@ConditionalOnMissingBean
	public BlockExceptionHandler blockExceptionHandler() {
		return new HxUrlBlockHandler();
	}

}
