/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.user.controller.admin;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.hutool.core.date.LocalDateTimeUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.haorong.cloud.common.core.util.Result;
import com.haorong.cloud.common.log.annotation.SysLog;
import com.haorong.cloud.user.api.entity.UserInfo;
import com.haorong.cloud.user.service.IUserInfoService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

/**
 * 商城用户
 *
 * @author haorong
 * @since 2022/3/1 10:13
 */
@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/userinfo")
@Tag(description = "userinfo", name = "商城用户")
public class UserInfoController {

	private final IUserInfoService userInfoService;

	@Operation(summary = "商城用户分页列表")
	@SaCheckPermission("user:userinfo:page")
	@GetMapping("/page")
	public Result page(Page page, UserInfo userInfo) {
		return Result.success(userInfoService.getPage(page, userInfo));
	}

	@Operation(summary = "商城用户查询")
	@GetMapping("/{id}")
	public Result page(@PathVariable("id") String id) {
		return Result.success(userInfoService.getUserById(id));
	}

	@Operation(summary = "商城用户数量查询")
	@GetMapping("/count")
	public Result count(UserInfo userInfo) {
		return Result.success(userInfoService.count(Wrappers.lambdaQuery(userInfo)));
	}

	@SysLog("新增用户")
	@Operation(summary = "用户新增")
	@SaCheckPermission("user:userinfo:add")
	@PostMapping
	public Result<Boolean> add(@RequestBody UserInfo userInfo) {
		return Result.success(userInfoService.saveUser(userInfo));
	}

	@SysLog("修改用户")
	@Operation(summary = "用户修改")
	@SaCheckPermission("user:userinfo:edit")
	@PutMapping
	public Result<Boolean> edit(@RequestBody UserInfo userInfo) {
		return Result.success(userInfoService.updateUserById(userInfo));
	}

	@Operation(summary = "商城用户统计数量查询")
	@GetMapping("/statistics")
	public Result statistics() {
		long allCount = userInfoService.count(Wrappers.lambdaQuery());
		LocalDateTime localDateTime = LocalDateTime.now();
		long todayCount = userInfoService.count(Wrappers.<UserInfo>lambdaQuery()
			.ge(UserInfo::getCreateTime, LocalDateTimeUtil.beginOfDay(localDateTime))
			.le(UserInfo::getCreateTime, LocalDateTimeUtil.endOfDay(localDateTime)));
		Map<String, Object> rt = new HashMap<>();
		// 今日数量
		rt.put("todayCount", todayCount);
		// 全部数量
		rt.put("allCount", allCount);
		return Result.success(rt);
	}

	@Operation(summary = "用户来源统计")
	@GetMapping("/source/statistics")
	public Result sourceStatistics(UserInfo userInfo) {
		return Result.success(userInfoService.sourceStatistics(userInfo));
	}

}
