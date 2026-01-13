/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.miniapp.config;

import cn.binarywang.wx.miniapp.api.WxMaService;
import cn.binarywang.wx.miniapp.api.impl.WxMaServiceImpl;
import cn.hutool.core.util.ObjectUtil;
import com.haorong.cloud.common.core.util.SpringUtils;
import com.haorong.cloud.miniapp.api.entity.WxApp;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.core.StringRedisTemplate;

/**
 * 微信小程序配置
 *
 * @author haorong
 * @date 2022/6/10
 */
@Slf4j
@Configuration
@RequiredArgsConstructor
public class WxMaConfiguration {

	public static WxMaService getMaService(String appId) {
		WechatConfigCache wechatConfigCache = SpringUtils.getBean(WechatConfigCache.class);
		StringRedisTemplate stringRedisTemplate = SpringUtils.getBean(StringRedisTemplate.class);

		WxApp wxApp = wechatConfigCache.getByAppId(appId);
		if (ObjectUtil.isNull(wxApp)) {
			throw new RuntimeException("小程序配置不存在");
		}
		WxMaRedisConfigStorage configStorage = new WxMaRedisConfigStorage(stringRedisTemplate);
		configStorage.setAppid(wxApp.getAppId());
		configStorage.setSecret(wxApp.getAppSecret());
		configStorage.setToken(wxApp.getToken());
		configStorage.setAesKey(wxApp.getAesKey());
		WxMaService wxMaService = new WxMaServiceImpl();
		wxMaService.setWxMaConfig(configStorage);

		return wxMaService;
	}

}
