/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.auth.controller;

import cn.dev33.satoken.stp.SaTokenInfo;
import cn.dev33.satoken.stp.StpUtil;
import com.haorong.cloud.auth.service.TocLoginService;
import com.haorong.cloud.common.core.constant.MallCommonConstants;
import com.haorong.cloud.common.core.enums.ClientTypeEnum;
import com.haorong.cloud.common.core.util.Result;
import com.haorong.cloud.common.security.util.SecurityUtils;
import com.haorong.cloud.miniapp.api.dto.WxUserReqDTO;
import com.haorong.cloud.miniapp.api.remote.RemoteWeiXinUserService;
import com.haorong.cloud.user.api.dto.UserLoginReqDTO;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.DubboReference;
import org.springframework.web.bind.annotation.*;

/**
 * 商城用户端授权登录
 *
 * @author haorong
 * @since 2024/5/6 13:37
 */
@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/toc-token")
@Tag(description = "toc-token", name = "商城用户端授权登录")
public class TocTokenController {

	private final TocLoginService tocLoginService;

	@DubboReference
	private final RemoteWeiXinUserService remoteWeiXinUserService;

	@Operation(summary = "小程序登录")
	@PostMapping("/ma/login")
	public Result<Object> maLogin(HttpServletRequest request, @RequestBody UserLoginReqDTO userLoginReqDTO) {
		userLoginReqDTO.setAppId(request.getHeader(MallCommonConstants.HEADER_APP_ID));
		return Result.success(tocLoginService.maLogin(userLoginReqDTO));
	}

	@Operation(summary = "小程序手机号一键登录")
	@PostMapping("/ma/phone/login")
	public Result<SaTokenInfo> maPhoneLogin(HttpServletRequest request, @RequestBody UserLoginReqDTO userLoginReqDTO) {
		userLoginReqDTO.setAppId(request.getHeader(MallCommonConstants.HEADER_APP_ID));
		userLoginReqDTO.setWxUserId(request.getHeader(MallCommonConstants.WX_USER_ID));
		userLoginReqDTO.setClientType(request.getHeader(MallCommonConstants.HEADER_CLIENT_TYPE));
		return Result.success(tocLoginService.maPhoneLogin(userLoginReqDTO));
	}

	@Operation(summary = "短信验证码登录")
	@PostMapping("/sms/login")
	public Result<SaTokenInfo> smsLogin(HttpServletRequest request, @RequestBody UserLoginReqDTO userLoginReqDTO) {
		userLoginReqDTO.setAppId(request.getHeader(MallCommonConstants.HEADER_APP_ID));
		userLoginReqDTO.setWxUserId(request.getHeader(MallCommonConstants.WX_USER_ID));
		userLoginReqDTO.setClientType(request.getHeader(MallCommonConstants.HEADER_CLIENT_TYPE));
		return Result.success(tocLoginService.smsLogin(userLoginReqDTO));
	}

	@Operation(summary = "密码登录")
	@PostMapping("/password/login")
	public Result<SaTokenInfo> passwordLogin(HttpServletRequest request, @RequestBody UserLoginReqDTO userLoginReqDTO) {
		userLoginReqDTO.setAppId(request.getHeader(MallCommonConstants.HEADER_APP_ID));
		userLoginReqDTO.setWxUserId(request.getHeader(MallCommonConstants.WX_USER_ID));
		userLoginReqDTO.setClientType(request.getHeader(MallCommonConstants.HEADER_CLIENT_TYPE));
		return Result.success(tocLoginService.passwordLogin(userLoginReqDTO));
	}

	/**
	 * 用户退出
	 *
	 * @author haorong
	 * @date 2022/5/3 20:46
	 * @version 1.0
	 */
	@DeleteMapping("/logout")
	public Result<Void> logout(HttpServletRequest request) {
		String appId = request.getHeader(MallCommonConstants.HEADER_APP_ID);
		String clientType = request.getHeader(MallCommonConstants.HEADER_CLIENT_TYPE);

		// 小程序解绑商城用户
		if (ClientTypeEnum.WX_MA.getCode().equals(clientType)) {
			WxUserReqDTO wxUserReqDTO = new WxUserReqDTO();
			wxUserReqDTO.setOpenId(SecurityUtils.getUser().getOpenId());
			wxUserReqDTO.setUserId(String.valueOf(StpUtil.getLoginId()));
			wxUserReqDTO.setAppId(appId);
			remoteWeiXinUserService.unbindUserId(wxUserReqDTO);
		}
		StpUtil.logout();
		return Result.success();
	}

}
