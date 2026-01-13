/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.upms.service.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.haorong.cloud.common.core.constant.CommonConstants;
import com.haorong.cloud.common.core.desensitization.KeyDesensitization;
import com.haorong.cloud.common.security.handler.HxBusinessException;
import com.haorong.cloud.upms.api.dto.SysStorageConfigDTO;
import com.haorong.cloud.upms.api.entity.SysStorageConfig;
import com.haorong.cloud.upms.mapper.SysStorageConfigMapper;
import com.haorong.cloud.upms.service.ISysStorageConfigService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Objects;

/**
 * 文件存储配置
 *
 * @author haorong
 * @since 2022/2/26 16:47
 */
@Service
@RequiredArgsConstructor
public class SysStorageConfigServiceImpl extends ServiceImpl<SysStorageConfigMapper, SysStorageConfig>
		implements ISysStorageConfigService {

	private final KeyDesensitization keyDesensitization = new KeyDesensitization();

	@Override
	public SysStorageConfigDTO getConfig() {
		return baseMapper.selectConfig();
	}

	@Override
	public boolean saveStorageConfig(SysStorageConfig sysStorageConfig) {
		if (sysStorageConfig.getStatus().equals(CommonConstants.NORMAL_STATUS)) {
			// 更改其他启用配置
			updateStatus();
		}
		return this.save(sysStorageConfig);
	}

	@Override
	public boolean updateStorageConfigById(SysStorageConfig sysStorageConfig) {
		SysStorageConfig target = this.getById(sysStorageConfig.getId());
		if (Objects.isNull(target)) {
			throw new HxBusinessException("文件配置不存在");
		}

		if (StringUtils.hasText(target.getAccessKey())
				&& keyDesensitization.serialize(target.getAccessKey()).equals(sysStorageConfig.getAccessKey())) {
			sysStorageConfig.setAccessKey(null);
		}
		if (StringUtils.hasText(target.getAccessSecret())
				&& keyDesensitization.serialize(target.getAccessSecret()).equals(sysStorageConfig.getAccessSecret())) {
			sysStorageConfig.setAccessSecret(null);
		}
		if (sysStorageConfig.getStatus().equals(CommonConstants.NORMAL_STATUS)) {
			// 更改其他启用配置
			updateStatus();
		}

		return this.updateById(sysStorageConfig);
	}

	public void updateStatus() {
		SysStorageConfig sysStorageConfig = new SysStorageConfig();
		sysStorageConfig.setStatus(CommonConstants.YES);
		super.update(sysStorageConfig, Wrappers.<SysStorageConfig>lambdaQuery()
			.eq(SysStorageConfig::getStatus, CommonConstants.NORMAL_STATUS));
	}

}
