/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.miniapp.config;

import com.haorong.cloud.common.myabtis.tenant.HxTenantContextHolder;
import com.haorong.cloud.miniapp.api.entity.WxApp;
import com.haorong.cloud.miniapp.service.IWxAppService;
import com.haorong.cloud.upms.api.entity.SysTenant;
import com.haorong.cloud.upms.api.remote.RemoteTenantService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.config.annotation.DubboReference;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import java.util.List;

@Slf4j
@Component
@RequiredArgsConstructor
public class WechatConfigLoader implements ApplicationRunner {

	private final WechatConfigCache configCache;

	private final IWxAppService wxAppService; // 查询数据库的 service

	@DubboReference
	private final RemoteTenantService remoteTenantService;

	@Override
	public void run(ApplicationArguments args) throws Exception {
		List<SysTenant> tenants = remoteTenantService.list();
		if (!CollectionUtils.isEmpty(tenants)) {
			tenants.forEach(tenant -> {
				HxTenantContextHolder.setTenantId(tenant.getId());
				List<WxApp> configs = wxAppService.list();
				configCache.addConfigs(configs);
				HxTenantContextHolder.removeTenantId();
			});
			log.info("全部小程序配置信息条数：{} 条", configCache.getAllConfigs().size());

		}
	}

}
