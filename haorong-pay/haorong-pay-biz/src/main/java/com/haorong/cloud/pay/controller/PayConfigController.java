/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.pay.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.haorong.cloud.common.core.desensitization.KeyDesensitization;
import com.haorong.cloud.common.core.util.FileUtils;
import com.haorong.cloud.common.core.util.Result;
import com.haorong.cloud.pay.api.entity.PayConfig;
import com.haorong.cloud.pay.service.IPayConfigService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

/**
 * 支付配置
 *
 * @author haorong
 * @since 2022/3/18 10:11
 */
@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/payconfig")
@Tag(description = "payconfig", name = "支付配置")
public class PayConfigController {

	private final IPayConfigService payConfigService;

	private final KeyDesensitization keyDesensitization = new KeyDesensitization();

	@Value("${cert-dir:}")
	private String certDir;

	@Operation(summary = "支付配置列表")
	@SaCheckPermission("pay:payconfig:page")
	@GetMapping("/page")
	public Result page(Page page, PayConfig payConfig) {
		return Result.success(payConfigService.page(page, Wrappers.lambdaQuery(payConfig)));
	}

	@Operation(summary = "支付配置查询")
	@SaCheckPermission("pay:payconfig:get")
	@GetMapping("/{id}")
	public Result page(@PathVariable("id") String id) {
		return Result.success(payConfigService.getById(id));
	}

	@Operation(summary = "支付配置新增")
	@SaCheckPermission("pay:payconfig:add")
	@PostMapping
	public Result add(@RequestBody @Valid PayConfig payConfig) {
		return Result.success(payConfigService.saveConfig(payConfig));
	}

	@Operation(summary = "支付配置编辑")
	@SaCheckPermission("pay:payconfig:edit")
	@PutMapping
	public Result edit(@RequestBody PayConfig payConfig) {
		if (StrUtil.isBlank(payConfig.getId())) {
			return Result.fail("支付配置ID为空");
		}
		PayConfig target = payConfigService.getById(payConfig.getId());
		if (ObjectUtil.isNull(target)) {
			return Result.fail("支付不存在");
		}

		if (StringUtils.hasText(target.getApiv3Key())
				&& keyDesensitization.serialize(target.getApiv3Key()).equals(payConfig.getApiv3Key())) {
			payConfig.setApiv3Key(null);
		}
		if (StringUtils.hasText(target.getCertSerialNo())
				&& keyDesensitization.serialize(target.getCertSerialNo()).equals(payConfig.getCertSerialNo())) {
			payConfig.setCertSerialNo(null);
		}
		if (StringUtils.hasText(target.getMchKey())
				&& keyDesensitization.serialize(target.getMchKey()).equals(payConfig.getMchKey())) {
			payConfig.setMchKey(null);
		}
		return Result.success(payConfigService.updateById(payConfig));
	}

	@Operation(summary = "支付配置删除")
	@SaCheckPermission("pay:payconfig:del")
	@DeleteMapping("/{id}")
	public Result del(@PathVariable("id") String id) {
		return Result.success(payConfigService.removeById(id));
	}

	@Operation(summary = "上传证书")
	@PostMapping("/cert/upload")
	public Result uploadFile(MultipartFile file) throws IOException {
		File newFile = FileUtils.multipartFileToFile(file);
		File response = FileUtil.writeBytes(FileUtil.readBytes(newFile), certDir + StrUtil.SLASH + newFile.getName());
		return Result.success(response.getPath());
	}

}
