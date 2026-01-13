/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.common.job.config;

import com.haorong.cloud.common.job.properties.XxlJobProperties;
import com.xxl.job.core.executor.impl.XxlJobSpringExecutor;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.util.StringUtils;

/**
 * xxlJob调度任务配置
 *
 * @author haorong
 * @date 2022/6/2
 */
@Configuration(proxyBeanMethods = false)
@EnableAutoConfiguration
@EnableConfigurationProperties(XxlJobProperties.class)
public class XxlJobConfig {

	@Bean
	public XxlJobSpringExecutor xxlJobExecutor(XxlJobProperties xxlJobProperties, Environment environment) {
		XxlJobSpringExecutor xxlJobSpringExecutor = new XxlJobSpringExecutor();
		xxlJobSpringExecutor.setAdminAddresses(xxlJobProperties.getAdminAddresses());
		String appName = xxlJobProperties.getAppName();
		if (!StringUtils.hasText(appName)) {
			appName = environment.getProperty("spring.application.name");
		}
		xxlJobSpringExecutor.setAppname(appName);
		xxlJobSpringExecutor.setIp(xxlJobProperties.getIp());
		xxlJobSpringExecutor.setPort(xxlJobProperties.getPort());
		xxlJobSpringExecutor.setAccessToken(xxlJobProperties.getAccessToken());
		xxlJobSpringExecutor.setLogPath(xxlJobProperties.getLogPath());
		xxlJobSpringExecutor.setLogRetentionDays(xxlJobProperties.getLogRetentionDays());
		return xxlJobSpringExecutor;
	}

}
