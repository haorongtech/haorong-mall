/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.auth.service;

import cn.binarywang.wx.miniapp.bean.WxMaPhoneNumberInfo;
import cn.dev33.satoken.secure.SaSecureUtil;
import cn.dev33.satoken.stp.SaTokenInfo;
import cn.dev33.satoken.stp.StpUtil;
import com.haorong.cloud.common.core.enums.DeviceTypeEnum;
import com.haorong.cloud.common.myabtis.tenant.HxTenantContextHolder;
import com.haorong.cloud.common.security.entity.HxUser;
import com.haorong.cloud.common.security.util.SecurityUtils;
import com.haorong.cloud.miniapp.api.dto.WxUserLoginReqDTO;
import com.haorong.cloud.miniapp.api.dto.WxUserReqDTO;
import com.haorong.cloud.miniapp.api.entity.WxUser;
import com.haorong.cloud.miniapp.api.remote.RemoteWeiXinUserService;
import com.haorong.cloud.user.api.dto.UserLoginReqDTO;
import com.haorong.cloud.user.api.entity.UserInfo;
import com.haorong.cloud.user.api.remote.RemoteMallUserService;
import com.haorong.cloud.user.api.vo.UserInfoVO;
import lombok.RequiredArgsConstructor;
import org.apache.dubbo.config.annotation.DubboReference;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import java.util.Objects;

@Component
@RequiredArgsConstructor
public class TocLoginService {

	@DubboReference
	private final RemoteWeiXinUserService remoteWeiXinUserService;

	@DubboReference
	private final RemoteMallUserService remoteMallUserService;

	public SaTokenInfo maPhoneLogin(UserLoginReqDTO userLoginReqDTO) {
		WxUserLoginReqDTO wxUserLoginReqDTO = new WxUserLoginReqDTO();
		wxUserLoginReqDTO.setAppId(userLoginReqDTO.getAppId());
		wxUserLoginReqDTO.setCode(userLoginReqDTO.getCode());
		// 解密手机号
		WxMaPhoneNumberInfo wxMaPhoneNumberInfo = remoteWeiXinUserService.getPhoneNumberInfo(wxUserLoginReqDTO);
		if (Objects.isNull(wxMaPhoneNumberInfo)) {
			throw new IllegalArgumentException("login failed");
		}
		// 通过手机号查询商城用户，不存在创建新用户无需用户注册
		UserInfo userInfo = remoteMallUserService.getInfoByPhone(wxMaPhoneNumberInfo.getPhoneNumber(),
				userLoginReqDTO.getClientType());
		if (Objects.isNull(userInfo)) {
			throw new IllegalArgumentException("login failed");
		}
		// 获取小程序 openId
		String wxId = userLoginReqDTO.getWxUserId();
		// 查询小程序用户
		WxUser wxUser = remoteWeiXinUserService.getInnerById(wxId);
		if (Objects.isNull(wxUser)) {
			throw new IllegalArgumentException("login failed");
		}

		// openId绑定商城用户id 用户不退出登录以后都是无感知登录
		WxUserReqDTO wxUserReqDTO = new WxUserReqDTO();
		wxUserReqDTO.setWxUserId(wxId);
		wxUserReqDTO.setUserId(userInfo.getId());
		wxUserReqDTO.setAppId(userLoginReqDTO.getAppId());
		if (!remoteWeiXinUserService.bindUserId(wxUserReqDTO)) {
			throw new IllegalArgumentException("login failed");
		}

		HxUser hxUser = new HxUser();
		hxUser.setUserId(userInfo.getId());
		hxUser.setOpenId(wxUser.getOpenid());
		hxUser.setTenantId(HxTenantContextHolder.getTenantId());
		hxUser.setUsername(userInfo.getNickName());
		SecurityUtils.loginByDevice(hxUser, DeviceTypeEnum.TOC);
		return StpUtil.getTokenInfo();
	}

