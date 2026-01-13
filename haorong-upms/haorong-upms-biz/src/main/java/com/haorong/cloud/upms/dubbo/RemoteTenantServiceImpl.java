/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.upms.dubbo;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.haorong.cloud.common.core.constant.CommonConstants;
import com.haorong.cloud.upms.api.entity.SysTenant;
import com.haorong.cloud.upms.api.remote.RemoteTenantService;
import com.haorong.cloud.upms.service.ISysTenantService;
import lombok.RequiredArgsConstructor;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author lijia
 * @description
 * @date 2024/11/22
 */
@Service
@DubboService
@RequiredArgsConstructor
public class RemoteTenantServiceImpl implements RemoteTenantService {

	private final ISysTenantService sysTenantService;

	@Override
	public List<SysTenant> list() {
		return sysTenantService
			.list(Wrappers.<SysTenant>lambdaQuery().eq(SysTenant::getStatus, CommonConstants.NORMAL_STATUS));
	}

}
