/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.product.controller.admin;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.hutool.core.date.LocalDateTimeUtil;
import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.haorong.cloud.common.core.util.Result;
import com.haorong.cloud.common.log.annotation.SysLog;
import com.haorong.cloud.product.api.dto.GoodsSpuShelfDTO;
import com.haorong.cloud.product.api.entity.GoodsSpu;
import com.haorong.cloud.product.service.IGoodsSpuService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 商品spu前端控制器
 *
 * @author haorong
 * @since 2022/2/22 14:33
 */
@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/goodsspu")
@Tag(description = "goodsspu", name = "商品spu")
public class GoodsSpuController {

	private final IGoodsSpuService goodsSpuService;

	@Operation(summary = "商品列表")
	@SaCheckPermission("product:goodsspu:page")
	@GetMapping("/page")
	public Result page(Page page, GoodsSpu goodsSpu) {
		return Result.success(goodsSpuService.adminPage(page, goodsSpu));
	}

	@Operation(summary = "商品库列表")
	@SaCheckPermission("product:goodsspu:page")
	@GetMapping("/warehouse/page")
	public Result warehousePage(Page page, GoodsSpu goodsSpu) {
		return Result.success(goodsSpuService.warehousePage(page, goodsSpu));
	}

	@Operation(summary = "通过id查询商品")
	@SaCheckPermission("product:goodsspu:get")
	@GetMapping("/{id}")
	public Result getById(@PathVariable String id) {
		return Result.success(goodsSpuService.getSpuById(id));
	}

	@Operation(summary = "通过ids查询商品")
	@SaCheckPermission("product:goodsspu:get")
	@GetMapping("/byIds/{ids}")
	public Result getByIds(@PathVariable List<String> ids) {
		return Result.success(goodsSpuService.listByIds(ids));
	}

	@SysLog("新增商品")
	@Operation(summary = "商品新增")
	@SaCheckPermission("product:goodsspu:add")
	@PostMapping
	public Result add(@RequestBody GoodsSpu goodsSpu) {
		return Result.success(goodsSpuService.saveGoods(goodsSpu));
	}

	@SysLog("修改商品")
	@Operation(summary = "商品修改")
	@SaCheckPermission("product:goodsspu:edit")
	@PutMapping
	public Result edit(@RequestBody GoodsSpu goodsSpu) {
		return Result.success(goodsSpuService.updateGoods(goodsSpu));
	}

	@SysLog("删除商品")
	@Operation(summary = "商品删除")
	@SaCheckPermission("product:goodsspu:del")
	@DeleteMapping("/{id}")
	public Result del(@PathVariable String id) {
		return Result.success(goodsSpuService.removeById(id));
	}

	@SysLog("修改商品状态")
	@Operation(summary = "商品状态修改")
	@SaCheckPermission("product:goodsspu:add")
	@PostMapping("/update/status")
	public Result updateStatus(@RequestBody GoodsSpu goodsSpu) {
		GoodsSpu goodsSpu1 = goodsSpuService.getById(goodsSpu.getId());
		if (ObjectUtil.isNull(goodsSpu1)) {
			return Result.fail("商品不存在");
		}
		goodsSpu1.setStatus(goodsSpu.getStatus());
		goodsSpuService.updateById(goodsSpu1);
		return Result.success(goodsSpu1);
	}

	@SysLog("商品上下架")
	@Operation(summary = "商品上下架")
	@SaCheckPermission("product:goodsspu:edit")
	@PostMapping("/goods-shelf")
	public Result goodsShelf(@RequestBody GoodsSpuShelfDTO goodsSpuShelfDTO) {
		GoodsSpu goodsSpu = new GoodsSpu();
		goodsSpu.setStatus(goodsSpuShelfDTO.getStatus());
		goodsSpuService.update(goodsSpu,
				Wrappers.<GoodsSpu>lambdaQuery().in(GoodsSpu::getId, goodsSpuShelfDTO.getSpuIds()));
		return Result.success();
	}

	@Operation(summary = "商品数量统计查询")
	@GetMapping("/count")
	public Result count() {
		long allCount = goodsSpuService.count(Wrappers.lambdaQuery());
		LocalDateTime localDateTime = LocalDateTime.now();
		long todayCount = goodsSpuService.count(Wrappers.<GoodsSpu>lambdaQuery()
			.ge(GoodsSpu::getCreateTime, LocalDateTimeUtil.beginOfDay(localDateTime))
			.le(GoodsSpu::getCreateTime, LocalDateTimeUtil.endOfDay(localDateTime)));
		Map<String, Object> rt = new HashMap<>();
		// 今日数量
		rt.put("todayCount", todayCount);
		// 全部数量
		rt.put("allCount", allCount);
		return Result.success(rt);
	}

}
