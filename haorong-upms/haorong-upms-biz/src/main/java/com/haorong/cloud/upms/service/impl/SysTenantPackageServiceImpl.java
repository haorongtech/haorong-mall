/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.upms.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.haorong.cloud.upms.api.entity.SysTenantPackage;
import com.haorong.cloud.upms.mapper.SysTenantPackageMapper;
import com.haorong.cloud.upms.service.ISysTenantPackageService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * 租户套餐
 *
 * @author haorong
 * @since 2022/2/26 16:51
 */
@Service
@AllArgsConstructor
public class SysTenantPackageServiceImpl extends ServiceImpl<SysTenantPackageMapper, SysTenantPackage>
		implements ISysTenantPackageService {

}
