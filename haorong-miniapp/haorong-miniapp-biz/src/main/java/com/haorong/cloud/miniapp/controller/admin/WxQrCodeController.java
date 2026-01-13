/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.miniapp.controller.admin;

import com.haorong.cloud.common.core.util.Result;
import com.haorong.cloud.miniapp.api.dto.WxQrCodeDTO;
import com.haorong.cloud.miniapp.service.IWxAppService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/wx/qrcode")
@Tag(description = "wx-qrcode", name = "微信小程序码")
public class WxQrCodeController {

	private final IWxAppService wxAppService;

	@Operation(summary = "获取微信小程序码")
	@PostMapping("/get")
	public Result<String> get(@RequestBody WxQrCodeDTO wxQrCodeDTO) {
		return Result.success(wxAppService.createWxaCodeUnlimit(wxQrCodeDTO));
	}

}
