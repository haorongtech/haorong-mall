/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.visual.monitor.config;

import de.codecentric.boot.admin.server.config.AdminServerProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

/**
 * SpringSecurity配置
 *
 * @author haorong
 * @since 2022/5/19 11:54
 */
@EnableWebSecurity
public class SecuritySecureConfig {

	private final String adminContextPath;

	public SecuritySecureConfig(AdminServerProperties adminServerProperties) {
		this.adminContextPath = adminServerProperties.getContextPath();
	}

	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
		SavedRequestAwareAuthenticationSuccessHandler successHandler = new SavedRequestAwareAuthenticationSuccessHandler();
		successHandler.setTargetUrlParameter("redirectTo");

		http.authorizeHttpRequests((auth) -> auth
			.requestMatchers(adminContextPath + "/assets/**", adminContextPath + "/login",
					adminContextPath + "/actuator/**")
			.permitAll()
			.anyRequest()
			.authenticated())
			.formLogin((formLogin) -> formLogin.loginPage(adminContextPath + "/login").successHandler(successHandler))
			.logout((logout) -> logout.logoutUrl(adminContextPath + "/logout"))
			.httpBasic(Customizer.withDefaults());
		// 构建过滤链并返回
		return http.build();
	}

}
