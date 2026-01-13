/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.common.storage.handler.impl;

import com.haorong.cloud.common.storage.entity.StorageConfig;
import com.haorong.cloud.common.storage.handler.HxUploadFileHandler;
import com.haorong.cloud.upms.api.dto.SysStorageConfigDTO;

import java.io.File;

/**
 * @author haorong
 */
public abstract class AbstractUploadFileHandler implements HxUploadFileHandler {

	@Override
	public String uploadFile(SysStorageConfigDTO sysStorageConfig, File file, String contextType) {
		StorageConfig storageConfig = validateRequest(sysStorageConfig, contextType);
		return doUploadFile(storageConfig, file);
	}

	public abstract String doUploadFile(StorageConfig storageConfig, File file);

	private StorageConfig validateRequest(SysStorageConfigDTO sysStorageConfig, String contextType) {
		StorageConfig storageConfig = new StorageConfig();
		storageConfig.setAccessKeyId(sysStorageConfig.getAccessKey());
		storageConfig.setAccessKeySecret(sysStorageConfig.getAccessSecret());
		storageConfig.setBucket(sysStorageConfig.getBucket());
		storageConfig.setEndpoint(sysStorageConfig.getEndpoint());
		storageConfig.setDir(sysStorageConfig.getDir());
		storageConfig.setContextType(contextType);
		return storageConfig;
	}

}
