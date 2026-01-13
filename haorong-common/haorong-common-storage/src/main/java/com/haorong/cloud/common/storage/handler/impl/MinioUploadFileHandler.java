/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.common.storage.handler.impl;

import com.haorong.cloud.common.myabtis.tenant.HxTenantContextHolder;
import com.haorong.cloud.common.storage.entity.StorageConfig;
import io.minio.MinioClient;
import io.minio.PutObjectArgs;
import lombok.SneakyThrows;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import java.io.File;
import java.io.FileInputStream;
import java.util.UUID;

/**
 * Minio上传文件处理器
 *
 * @author haorong
 */
@Component("uploadFile4")
public class MinioUploadFileHandler extends AbstractUploadFileHandler {

	@SneakyThrows
	@Override
	public String doUploadFile(StorageConfig storageConfig, File file) {
		String endpoint = storageConfig.getEndpoint();
		MinioClient minioClient = MinioClient.builder()
			.endpoint(endpoint)
			.credentials(storageConfig.getAccessKeyId(), storageConfig.getAccessKeySecret())
			.build();

		String bucketName = storageConfig.getBucket();
		String fileName = file.getName();
		// 获取后缀
		String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
		String dir = storageConfig.getDir();
		String uuidFileName = UUID.randomUUID() + "." + suffix;
		String objectName = HxTenantContextHolder.getTenantId() + (StringUtils.hasText(dir) ? ("/" + dir) : "") + "/"
				+ uuidFileName;
		PutObjectArgs putObjectArgs = PutObjectArgs.builder()
			.bucket(bucketName)
			.object(objectName)
			.stream(new FileInputStream(file), file.length(), -1)
			.contentType(storageConfig.getContextType())
			.build();

		minioClient.putObject(putObjectArgs);
		return endpoint + "/" + bucketName + "/" + objectName;
	}

}
