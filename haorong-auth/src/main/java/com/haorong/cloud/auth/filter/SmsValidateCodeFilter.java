/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.auth.filter;

import cn.hutool.core.util.StrUtil;
import com.haorong.cloud.common.core.constant.CacheConstants;
import com.haorong.cloud.common.core.constant.SecurityConstants;
import com.haorong.cloud.common.security.handler.HxBusinessException;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;

@Slf4j
@Component
@RequiredArgsConstructor
public class SmsValidateCodeFilter extends OncePerRequestFilter {

	private final StringRedisTemplate redisTemplate;

	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		// 验证码校验逻辑
		if (!StrUtil.containsAnyIgnoreCase(request.getServletPath(), SecurityConstants.PHONE_SMS_TOKEN,
				SecurityConstants.REGISTER, SecurityConstants.TOC_PHONE_SMS_TOKEN)) {
			filterChain.doFilter(request, response);
			return;
		}
		String code = request.getParameter("code");
		if (StrUtil.isBlank(code)) {
			throw new HxBusinessException("验证码为空");
		}
		String phone = request.getParameter("phone");
		String key = redisTemplate.opsForValue().get(CacheConstants.SMS_CODE_KEY + phone);
		if (!StringUtils.hasText(key) || !code.equals(key)) {
			throw new HxBusinessException("验证码不合法");
		}
		redisTemplate.delete(key);
		// 校验通过，放行
		filterChain.doFilter(request, response);
	}

}
