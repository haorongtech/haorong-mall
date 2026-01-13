package com.haorong.cloud.generator.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.hutool.core.io.IoUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.haorong.cloud.common.core.util.Result;
import com.haorong.cloud.common.log.annotation.SysLog;
import com.haorong.cloud.generator.entity.GenTable;
import com.haorong.cloud.generator.service.IGenTableService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.anyline.metadata.Table;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/gen-table")
@Tag(description = "gen-table", name = "数据表")
public class GenTableController {

	private final IGenTableService genTableService;

	@Operation(summary = "数据表列表")
	@SaCheckPermission("gen:gen-table:page")
	@GetMapping("/page")
	public Result<IPage<Table>> page(Page page, GenTable genTable) {
		return Result.success(genTableService.getPage(page, genTable));
	}

	@Operation(summary = "通过数据库名称和表名称查询")
	@GetMapping("/{dsName}/{tableName}")
	public Result<GenTable> genTabledDetail(@PathVariable("dsName") String dsName,
			@PathVariable("tableName") String tableName) {
		return Result.success(genTableService.genTabledDetail(dsName, tableName));
	}

	@SysLog("修改数据表")
	@Operation(summary = "数据表修改")
	@PutMapping
	public Result<?> edit(@RequestBody GenTable genTable) {
		return Result.success(genTableService.updateGenTableById(genTable));
	}

	@Operation(summary = "生成代码")
	@GetMapping("/gen/{tableName}")
	public void generatorCode(@PathVariable("tableName") String tableName, HttpServletResponse response)
			throws IOException {
		byte[] data = genTableService.generatorCode(tableName);
		response.reset();
		response.addHeader("Access-Control-Allow-Origin", "*");
		response.addHeader("Access-Control-Expose-Headers", "Content-Disposition");
		response.setHeader("Content-Disposition", "attachment; filename=\"haorong.zip\"");
		response.addHeader("Content-Length", "" + data.length);
		response.setContentType("application/octet-stream; charset=UTF-8");
		IoUtil.write(response.getOutputStream(), true, data);
	}

}
