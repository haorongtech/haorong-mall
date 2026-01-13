/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.upms.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.haorong.cloud.upms.api.dto.SysStorageConfigDTO;
import com.haorong.cloud.upms.api.entity.SysStorageConfig;

/**
 * 文件存储配置
 *
 * @author haorong
 * @since 2022/2/26 16:47
 */
public interface ISysStorageConfigService extends IService<SysStorageConfig> {

	/**
	 * 查询文件配置
	 *
	 * @author haorong
	 * @date 2022/9/20
	 * @return: com.haorong.cloud.upms.common.dto.SysStorageConfigDTO
	 */
	SysStorageConfigDTO getConfig();

	/**
	 * 新增配置
	 * @param sysStorageConfig
	 * @return
	 */
	boolean saveStorageConfig(SysStorageConfig sysStorageConfig);

	/**
	 * 修改配置
	 * @param sysStorageConfig
	 * @return
	 */
	boolean updateStorageConfigById(SysStorageConfig sysStorageConfig);

}
