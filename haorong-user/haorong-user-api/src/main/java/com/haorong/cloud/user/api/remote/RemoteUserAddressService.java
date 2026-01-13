/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.user.api.remote;

import com.haorong.cloud.user.api.entity.UserAddress;

/**
 * 用户地址远程调用
 *
 * @author haorong
 * @date 2024-11-14
 */
public interface RemoteUserAddressService {

	UserAddress getById(String id);

}
