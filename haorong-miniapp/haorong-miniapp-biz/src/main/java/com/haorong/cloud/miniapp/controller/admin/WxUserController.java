/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.miniapp.controller.admin;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.haorong.cloud.common.core.util.Result;
import com.haorong.cloud.miniapp.api.entity.WxUser;
import com.haorong.cloud.miniapp.service.IWxUserService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 微信用户
 *
 * @author haorong
 * @since 2022/3/14 15:36
 */
@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/wxuser")
@Tag(description = "wxuser", name = "微信用户")
public class WxUserController {

	private final IWxUserService wxUserService;

	@Operation(summary = "微信用户列表")
	@SaCheckPermission("weixin:wxuser:page")
	@GetMapping("/page")
	public Result page(Page page, WxUser wxUser) {
		return Result.success(wxUserService.adminPage(page, wxUser));
	}

}
