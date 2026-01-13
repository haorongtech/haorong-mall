/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.promotion.controller.app;

import cn.dev33.satoken.stp.StpUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.haorong.cloud.common.core.util.Result;
import com.haorong.cloud.common.security.util.SecurityUtils;
import com.haorong.cloud.promotion.api.entity.CouponGoods;
import com.haorong.cloud.promotion.api.entity.CouponInfo;
import com.haorong.cloud.promotion.api.entity.CouponUser;
import com.haorong.cloud.promotion.service.ICouponInfoService;
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
@RequestMapping("/app/couponinfo")
@Tag(description = "app-couponinfo", name = "优惠券-API")
public class AppCouponInfoController {

	private final ICouponInfoService couponInfoService;

	@Operation(summary = "优惠券列表")
	@GetMapping("/page")
	public Result<IPage<CouponInfo>> page(Page page, CouponInfo couponInfo, CouponGoods couponGoods) {
		CouponUser couponUser = new CouponUser();
		if (StpUtil.isLogin()) {
			couponUser.setUserId(SecurityUtils.getUser().getUserId());
		}
		return Result.success(couponInfoService.getPage(page, couponInfo, couponGoods, couponUser));
	}

}
