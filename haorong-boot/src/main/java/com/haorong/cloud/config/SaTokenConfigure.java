/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.config;

import cn.dev33.satoken.context.SaHolder;
import cn.dev33.satoken.filter.SaServletFilter;
import cn.dev33.satoken.interceptor.SaInterceptor;
import cn.dev33.satoken.router.SaHttpMethod;
import cn.dev33.satoken.router.SaRouter;
import cn.dev33.satoken.stp.StpUtil;
import cn.dev33.satoken.util.SaResult;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.List;

/**
 * [Sa-Token 权限认证] 配置类
 *
 * @author haorong
 * @date 2022/6/28
 */
@Slf4j
@Configuration
@RequiredArgsConstructor
public class SaTokenConfigure implements WebMvcConfigurer {

	private final PermitAllUrlProperties permitAllUrlProperties;

	/**
	 * 注册 [Sa-Token 全局过滤器]
	 */
	@Bean
	public SaServletFilter getSaServletFilter() {
		return new SaServletFilter()

			// 指定 [拦截路由] 与 [放行路由]
			.addInclude("/**")
			.addExclude("/favicon.ico")

			// 认证函数: 每次请求执行
			.setAuth(obj -> {
				List<String> ignoreUrls = permitAllUrlProperties.getUrls();
				// 登录认证：除白名单路径外均需要登录认证
				SaRouter.match("/**").notMatch(ignoreUrls).check(StpUtil::checkLogin);
			})

			// 异常处理函数：每次认证函数发生异常时执行此函数
			.setError(e -> {
				return SaResult.error(e.getMessage()).setCode(HttpStatus.UNAUTHORIZED.value());
			})

			// 前置函数：在每次认证函数之前执行
			.setBeforeAuth(obj -> {
				SaHolder.getResponse()

					// ---------- 设置跨域响应头 ----------
					// 允许指定域访问跨域资源
					.setHeader("Access-Control-Allow-Origin", "*")
					// 允许所有请求方式
					.setHeader("Access-Control-Allow-Methods", "*")
					// 允许的header参数
					.setHeader("Access-Control-Allow-Headers", "*")
					// 有效时间
					.setHeader("Access-Control-Max-Age", "3600");

				// 如果是预检请求，则立即返回到前端
				SaRouter.match(SaHttpMethod.OPTIONS).free(r -> System.out.println("--------OPTIONS预检请求，不做处理")).back();
			});
	}

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

}
