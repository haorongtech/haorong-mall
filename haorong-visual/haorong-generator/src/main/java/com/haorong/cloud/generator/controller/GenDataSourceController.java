package com.haorong.cloud.generator.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.haorong.cloud.common.core.util.Result;
import com.haorong.cloud.common.log.annotation.SysLog;
import com.haorong.cloud.generator.entity.GenDataSource;
import com.haorong.cloud.generator.service.IGenDataSourceService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/gen-datasource")
@Tag(description = "datasource", name = "数据源")
public class GenDataSourceController {

	private final IGenDataSourceService genDataSourceService;

	@Operation(summary = "数据源列表")
	@SaCheckPermission("gen:datasource:page")
	@GetMapping("/page")
	public Result<IPage<GenDataSource>> page(Page page, GenDataSource genDataSource) {
		return Result.success(genDataSourceService.page(page, Wrappers.query(genDataSource)));
	}

	@Operation(summary = "查询全部数据源")
	@GetMapping("/list")
	public Result<List<GenDataSource>> list(GenDataSource genDataSource) {
		return Result.success(genDataSourceService
			.list(Wrappers.lambdaQuery(genDataSource).select(GenDataSource::getDbName, GenDataSource::getName)));
	}

	@Operation(summary = "通过id查询数据源")
	@SaCheckPermission("gen:datasource:get")
	@GetMapping("/{id}")
	public Result<?> getById(@PathVariable String id) {
		return Result.success(genDataSourceService.getById(id));
	}

	@SysLog("新增数据源")
	@Operation(summary = "数据源新增")
	@SaCheckPermission("gen:datasource:add")
	@PostMapping
	public Result<?> add(@RequestBody GenDataSource genDataSource) {
		return Result.success(genDataSourceService.saveDataSource(genDataSource));
	}

	@SysLog("修改数据源")
	@Operation(summary = "数据源修改")
	@SaCheckPermission("gen:datasource:edit")
	@PutMapping
	public Result<?> edit(@RequestBody GenDataSource genDataSource) {
		return Result.success(genDataSourceService.updateDataSourceById(genDataSource));
	}

	@SysLog("删除数据源")
	@Operation(summary = "数据源删除")
	@SaCheckPermission("gen:datasource:del")
	@DeleteMapping("/{id}")
	public Result<?> del(@PathVariable String id) {
		return Result.success(genDataSourceService.removeById(id));
	}

}
