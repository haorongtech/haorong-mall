/** 
  * Copyright (c) 2025 沈阳浩荣科技有限公司 
  * All rights reserved. 
  * <p> 
  * 注意： 
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。 
 
  */
package com.haorong.cloud.order.controller.admin;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.hutool.core.date.LocalDateTimeUtil;
import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.haorong.cloud.common.core.constant.CommonConstants;
import com.haorong.cloud.common.core.enums.MallErrorCodeEnum;
import com.haorong.cloud.common.core.util.Result;
import com.haorong.cloud.common.log.annotation.SysLog;
import com.haorong.cloud.order.api.dto.OrderDeliveryDTO;
import com.haorong.cloud.order.api.dto.OrderStatisticsDTO;
import com.haorong.cloud.order.api.entity.OrderInfo;
import com.haorong.cloud.order.api.entity.OrderItemEntity;
import com.haorong.cloud.order.api.enums.OrderStatusEnum;
import com.haorong.cloud.order.service.IOrderInfoService;
import com.haorong.cloud.order.service.IOrderItemService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * 订单
 *
 * @author haorong
 * @since 2022/3/7 14:01
 */
@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/orderinfo")
@Tag(description = "orderinfo", name = "订单")
public class OrderInfoController {

	private final IOrderInfoService orderInfoService;

	private final IOrderItemService orderItemService;

	@Operation(summary = "订单分页列表")
	@SaCheckPermission("order:orderinfo:page")
	@GetMapping("/page")
	public Result<IPage<OrderInfo>> page(Page page, OrderInfo orderInfo) {
		return Result.success(orderInfoService.adminPage(page, orderInfo));
	}

	@Operation(summary = "订单详情")
	@SaCheckPermission("order:orderinfo:get")
	@GetMapping("/{id}")
	public Result<OrderInfo> getById(@PathVariable("id") String id) {
		return Result.success(orderInfoService.getOrderById(id));
	}

	@Operation(summary = "订单删除")
	@SaCheckPermission("order:orderinfo:del")
	@DeleteMapping("/{id}")
	public Result<Boolean> del(@PathVariable String id) {
		OrderInfo orderInfo = orderInfoService.getById(id);
		if (ObjectUtil.isNull(orderInfo)) {
			return Result.fail(MallErrorCodeEnum.ERROR_60003.getCode(), MallErrorCodeEnum.ERROR_60003.getMsg());
		}
		if (CommonConstants.YES.equals(orderInfo.getPayStatus())) {
			return Result.fail(MallErrorCodeEnum.ERROR_60006.getCode(), MallErrorCodeEnum.ERROR_60006.getMsg());
		}
		orderItemService.remove(Wrappers.<OrderItemEntity>lambdaQuery().eq(OrderItemEntity::getOrderId, id));
		return Result.success(orderInfoService.removeById(id));
	}

	@Operation(summary = "订单取消")
	@SaCheckPermission("order:orderinfo:cancel")
	@GetMapping("/cancel/{id}")
	public Result<String> cancelOrder(@PathVariable String id) {
		OrderInfo orderInfo = orderInfoService.getById(id);
		if (ObjectUtil.isNull(orderInfo)) {
			return Result.fail(MallErrorCodeEnum.ERROR_60003.getCode(), MallErrorCodeEnum.ERROR_60003.getMsg());
		}
		if (CommonConstants.YES.equals(orderInfo.getPayStatus())) {
			return Result.fail(MallErrorCodeEnum.ERROR_60006.getCode(), MallErrorCodeEnum.ERROR_60006.getMsg());
		}
		return Result.success(orderInfoService.cancelOrder(orderInfo));
	}

	@Operation(summary = "订单发货")
	@SysLog("订单发货")
	@SaCheckPermission("order:orderinfo:deliver")
	@PostMapping("/deliver")
	public Result<Boolean> deliverOrder(@RequestBody @Valid OrderDeliveryDTO request) {
		return Result.success(orderInfoService.deliverOrder(request));
	}

	@Operation(summary = "订单自提")
	@SysLog("订单自提")
	@SaCheckPermission("order:orderinfo:deliver")
	@PostMapping("/selffetch")
	public Result<Boolean> selfFetchOrder(@RequestBody OrderInfo orderInfo) {
		final String orderId = orderInfo.getId();
		orderInfo = orderInfoService.getById(orderId);
		if (Objects.isNull(orderInfo)) {
			return Result.fail(MallErrorCodeEnum.ERROR_60003.getCode(), MallErrorCodeEnum.ERROR_60003.getMsg());
		}
		if (!OrderStatusEnum.WAITING_FOR_RECEIPT.getCode().equals(orderInfo.getStatus())) {
			return Result.fail(MallErrorCodeEnum.ERROR_60003.getCode(), MallErrorCodeEnum.ERROR_60003.getMsg());
		}

		return Result.success(orderInfoService.receiveOrder(orderInfo));
	}

	@Operation(summary = "订单统计")
	@GetMapping("/statistics")
	public Result<List<Map<String, Object>>> statistics() {
		return Result.success(orderInfoService.statistics());
	}

	@Operation(summary = "订单数量查询")
	@GetMapping("/count")
	public Result getCount() {
		long allCount = orderInfoService.count(Wrappers.lambdaQuery());
		LocalDateTime localDateTime = LocalDateTime.now();
		long todayCount = orderInfoService.count(Wrappers.<OrderInfo>lambdaQuery()
			.ge(OrderInfo::getCreateTime, LocalDateTimeUtil.beginOfDay(localDateTime))
			.le(OrderInfo::getCreateTime, LocalDateTimeUtil.endOfDay(localDateTime)));
		Map<String, Object> rt = new HashMap<>();
		// 今日数量
		rt.put("todayCount", todayCount);
		// 全部数量
		rt.put("allCount", allCount);
		return Result.success(rt);
	}

	@Operation(summary = "支付来源统计")
	@GetMapping("/pay-type/statistics")
	public Result payTypeStatistics(OrderStatisticsDTO orderStatisticsDTO) {
		return Result.success(orderInfoService.payTypeStatistics(orderStatisticsDTO));
	}

	@Operation(summary = "下单端来源统计")
	@GetMapping("/channel-type/statistics")
	public Result channelTypeStatistics(OrderStatisticsDTO orderStatisticsDTO) {
		return Result.success(orderInfoService.channelTypeStatistics(orderStatisticsDTO));
	}

}
