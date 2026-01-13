/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.upms.api.remote;

import com.haorong.cloud.upms.api.entity.SysLog;
import com.haorong.cloud.upms.api.entity.SysLoginLog;

/**
 * 系统操作日志
 *
 * @author: haorong
 * @date: 2023/6/26 11:01
 **/
public interface RemoteSysLogService {

	/**
	 * 保存系统操作日志
	 * @param sysLog
	 * @author haorong
	 * @date 2022/6/28
	 * @return: com.haorong.cloud.common.core.util.Result
	 */
	Boolean saveLog(SysLog sysLog);

	/**
	 * 保存登录日志
	 * @param sysLoginLog
	 * @author haorong
	 * @date 2022/6/28
	 * @return: com.haorong.cloud.common.core.util.Result
	 */
	Boolean saveLoginLog(SysLoginLog sysLoginLog);

}
