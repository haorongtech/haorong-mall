/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.auth.controller;

import cn.dev33.satoken.stp.StpUtil;
import com.haorong.cloud.common.core.util.Result;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 检验token
 *
 * @author haorong
 * @since 2024/5/6 13:37
 */
@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/validate-token")
@Tag(description = "validate-token", name = "检验token")
public class ValidateTokenController {

	@Operation(summary = "检验是否登录")
	@GetMapping
	public Result<Boolean> validateToken() {
		return Result.success(StpUtil.isLogin());
	}

}
