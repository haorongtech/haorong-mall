/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.upms.controller;

import com.haorong.cloud.common.core.util.Result;
import com.haorong.cloud.upms.service.ISysSmsService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/sms")
@Tag(description = "sms", name = "短信服务")
public class SysSmsController {

	private final ISysSmsService sysSmsService;

	/**
	 * 发送短信
	 * @param type 短信类型
	 * @param mobile 手机号
	 * @return
	 */
	@Operation(summary = "发送短信")
	@GetMapping("/{type}/{mobile}")
	public Result<Boolean> send(@PathVariable String type, @PathVariable String mobile) {
		return Result.success(sysSmsService.sendSmsCode(mobile, type));
	}

}
