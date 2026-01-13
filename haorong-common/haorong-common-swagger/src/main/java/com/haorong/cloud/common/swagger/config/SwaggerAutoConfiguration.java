/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.common.swagger.config;

import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Contact;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.info.License;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * swagger配置
 *
 * <p>
 * 禁用方法1：使用注解@Profile({"dev","test"})
 * <p>
 * 表示在开发或测试环境开启，而在生产关闭。（推荐使用） 禁用方法2：使用注解@ConditionalOnProperty(name = "swagger.enable",
 * <p>
 * havingValue = "true") 然后在测试配置或者开发配置中添加swagger.enable=true即可开启，生产环境不填则默认关闭Swagger.
 * </p>
 *
 * @author haorong
 */
@Configuration
@RequiredArgsConstructor
@ConditionalOnProperty(name = "swagger.enabled", havingValue = "true", matchIfMissing = true)
public class SwaggerAutoConfiguration {

	private final SwaggerProperties swaggerProperties;

	@Bean
	public OpenAPI swaggerOpenAPI() {
		return new OpenAPI().info(new Info().title(swaggerProperties.getTitle())
			// 信息
			.contact(new Contact().name(swaggerProperties.getAuthor()).email(swaggerProperties.getEmail()))
			// 简介
			.description(swaggerProperties.getDescription())
			// 版本
			.version(swaggerProperties.getVersion())
			// 许可证
			.license(new License().name(swaggerProperties.getLicense()).url(swaggerProperties.getLicenseUrl())));
	}

}
