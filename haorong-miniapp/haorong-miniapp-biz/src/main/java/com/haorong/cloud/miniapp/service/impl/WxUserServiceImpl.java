/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.miniapp.service.impl;

import cn.binarywang.wx.miniapp.api.WxMaService;
import cn.binarywang.wx.miniapp.bean.WxMaJscode2SessionResult;
import cn.binarywang.wx.miniapp.bean.WxMaPhoneNumberInfo;
import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.haorong.cloud.common.myabtis.tenant.HxTenantContextHolder;
import com.haorong.cloud.common.security.handler.HxBusinessException;
import com.haorong.cloud.miniapp.api.dto.WxUserLoginReqDTO;
import com.haorong.cloud.miniapp.api.dto.WxUserReqDTO;
import com.haorong.cloud.miniapp.api.entity.WxUser;
import com.haorong.cloud.miniapp.api.vo.WxAppV0;
import com.haorong.cloud.miniapp.api.vo.WxUserVo;
import com.haorong.cloud.miniapp.config.WxMaConfiguration;
import com.haorong.cloud.miniapp.mapper.WxAppMapper;
import com.haorong.cloud.miniapp.mapper.WxUserMapper;
import com.haorong.cloud.miniapp.service.IWxUserService;
import lombok.RequiredArgsConstructor;
import me.chanjar.weixin.common.error.WxErrorException;
import org.springframework.stereotype.Service;

import java.util.Objects;

/**
 * 微信用户
 *
 * @author haorong
 * @since 2022/2/26 16:37
 */
@Service
@RequiredArgsConstructor
public class WxUserServiceImpl extends ServiceImpl<WxUserMapper, WxUser> implements IWxUserService {

	private final WxAppMapper wxAppMapper;

	@Override
	public IPage<WxUserVo> adminPage(Page page, WxUser wxUser) {
		return baseMapper.selectAdminPage(page, wxUser);
	}

	@Override
	public WxUser login(WxUserLoginReqDTO wxUserLoginReqDTO) {
		WxAppV0 wxApp = wxAppMapper.selectByAppId(wxUserLoginReqDTO.getAppId());
		if (Objects.isNull(wxApp)) {
			throw new HxBusinessException("小程序配置不存在");
		}
		HxTenantContextHolder.setTenantId(wxApp.getTenantId());
		final WxMaService wxService = WxMaConfiguration.getMaService(wxUserLoginReqDTO.getAppId());
		try {
			WxMaJscode2SessionResult session = wxService.getUserService().getSessionInfo(wxUserLoginReqDTO.getJsCode());
			// 查询微信用户
			WxUser wxUser = this.getOne(Wrappers.<WxUser>lambdaQuery()
				.eq(WxUser::getAppId, wxUserLoginReqDTO.getAppId())
				.eq(WxUser::getOpenid, session.getOpenid()));
			if (ObjectUtil.isNull(wxUser)) {
				wxUser = new WxUser();
				wxUser.setOpenid(session.getOpenid());
			}
			wxUser.setSessionKey(session.getSessionKey());
			wxUser.setUnionid(session.getUnionid());
			wxUser.setAppId(wxUserLoginReqDTO.getAppId());
			this.saveOrUpdate(wxUser);
			return wxUser;
		}
		catch (WxErrorException e) {
			throw new HxBusinessException(e.getMessage());
		}
	}

	@Override
	public WxMaPhoneNumberInfo decryptPhone(WxUserLoginReqDTO wxUserLoginReqDTO) {
		final WxMaService wxService = WxMaConfiguration.getMaService(wxUserLoginReqDTO.getAppId());
		// 解密
		WxMaPhoneNumberInfo phoneNoInfo = null;
		try {
			phoneNoInfo = wxService.getUserService().getPhoneNoInfo(wxUserLoginReqDTO.getCode());
		}
		catch (WxErrorException e) {
			throw new RuntimeException(e);
		}
		return phoneNoInfo;
	}

	@Override
	public Boolean bindUserId(WxUserReqDTO wxUserReqDTO) {
		WxUser wxUser = this.getById(wxUserReqDTO.getWxUserId());
		if (Objects.isNull(wxUser)) {
			throw new HxBusinessException("用户不存在");
		}
		wxUser.setMallUserId(wxUserReqDTO.getUserId());
		return this.updateById(wxUser);
	}

	@Override
	public Boolean unbindUserId(WxUserReqDTO wxUserReqDTO) {
		WxUser wxUser = this.getOne(Wrappers.<WxUser>lambdaQuery()
			.eq(WxUser::getAppId, wxUserReqDTO.getAppId())
			.eq(WxUser::getOpenid, wxUserReqDTO.getOpenId())
			.eq(WxUser::getMallUserId, wxUserReqDTO.getUserId()));
		if (Objects.nonNull(wxUser)) {
			wxUser.setMallUserId("");
			return this.updateById(wxUser);
		}
		return true;
	}

}
