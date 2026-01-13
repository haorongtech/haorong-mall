/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.miniapp.dubbo;

import com.haorong.cloud.miniapp.api.remote.RemoteWxAppService;
import com.haorong.cloud.miniapp.api.vo.WxAppV0;
import com.haorong.cloud.miniapp.service.IWxAppService;
import lombok.RequiredArgsConstructor;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.stereotype.Service;

@Service
@DubboService
@RequiredArgsConstructor
public class RemoteWxAppServiceImpl implements RemoteWxAppService {

	private final IWxAppService wxAppService;

	@Override
	public WxAppV0 getById(String appId) {
		return wxAppService.findByAppId(appId);
	}

}
