/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.common.core.util;

import cn.hutool.core.lang.UUID;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

/**
 * file工具类
 *
 * @author haorong
 * @date 2022/6/10
 */
public class FileUtils {

	/**
	 * 将 MultipartFile 转为临时 File
	 * @param multipartFile 上传的文件
	 * @return 临时文件
	 * @throws IOException IO异常
	 */
	public static File multipartFileToFile(MultipartFile multipartFile) throws IOException {
		if (multipartFile == null || multipartFile.isEmpty()) {
			throw new IllegalArgumentException("上传文件不能为空");
		}

		String originalFilename = multipartFile.getOriginalFilename();
		String prefix = UUID.randomUUID().toString();
		String suffix = getFileExtension(originalFilename);

		// 创建临时文件
		File tempFile = File.createTempFile(prefix, suffix);
		tempFile.deleteOnExit(); // 程序退出时自动删除

		// 使用NIO快速复制
		try (var inputStream = multipartFile.getInputStream()) {
			Files.copy(inputStream, tempFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
		}

		return tempFile;
	}

	/**
	 * 获取文件名（去掉后缀）
	 * @param filename 文件名
	 * @return 文件名前缀
	 */
	public static String getFileNameWithoutExtension(String filename) {
		if (filename == null || filename.isBlank()) {
			return "";
		}
		int dotIndex = filename.lastIndexOf('.');
		return (dotIndex > 0) ? filename.substring(0, dotIndex) : filename;
	}

	/**
	 * 获取文件后缀（带.）
	 * @param filename 文件名
	 * @return 文件后缀
	 */
	public static String getFileExtension(String filename) {
		if (filename == null || filename.isBlank()) {
			return ".tmp"; // 默认后缀
		}
		int dotIndex = filename.lastIndexOf('.');
		return (dotIndex > 0) ? filename.substring(dotIndex) : ".tmp";
	}

}
