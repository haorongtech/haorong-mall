/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.promotion.controller.admin;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.haorong.cloud.common.core.util.Result;
import com.haorong.cloud.promotion.api.entity.CouponUser;
import com.haorong.cloud.promotion.service.ICouponUserService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/couponuser")
@Tag(description = "couponuser", name = "用户领券记录")
public class CouponUserController {

	private final ICouponUserService couponUserService;

	@Operation(summary = "用户领券记录列表")
	@SaCheckPermission("promotion:couponuser:page")
	@GetMapping("/page")
	public Result page(Page page, CouponUser couponUser) {
		return Result.success(couponUserService.getPage(page, couponUser));
	}

}