	public SaTokenInfo smsLogin(UserLoginReqDTO userLoginReqDTO) {

		// 通过手机号查询商城用户，不存在创建新用户无需用户注册
		UserInfo userInfo = remoteMallUserService.getInfoByPhone(userLoginReqDTO.getPhone(),
				userLoginReqDTO.getClientType());
		if (Objects.isNull(userInfo)) {
			throw new IllegalArgumentException("login failed");
		}

		HxUser hxUser = new HxUser();
		if (StringUtils.hasText(userLoginReqDTO.getWxUserId())) {
			// 查询小程序用户
			WxUser wxUser = remoteWeiXinUserService.getInnerById(userLoginReqDTO.getWxUserId());
			if (Objects.isNull(wxUser)) {
				throw new IllegalArgumentException("login failed");
			}

			// openId绑定商城用户id 用户不退出登录以后都是无感知登录
			WxUserReqDTO wxUserReqDTO = new WxUserReqDTO();
			wxUserReqDTO.setWxUserId(wxUser.getId());
			wxUserReqDTO.setUserId(userInfo.getId());
			wxUserReqDTO.setAppId(userLoginReqDTO.getAppId());
			if (!remoteWeiXinUserService.bindUserId(wxUserReqDTO)) {
				throw new IllegalArgumentException("login failed");

			}

			hxUser.setOpenId(wxUser.getOpenid());
		}

		hxUser.setUserId(userInfo.getId());
		hxUser.setTenantId(HxTenantContextHolder.getTenantId());
		hxUser.setUsername(userInfo.getNickName());
		SecurityUtils.loginByDevice(hxUser, DeviceTypeEnum.TOC);

		return StpUtil.getTokenInfo();
	}

	public SaTokenInfo passwordLogin(UserLoginReqDTO userLoginReqDTO) {
		// 通过手机号查询商城用户
		UserInfoVO userInfo = remoteMallUserService.getUserByPhone(userLoginReqDTO.getPhone());
		if (Objects.isNull(userInfo)) {
			throw new IllegalArgumentException("请先注册");
		}
		if (!StringUtils.hasText(userInfo.getPassword())) {
			throw new RuntimeException("账号或密码错误");
		}
		if (!userInfo.getPassword().equals(SaSecureUtil.md5(userLoginReqDTO.getPassword()))) {
			throw new RuntimeException("账号或密码错误");
		}
		HxUser hxUser = new HxUser();
		if (StringUtils.hasText(userLoginReqDTO.getWxUserId())) {
			// 查询小程序用户
			WxUser wxUser = remoteWeiXinUserService.getInnerById(userLoginReqDTO.getWxUserId());
			if (Objects.isNull(wxUser)) {
				throw new IllegalArgumentException("login failed");
			}

			// openId绑定商城用户id 用户不退出登录以后都是无感知登录
			WxUserReqDTO wxUserReqDTO = new WxUserReqDTO();
			wxUserReqDTO.setWxUserId(wxUser.getId());
			wxUserReqDTO.setUserId(userInfo.getId());
			wxUserReqDTO.setAppId(userLoginReqDTO.getAppId());
			if (!remoteWeiXinUserService.bindUserId(wxUserReqDTO)) {
				throw new IllegalArgumentException("login failed");

			}
			hxUser.setOpenId(wxUser.getOpenid());
		}
		hxUser.setUserId(userInfo.getId());
		hxUser.setTenantId(userInfo.getTenantId());
		hxUser.setUsername(userInfo.getNickName());
		SecurityUtils.loginByDevice(hxUser, DeviceTypeEnum.TOC);

		return StpUtil.getTokenInfo();
	}

	public Object maLogin(UserLoginReqDTO userLoginReqDTO) {
		WxUserLoginReqDTO wxUserLoginReqDTO = new WxUserLoginReqDTO();
		wxUserLoginReqDTO.setAppId(userLoginReqDTO.getAppId());
		wxUserLoginReqDTO.setJsCode(userLoginReqDTO.getJsCode());
		WxUser wxUser = remoteWeiXinUserService.maLogin(wxUserLoginReqDTO);
		if (Objects.isNull(wxUser)) {
			throw new IllegalArgumentException("login failed!");
		}

		if (!StringUtils.hasText(wxUser.getMallUserId())) {
			// 返回微信用户id
			return wxUser.getId();
		}
		// 已绑定商城用户 进行登录
		HxUser hxUser = new HxUser();
		hxUser.setUserId(wxUser.getMallUserId());
		hxUser.setOpenId(wxUser.getOpenid());
		hxUser.setTenantId(wxUser.getTenantId());
		hxUser.setUsername(wxUser.getOpenid());
		SecurityUtils.loginByDevice(hxUser, DeviceTypeEnum.TOC);

		return StpUtil.getTokenInfo();
	}

}
