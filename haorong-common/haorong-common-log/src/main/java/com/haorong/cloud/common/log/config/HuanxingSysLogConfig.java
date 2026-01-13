/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.common.log.config;

import com.haorong.cloud.common.log.aop.LogAopAspect;
import com.haorong.cloud.common.log.event.HxLogEventListener;
import com.haorong.cloud.upms.api.remote.RemoteSysLogService;
import lombok.RequiredArgsConstructor;
import org.apache.dubbo.config.annotation.DubboReference;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * 日志配置
 *
 * @author haorong
 * @date 2022/6/10
 */
@Configuration
@RequiredArgsConstructor
public class HuanxingSysLogConfig {

	@DubboReference
	private final RemoteSysLogService remoteSysLogService;

	@Bean
	public HxLogEventListener hxLogEventListener() {
		return new HxLogEventListener(remoteSysLogService);
	}

	@Bean
	public LogAopAspect logAopAspect(ApplicationEventPublisher publisher) {
		return new LogAopAspect(publisher);
	}

}
