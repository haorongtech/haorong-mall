/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.common.log.event;

import com.haorong.cloud.upms.api.entity.SysLog;
import lombok.Getter;
import org.springframework.context.ApplicationEvent;

/**
 * @author: haorong
 * @date: 2023/6/26 11:51
 **/
public class HxLogEvent extends ApplicationEvent {

	@Getter
	private final SysLog sysLog;

	public HxLogEvent(Object source, SysLog sysLog) {
		super(source);
		this.sysLog = sysLog;
	}

}
