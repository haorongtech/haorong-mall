/**
 * Copyright (c) 2025 沈阳浩荣科技有限公司
 * All rights reserved.
 * <p>
 * 注意：
 * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。
 * 仅供购买并获得正式授权的客户使用，侵权必究。
 */
package com.haorong.cloud.common.datasource;

import com.baomidou.dynamic.datasource.creator.DefaultDataSourceCreator;
import com.baomidou.dynamic.datasource.provider.DynamicDataSourceProvider;
import com.haorong.cloud.common.datasource.config.HrDataSourceProperties;
import com.haorong.cloud.common.datasource.config.JdbcDynamicDataSourceProvider;
import org.springframework.boot.autoconfigure.AutoConfigureAfter;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Lazy;

@Configuration
@EnableConfigurationProperties
@AutoConfigureAfter(DataSourceAutoConfiguration.class)
public class HrDataSourceAutoConfiguration {

	@Bean
	@Lazy
	public HrDataSourceProperties druidDataSourceProperties() {
		return new HrDataSourceProperties();
	}

	@Bean
	public DynamicDataSourceProvider dynamicDataSourceProvider(DefaultDataSourceCreator defaultDataSourceCreator) {
		return new JdbcDynamicDataSourceProvider(defaultDataSourceCreator, druidDataSourceProperties());
	}

}
