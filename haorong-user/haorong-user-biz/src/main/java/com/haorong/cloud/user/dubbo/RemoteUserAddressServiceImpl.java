/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.user.dubbo;

import com.haorong.cloud.user.api.entity.UserAddress;
import com.haorong.cloud.user.api.remote.RemoteUserAddressService;
import com.haorong.cloud.user.service.IUserAddressService;
import lombok.RequiredArgsConstructor;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.stereotype.Service;

/**
 * @author lijia
 * @description
 * @date 2024/11/23
 */
@Service
@DubboService
@RequiredArgsConstructor
public class RemoteUserAddressServiceImpl implements RemoteUserAddressService {

	private final IUserAddressService userAddressService;

	@Override
	public UserAddress getById(String id) {
		return userAddressService.getById(id);
	}

}
