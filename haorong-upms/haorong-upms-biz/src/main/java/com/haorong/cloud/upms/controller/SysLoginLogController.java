/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.upms.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.hutool.core.date.LocalDateTimeUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.haorong.cloud.common.core.util.Result;
import com.haorong.cloud.upms.api.entity.SysLoginLog;
import com.haorong.cloud.upms.service.ISysLoginLogService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

/**
 * 登录日志管理
 *
 * @author haorong
 * @since 2022/2/26 16:40
 */
@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/sysloginlog")
@Tag(description = "sysloginlog", name = "登录日志")
public class SysLoginLogController {

	private final ISysLoginLogService sysLoginLogService;

	@Operation(summary = "登录日志列表")
	@SaCheckPermission("upms:sysloginlog:page")
	@GetMapping("/page")
	public Result page(Page page, SysLoginLog sysLoginLog) {
		return Result.success(sysLoginLogService.page(page, Wrappers.query(sysLoginLog)));
	}

	@Operation(summary = "统计查询")
	@GetMapping("/statistics")
	public Result statistics() {
		// 全部
		long allCount = sysLoginLogService.count(Wrappers.lambdaQuery());
		// 今日
		LocalDateTime localDateTime = LocalDateTime.now();
		long todayCount = sysLoginLogService.count(Wrappers.<SysLoginLog>lambdaQuery()
			.ge(SysLoginLog::getCreateTime, LocalDateTimeUtil.beginOfDay(localDateTime))
			.le(SysLoginLog::getCreateTime, LocalDateTimeUtil.endOfDay(localDateTime)));
		Map<String, Object> rt = new HashMap<>();
		// 今日数量
		rt.put("todayCount", todayCount);
		// 全部数量
		rt.put("allCount", allCount);
		return Result.success(rt);
	}

}
