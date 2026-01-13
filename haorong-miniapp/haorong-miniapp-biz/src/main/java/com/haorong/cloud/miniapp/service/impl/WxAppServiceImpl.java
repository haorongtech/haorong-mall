/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.miniapp.service.impl;

import cn.binarywang.wx.miniapp.api.WxMaService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.haorong.cloud.common.core.constant.CacheConstants;
import com.haorong.cloud.common.core.desensitization.KeyDesensitization;
import com.haorong.cloud.common.security.handler.HxBusinessException;
import com.haorong.cloud.miniapp.api.dto.WxQrCodeDTO;
import com.haorong.cloud.miniapp.api.entity.WxApp;
import com.haorong.cloud.miniapp.api.vo.WxAppV0;
import com.haorong.cloud.miniapp.config.WechatConfigCache;
import com.haorong.cloud.miniapp.config.WxMaConfiguration;
import com.haorong.cloud.miniapp.mapper.WxAppMapper;
import com.haorong.cloud.miniapp.service.IWxAppService;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import java.util.Base64;
import java.util.Objects;

/**
 * 微信应用
 *
 * @author haorong
 * @since 2022/2/26 16:37
 */
@Service
@RequiredArgsConstructor
public class WxAppServiceImpl extends ServiceImpl<WxAppMapper, WxApp> implements IWxAppService {

	private final KeyDesensitization keyDesensitization = new KeyDesensitization();

	private final WechatConfigCache configCache;

	private final StringRedisTemplate stringRedisTemplate;

	@Override
	@Cacheable(value = CacheConstants.WX_APP_CACHE, key = "#appId", unless = "#result == null")
	public WxAppV0 findByAppId(String appId) {
		return baseMapper.selectByAppId(appId);
	}

	@Override
	public IPage<WxAppV0> getPage(Page page, WxApp wxApp) {
		return baseMapper.selectWxAppPage(page, wxApp);
	}

	@Override
	@Cacheable(value = CacheConstants.WX_APP_CACHE, key = "#appId", unless = "#result == null")
	public WxAppV0 getWxAppById(String appId) {
		return baseMapper.selectWxAppByAppId(appId);
	}

	@Override
	public String createWxaCodeUnlimit(WxQrCodeDTO wxQrCodeDTO) {
		// String key = "wx_qrcode_" + wxQrCodeDTO.getAppId() + wxQrCodeDTO.getScene() +
		// wxQrCodeDTO.getPage();
		// String qrcode = stringRedisTemplate.opsForValue().get(key);
		// if (StringUtils.hasText(qrcode)) {
		// return "data:image/png;base64," + qrcode;
		// }

		final WxMaService wxService = WxMaConfiguration.getMaService(wxQrCodeDTO.getAppId());
		try {
			byte[] buffer = wxService.getQrcodeService()
				.createWxaCodeUnlimitBytes(wxQrCodeDTO.getScene(), wxQrCodeDTO.getPage(), false,
						wxQrCodeDTO.getEnvVersion(), 380, false, null, false);
			String rsEncode = new String(Base64.getEncoder().encode(buffer));
			// stringRedisTemplate.opsForValue().set(key, rsEncode, 60 * 60 * 24);
			return "data:image/png;base64," + rsEncode;
		}
		catch (Exception e) {
			throw new HxBusinessException(e.getMessage());
		}
	}

	@Override
	@CacheEvict(value = CacheConstants.WX_APP_CACHE, key = "#wxApp.appId", allEntries = true)
	public Boolean updateWxAppById(WxApp wxApp) {
		WxApp target = baseMapper.selectById(wxApp.getAppId());
		if (Objects.isNull(target)) {
			throw new HxBusinessException("应用不存在");
		}
		if (keyDesensitization.serialize(target.getAppSecret()).equals(wxApp.getAppSecret())) {
			wxApp.setAppSecret(null);
		}
		configCache.updateConfig(wxApp);
		return this.updateById(wxApp);
	}

	@Override
	public boolean saveWxApp(WxApp wxApp) {
		baseMapper.insert(wxApp);
		configCache.updateConfig(wxApp);
		return true;
	}

	@Override
	@CacheEvict(value = CacheConstants.WX_APP_CACHE, key = "#id", allEntries = true)
	public boolean removeWxAppById(String id) {
		baseMapper.deleteById(id);
		configCache.removeByAppId(id);
		return true;
	}

}
