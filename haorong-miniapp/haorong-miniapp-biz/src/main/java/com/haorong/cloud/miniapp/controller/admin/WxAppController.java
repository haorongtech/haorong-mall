/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.miniapp.controller.admin;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.haorong.cloud.common.core.util.Result;
import com.haorong.cloud.common.log.annotation.SysLog;
import com.haorong.cloud.miniapp.api.entity.WxApp;
import com.haorong.cloud.miniapp.service.IWxAppService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

/**
 * 微信应用
 *
 * @author haorong
 * @since 2022/3/14 15:36
 */
@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/wxapp")
@Tag(description = "wxapp", name = "微信应用")
public class WxAppController {

	private final IWxAppService wxAppService;

	@Operation(summary = "微信应用列表")
	@SaCheckPermission("weixin:wxapp:page")
	@GetMapping("/page")
	public Result page(Page page, WxApp wxApp) {
		return Result.success(wxAppService.getPage(page, wxApp));
	}

	@Operation(summary = "微信应用列表")
	@GetMapping("/list")
	public Result list(WxApp wxApp) {
		return Result.success(wxAppService.list(Wrappers.query(wxApp)));
	}

	@Operation(summary = "微信应用查询")
	@SaCheckPermission("weixin:wxapp:get")
	@GetMapping("/{appId}")
	public Result getById(@PathVariable("appId") String appId) {
		return Result.success(wxAppService.getWxAppById(appId));
	}

	@SysLog("新增微信应用")
	@Operation(summary = "微信应用新增")
	@SaCheckPermission("weixin:wxapp:add")
	@PostMapping
	public Result add(@RequestBody WxApp wxApp) {
		return Result.success(wxAppService.saveWxApp(wxApp));
	}

	@SysLog("修改微信应用")
	@Operation(summary = "微信应用修改")
	@SaCheckPermission("weixin:wxapp:edit")
	@PutMapping
	public Result edit(@RequestBody @Valid WxApp wxApp) {
		return Result.success(wxAppService.updateWxAppById(wxApp));
	}

	@SysLog("删除微信应用")
	@Operation(summary = "微信应用删除")
	@SaCheckPermission("weixin:wxapp:del")
	@DeleteMapping("/{id}")
	public Result del(@PathVariable String id) {
		return Result.success(wxAppService.removeWxAppById(id));
	}

}
