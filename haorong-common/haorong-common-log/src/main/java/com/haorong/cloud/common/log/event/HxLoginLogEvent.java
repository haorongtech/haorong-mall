/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.common.log.event;

import com.haorong.cloud.upms.api.entity.SysLoginLog;
import lombok.Getter;
import org.springframework.context.ApplicationEvent;

/**
 * @author: haorong
 * @date: 2023/6/26 11:51
 **/
public class HxLoginLogEvent extends ApplicationEvent {

	@Getter
	private final SysLoginLog sysLoginLog;

	public HxLoginLogEvent(Object source, SysLoginLog sysLoginLog) {
		super(source);
		this.sysLoginLog = sysLoginLog;
	}

}
