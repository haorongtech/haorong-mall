/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.order.controller.admin;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.haorong.cloud.common.core.util.Result;
import com.haorong.cloud.common.log.annotation.SysLog;
import com.haorong.cloud.order.api.entity.OrderConfig;
import com.haorong.cloud.order.service.IOrderConfigService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

/**
 * 订单配置
 *
 * @author haorong
 * @date 2025/5/27
 */
@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/order-config")
@Tag(description = "refundReason", name = "订单配置")
public class OrderConfigController {

	private final IOrderConfigService orderConfigService;

	@Operation(summary = "订单配置列表")
	@SaCheckPermission("order:config:page")
	@GetMapping("/page")
	public Result<IPage<OrderConfig>> page(Page page, OrderConfig orderConfig) {
		return Result.success(orderConfigService.page(page, Wrappers.query(orderConfig)));
	}

	@Operation(summary = "订单配置查询")
	@SaCheckPermission("order:config:get")
	@GetMapping("/{id}")
	public Result<OrderConfig> page(@PathVariable("id") String id) {
		return Result.success(orderConfigService.getById(id));
	}

	@SysLog("新增订单配置")
	@Operation(summary = "订单配置新增")
	@SaCheckPermission("order:config:add")
	@PostMapping
	public Result<Boolean> add(@RequestBody OrderConfig orderConfig) {
		return Result.success(orderConfigService.saveConfig(orderConfig));
	}

	@SysLog("修改订单配置")
	@Operation(summary = "订单配置修改")
	@SaCheckPermission("order:config:edit")
	@PutMapping
	public Result<Boolean> edit(@RequestBody OrderConfig orderConfig) {
		return Result.success(orderConfigService.updateConfigById(orderConfig));
	}

	@SysLog("删除订单配置")
	@Operation(summary = "订单配置删除")
	@SaCheckPermission("order:config:del")
	@DeleteMapping("/{id}")
	public Result<Boolean> del(@PathVariable String id) {
		return Result.success(orderConfigService.removeConfigById(id));
	}

}
