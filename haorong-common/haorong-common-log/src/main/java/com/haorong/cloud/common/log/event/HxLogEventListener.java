/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.common.log.event;

import com.haorong.cloud.common.myabtis.tenant.HxTenantContextHolder;
import com.haorong.cloud.upms.api.entity.SysLog;
import com.haorong.cloud.upms.api.entity.SysLoginLog;
import com.haorong.cloud.upms.api.remote.RemoteSysLogService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.event.EventListener;
import org.springframework.scheduling.annotation.Async;

/**
 * @author: haorong
 * @date: 2023/6/26 11:51
 **/
@Slf4j
@RequiredArgsConstructor
public class HxLogEventListener {

	private final RemoteSysLogService remoteSysLogService;

	@Async("hxAsyncExecutor")
	@EventListener(HxLogEvent.class)
	public void saveSysLog(HxLogEvent event) {
		SysLog sysLog = event.getSysLog();
		log.info("调用远程接口之前: tenantId = {}", HxTenantContextHolder.getTenantId());

		remoteSysLogService.saveLog(sysLog);
	}

	@Async("hxAsyncExecutor")
	@EventListener(HxLoginLogEvent.class)
	public void saveSysLoginLog(HxLoginLogEvent event) {
		SysLoginLog sysLoginLog = event.getSysLoginLog();
		remoteSysLogService.saveLoginLog(sysLoginLog);
	}

}
