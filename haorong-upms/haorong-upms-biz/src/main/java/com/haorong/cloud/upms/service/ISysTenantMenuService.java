/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.upms.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.haorong.cloud.upms.api.dto.SysTenantMenuDTO;
import com.haorong.cloud.upms.api.entity.SysTenantMenu;

/**
 * 租户分配菜单
 *
 * @author haorong
 * @since 2022/2/26 16:47
 */
public interface ISysTenantMenuService extends IService<SysTenantMenu> {

	boolean saveTenantMenu(SysTenantMenuDTO sysTenantMenuDTO);

}
