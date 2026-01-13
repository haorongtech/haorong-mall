/** 
  * Copyright (c) 2025 沈阳浩荣科技有限公司 
  * All rights reserved. 
  * <p> 
  * 注意： 
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。 
 
  */
package com.haorong.cloud.upms.controller;

import cn.hutool.core.util.ObjectUtil;
import com.haorong.cloud.common.core.util.FileUtils;
import com.haorong.cloud.common.core.util.Result;
import com.haorong.cloud.common.storage.handler.HxUploadFileHandler;
import com.haorong.cloud.upms.api.dto.SysStorageConfigDTO;
import com.haorong.cloud.upms.api.entity.SysMaterial;
import com.haorong.cloud.upms.service.ISysMaterialService;
import com.haorong.cloud.upms.service.ISysStorageConfigService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.Map;

/**
 * 文件上传
 *
 * @author haorong
 * @since 2022/2/26 16:45
 */
@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/file")
@Tag(description = "file", name = "文件上传")
public class SysUploadController {

	private final ISysStorageConfigService sysStorageConfigService;

	private final Map<String, HxUploadFileHandler> hxUploadFileHandlerMap;

	private final ISysMaterialService sysMaterialService;

	@Operation(summary = "文件上传")
	@PostMapping("/upload")
	public Result upload(@RequestPart("file") MultipartFile file,
			@RequestParam(value = "groupId", required = false) String groupId,
			@RequestParam(value = "type", required = false) String type) throws Exception {
		File newFile = FileUtils.multipartFileToFile(file);
		SysStorageConfigDTO sysStorageConfig = sysStorageConfigService.getConfig();
		if (ObjectUtil.isNull(sysStorageConfig)) {
			throw new RuntimeException("文件存储配置为空");
		}
		String url = hxUploadFileHandlerMap.get("uploadFile" + sysStorageConfig.getType())
			.uploadFile(sysStorageConfig, newFile, file.getContentType());

		SysMaterial sysMaterial = new SysMaterial();
		sysMaterial.setUrl(url);
		sysMaterial.setFileSize(file.getSize());
		sysMaterial.setGroupId(groupId);
		sysMaterial.setType(type);
		sysMaterial.setName(file.getOriginalFilename());
		return Result.success(sysMaterialService.save(sysMaterial));
	}

	@Operation(summary = "移动端文件上传")
	@PostMapping("/app/upload")
	public Result appUpload(@RequestPart("file") MultipartFile file) throws Exception {
		File newFile = FileUtils.multipartFileToFile(file);
		SysStorageConfigDTO sysStorageConfig = sysStorageConfigService.getConfig();
		if (ObjectUtil.isNull(sysStorageConfig)) {
			throw new RuntimeException("文件存储配置为空");
		}
		String url = hxUploadFileHandlerMap.get("uploadFile" + sysStorageConfig.getType())
			.uploadFile(sysStorageConfig, newFile, file.getContentType());
		return Result.success(url);
	}

}
