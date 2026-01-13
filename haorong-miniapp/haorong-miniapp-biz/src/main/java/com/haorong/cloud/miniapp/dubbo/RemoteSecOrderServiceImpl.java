/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.miniapp.dubbo;

import cn.binarywang.wx.miniapp.api.WxMaService;
import cn.binarywang.wx.miniapp.bean.shop.request.shipping.WxMaOrderShippingInfoUploadRequest;
import com.haorong.cloud.common.security.handler.HxBusinessException;
import com.haorong.cloud.miniapp.api.remote.RemoteSecOrderService;
import com.haorong.cloud.miniapp.config.WxMaConfiguration;
import lombok.RequiredArgsConstructor;
import me.chanjar.weixin.common.error.WxErrorException;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.stereotype.Service;

@Service
@DubboService
@RequiredArgsConstructor
public class RemoteSecOrderServiceImpl implements RemoteSecOrderService {

	@Override
	public void uploadShippingInfo(WxMaOrderShippingInfoUploadRequest wxMaOrderShippingInfoUploadRequest,
			String appId) {
		final WxMaService wxService = WxMaConfiguration.getMaService(appId);

		try {
			wxService.getWxMaOrderShippingService().upload(wxMaOrderShippingInfoUploadRequest);
		}
		catch (WxErrorException e) {
			throw new HxBusinessException(e.getMessage());
		}
	}

}
