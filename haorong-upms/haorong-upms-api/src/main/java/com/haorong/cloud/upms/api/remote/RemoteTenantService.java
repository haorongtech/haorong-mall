/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.upms.api.remote;

import com.haorong.cloud.upms.api.entity.SysTenant;

import java.util.List;

/**
 * 租户
 *
 * @author haorong
 * @date 2023/1/06
 */
public interface RemoteTenantService {

	/**
	 * 查询全部有效租户
	 * @return
	 */
	List<SysTenant> list();

}
