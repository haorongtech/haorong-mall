/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.auth.filter;

import cn.hutool.core.util.StrUtil;
import com.anji.captcha.model.common.ResponseModel;
import com.anji.captcha.model.vo.CaptchaVO;
import com.anji.captcha.service.CaptchaService;
import com.haorong.cloud.common.core.constant.CommonConstants;
import com.haorong.cloud.common.core.constant.SecurityConstants;
import com.haorong.cloud.common.core.util.SpringUtils;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;

@Slf4j
@Component
public class ValidateCodeFilter extends OncePerRequestFilter {

	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		// 验证码校验逻辑
		if (!SecurityConstants.OAUTH_TOKEN.equals(request.getServletPath())) {
			filterChain.doFilter(request, response);
			return;
		}
		String code = request.getParameter("code");
		if (StrUtil.isBlank(code)) {
			throw new RuntimeException("验证码为空");
		}
		CaptchaService captchaService = SpringUtils.getBean(CaptchaService.class);
		CaptchaVO vo = new CaptchaVO();
		vo.setCaptchaVerification(code);
		vo.setCaptchaType(CommonConstants.IMAGE_CODE_TYPE_BP);
		ResponseModel responseModel = captchaService.verification(vo);
		if (!responseModel.isSuccess()) {
			throw new RuntimeException("验证码不能为空");
		}
		// 校验通过，放行
		filterChain.doFilter(request, response);
	}

}
