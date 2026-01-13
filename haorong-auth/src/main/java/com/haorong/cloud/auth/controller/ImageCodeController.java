/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.auth.controller;

import com.anji.captcha.model.common.ResponseModel;
import com.anji.captcha.model.vo.CaptchaVO;
import com.anji.captcha.service.CaptchaService;
import com.haorong.cloud.common.core.constant.CommonConstants;
import com.haorong.cloud.common.core.util.Result;
import com.haorong.cloud.common.core.util.SpringUtils;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/code")
@Tag(description = "code", name = "验证码")
public class ImageCodeController {

	@Operation(summary = "获取验证码")
	@GetMapping("/get")
	public Result<ResponseModel> getCode() {
		CaptchaVO vo = new CaptchaVO();
		vo.setCaptchaType(CommonConstants.IMAGE_CODE_TYPE_BP);
		CaptchaService captchaService = SpringUtils.getBean(CaptchaService.class);
		return Result.success(captchaService.get(vo));
	}

	@Operation(summary = "校验验证码")
	@PostMapping("/check")
	public Result<ResponseModel> check(CaptchaVO captchaVO) {
		CaptchaVO vo = new CaptchaVO();
		vo.setPointJson(captchaVO.getPointJson());
		vo.setToken(captchaVO.getToken());
		vo.setCaptchaType(CommonConstants.IMAGE_CODE_TYPE_BP);
		CaptchaService captchaService = SpringUtils.getBean(CaptchaService.class);
		return Result.success(captchaService.check(vo));
	}

}
