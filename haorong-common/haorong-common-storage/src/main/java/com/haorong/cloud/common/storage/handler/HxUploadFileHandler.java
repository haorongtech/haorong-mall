/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.common.storage.handler;

import com.haorong.cloud.upms.api.dto.SysStorageConfigDTO;

import java.io.File;

public interface HxUploadFileHandler {

	String uploadFile(SysStorageConfigDTO sysStorageConfig, File file, String contextType);

}
