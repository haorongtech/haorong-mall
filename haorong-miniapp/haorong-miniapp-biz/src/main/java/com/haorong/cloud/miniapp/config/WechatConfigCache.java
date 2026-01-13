/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.miniapp.config;

import com.haorong.cloud.miniapp.api.entity.WxApp;
import org.springframework.stereotype.Component;

import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@Component

public class WechatConfigCache {

	// appId -> 配置（可从 appId 直接找配置）
	private final Map<String, WxApp> appIdMap = new ConcurrentHashMap<>();

	public void addConfigs(List<WxApp> configs) {
		configs.forEach(config -> appIdMap.put(config.getAppId(), config));
	}

	public WxApp getByAppId(String appId) {
		return appIdMap.get(appId);
	}

	public void updateConfig(WxApp config) {
		appIdMap.put(config.getAppId(), config);
	}

	public void removeByAppId(String appId) {
		appIdMap.remove(appId);
	}

	public Collection<WxApp> getAllConfigs() {
		return appIdMap.values();
	}

}
