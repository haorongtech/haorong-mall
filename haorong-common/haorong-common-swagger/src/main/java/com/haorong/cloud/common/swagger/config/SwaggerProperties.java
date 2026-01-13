/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.common.swagger.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.stereotype.Component;

@Data
@Component
@ConfigurationProperties(prefix = "hx.swagger")
@RefreshScope
public class SwaggerProperties {

	/**
	 * 是否开启swagger
	 */
	private Boolean enabled = true;

	private String title;

	private String description;

	private String version;

	private String author;

	private String email;

	private String license;

	private String licenseUrl;

}
