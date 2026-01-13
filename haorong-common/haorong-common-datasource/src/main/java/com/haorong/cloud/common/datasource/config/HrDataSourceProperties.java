/**
 * Copyright (c) 2025 沈阳浩荣科技有限公司
 * All rights reserved.
 * <p>
 * 注意：
 * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。
 * 仅供购买并获得正式授权的客户使用，侵权必究。
 */
package com.haorong.cloud.common.datasource.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Data
@Component
@ConfigurationProperties(prefix = "spring.datasource.dynamic.datasource.master")
public class HrDataSourceProperties {

	private String url;

	private String username;

	private String password;

	private String driverClassName;

}
