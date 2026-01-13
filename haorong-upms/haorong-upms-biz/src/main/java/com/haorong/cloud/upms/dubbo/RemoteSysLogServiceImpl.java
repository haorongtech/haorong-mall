/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.upms.dubbo;

import com.haorong.cloud.upms.api.entity.SysLog;
import com.haorong.cloud.upms.api.entity.SysLoginLog;
import com.haorong.cloud.upms.api.remote.RemoteSysLogService;
import com.haorong.cloud.upms.service.ISysLogService;
import com.haorong.cloud.upms.service.ISysLoginLogService;
import lombok.RequiredArgsConstructor;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.stereotype.Service;

/**
 * @author lijia
 * @description
 * @date 2024/11/22
 */
@Service
@DubboService
@RequiredArgsConstructor
public class RemoteSysLogServiceImpl implements RemoteSysLogService {

	private final ISysLogService sysLogService;

	private final ISysLoginLogService sysLoginLogService;

	@Override
	public Boolean saveLog(SysLog sysLog) {
		return sysLogService.save(sysLog);
	}

	@Override
	public Boolean saveLoginLog(SysLoginLog sysLoginLog) {
		return sysLoginLogService.save(sysLoginLog);
	}

}
