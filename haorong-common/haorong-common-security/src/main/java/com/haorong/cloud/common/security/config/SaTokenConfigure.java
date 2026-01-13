/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.common.security.config;

import cn.dev33.satoken.interceptor.SaInterceptor;
import com.haorong.cloud.common.security.aspect.HxInnerAopAspect;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * 注解鉴权
 *
 * @author haorong
 * @date 2022/6/27 22:48
 */
@Slf4j
@Configuration
@RequiredArgsConstructor
@ConditionalOnProperty(prefix = "hx", value = "cloud.enable", matchIfMissing = true)
public class SaTokenConfigure implements WebMvcConfigurer {

	private final HttpServletRequest request;

	/**
	 * 注册Sa-Token的注解拦截器，打开注解式鉴权功能
	 * @param registry
	 * @author haorong
	 * @date 2022/7/16
	 * @return: void
	 */
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// 注册注解拦截器，并排除不需要注解鉴权的接口地址 (与登录拦截器无关)
		registry.addInterceptor(new SaInterceptor()).addPathPatterns("/**");
	}

	/**
	 * 内部接口访问权限
	 *
	 * @author haorong
	 * @date 2022/7/16
	 * @return: com.haorong.cloud.security.aspect.HxInnerAopAspect
	 */
	@Bean
	public HxInnerAopAspect hxInnerAopAspect() {
		return new HxInnerAopAspect(request);
	}

}
