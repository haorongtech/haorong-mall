/** 
  * Copyright (c) 2025 沈阳浩荣科技有限公司 
  * All rights reserved. 
  * <p> 
  * 注意： 
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。 
 
  */
package com.haorong.cloud.promotion.controller.admin;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.haorong.cloud.common.core.constant.CommonConstants;
import com.haorong.cloud.common.core.util.Result;
import com.haorong.cloud.common.log.annotation.SysLog;
import com.haorong.cloud.promotion.api.entity.PageDesign;
import com.haorong.cloud.promotion.service.IPageDesignService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

/**
 * 页面设计
 *
 * @author haorong
 * @date 2022/12/07
 */
@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/pagedesign")
@Tag(description = "pagedesign", name = "页面设计")
public class PageDesignController {

	private final IPageDesignService pageDesignService;

	@Operation(summary = "页面设计列表")
	@SaCheckPermission("promotion:pagedesign:page")
	@GetMapping("/page")
	public Result<IPage<PageDesign>> page(Page page, PageDesign pageDesign) {
		IPage<PageDesign> iPage = pageDesignService.page(page, Wrappers.query(pageDesign));
		return Result.success(iPage);
	}

	@Operation(summary = "页面设计查询")
	@SaCheckPermission("promotion:pagedesign:get")
	@GetMapping("/{id}")
	public Result<PageDesign> getById(@PathVariable String id) {
		return Result.success(pageDesignService.getById(id));
	}

	@SysLog("新增页面设计")
	@Operation(summary = "页面设计新增")
	@SaCheckPermission("promotion:pagedesign:add")
	@PostMapping
	public Result<String> add(@RequestBody PageDesign pageDesign) {
		pageDesignService.save(pageDesign);
		return Result.success(pageDesign.getId());
	}

	@SysLog("修改页面设计")
	@Operation(summary = "页面设计修改")
	@SaCheckPermission("promotion:pagedesign:edit")
	@PutMapping
	public Result<Boolean> edit(@RequestBody PageDesign pageDesign) {
		if (CommonConstants.YES.equals(pageDesign.getHomeStatus())) {
			PageDesign pageDesign1 = new PageDesign();
			pageDesign1.setHomeStatus(CommonConstants.NO);
			pageDesignService.update(pageDesign1,
					Wrappers.<PageDesign>lambdaQuery()
						.ne(PageDesign::getId, pageDesign.getId())
						.eq(PageDesign::getHomeStatus, CommonConstants.YES));
		}
		return Result.success(pageDesignService.updatePageDesignById(pageDesign));
	}

	@SysLog("删除页面设计")
	@Operation(summary = "页面设计删除")
	@SaCheckPermission("promotion:pagedesign:del")
	@DeleteMapping("/{id}")
	public Result<Boolean> del(@PathVariable String id) {
		return Result.success(pageDesignService.removeById(id));
	}

	@Operation(summary = "页面设计查询")
	@GetMapping("/home")
	public Result<PageDesign> getHomePage(PageDesign request) {
		return Result.success(pageDesignService.getOne(
				Wrappers.query(request).lambda().eq(PageDesign::getHomeStatus, CommonConstants.YES).last("limit 1")));
	}

}
