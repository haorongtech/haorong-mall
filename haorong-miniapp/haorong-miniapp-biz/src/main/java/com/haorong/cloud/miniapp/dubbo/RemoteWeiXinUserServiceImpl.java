/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.miniapp.dubbo;

import cn.binarywang.wx.miniapp.bean.WxMaPhoneNumberInfo;
import com.haorong.cloud.miniapp.api.dto.WxUserLoginReqDTO;
import com.haorong.cloud.miniapp.api.dto.WxUserReqDTO;
import com.haorong.cloud.miniapp.api.entity.WxUser;
import com.haorong.cloud.miniapp.api.remote.RemoteWeiXinUserService;
import com.haorong.cloud.miniapp.service.IWxUserService;
import lombok.RequiredArgsConstructor;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.stereotype.Service;

@Service
@DubboService
@RequiredArgsConstructor
public class RemoteWeiXinUserServiceImpl implements RemoteWeiXinUserService {

	private final IWxUserService wxUserService;

	@Override
	public WxUser maLogin(WxUserLoginReqDTO wxUserLoginReqDTO) {
		return wxUserService.login(wxUserLoginReqDTO);
	}

	@Override
	public WxMaPhoneNumberInfo getPhoneNumberInfo(WxUserLoginReqDTO wxUserLoginReqDTO) {
		return wxUserService.decryptPhone(wxUserLoginReqDTO);
	}

	@Override
	public boolean bindUserId(WxUserReqDTO wxUserReqDTO) {
		return wxUserService.bindUserId(wxUserReqDTO);
	}

	@Override
	public boolean unbindUserId(WxUserReqDTO wxUserReqDTO) {
		return wxUserService.unbindUserId(wxUserReqDTO);
	}

	@Override
	public WxUser getInnerById(String id) {
		return wxUserService.getById(id);
	}

}
