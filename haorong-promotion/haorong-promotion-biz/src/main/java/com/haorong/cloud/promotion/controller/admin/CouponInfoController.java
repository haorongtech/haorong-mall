/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.promotion.controller.admin;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.haorong.cloud.common.core.util.Result;
import com.haorong.cloud.common.log.annotation.SysLog;
import com.haorong.cloud.promotion.api.entity.CouponInfo;
import com.haorong.cloud.promotion.api.entity.CouponUser;
import com.haorong.cloud.promotion.service.ICouponInfoService;
import com.haorong.cloud.promotion.service.ICouponUserService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/couponinfo")
@Tag(description = "couponinfo", name = "优惠券")
public class CouponInfoController {

	private final ICouponInfoService couponInfoService;

	private final ICouponUserService couponUserService;

	@Operation(summary = "优惠券列表")
	@SaCheckPermission("promotion:couponinfo:page")
	@GetMapping("/page")
	public Result page(Page page, CouponInfo couponInfo) {
		return Result.success(couponInfoService.getAdminPage(page, couponInfo));
	}

	@Operation(summary = "优惠券查询")
	@SaCheckPermission("promotion:couponinfo:get")
	@GetMapping("/{id}")
	public Result getById(@PathVariable("id") String id) {
		return Result.success(couponInfoService.getCouponById(id));
	}

	@SysLog("新增优惠券")
	@Operation(summary = "优惠券新增")
	@SaCheckPermission("promotion:couponinfo:add")
	@PostMapping
	public Result add(@Valid @RequestBody CouponInfo couponInfo) {
		couponInfo.setRemainNum(couponInfo.getTotalNum());
		couponInfo.setAssignCount(0);
		couponInfo.setUsedCount(0);
		return Result.success(couponInfoService.save(couponInfo));
	}

	@SysLog("修改优惠券")
	@Operation(summary = "优惠券修改")
	@SaCheckPermission("promotion:couponinfo:edit")
	@PutMapping
	public Result edit(@Valid @RequestBody CouponInfo couponInfo) {
		return Result.success(couponInfoService.updateById(couponInfo));
	}

	@SysLog("删除优惠券")
	@Operation(summary = "优惠券删除")
	@SaCheckPermission("promotion:couponinfo:del")
	@DeleteMapping("/{id}")
	public Result del(@PathVariable("id") String id) {
		if (couponUserService.count(Wrappers.<CouponUser>lambdaQuery().eq(CouponUser::getCouponId, id)) > 0) {
			return Result.fail("已有人领取不可删除");
		}
		return Result.success(couponInfoService.removeById(id));
	}

}
