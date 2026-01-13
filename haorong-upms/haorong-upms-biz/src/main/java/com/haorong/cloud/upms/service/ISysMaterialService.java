/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.upms.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.haorong.cloud.upms.api.entity.SysMaterial;

/**
 * 素材
 *
 * @author haorong
 * @since 2022/2/26 16:37
 */
public interface ISysMaterialService extends IService<SysMaterial> {

	/**
	 * 分页查询
	 * @param page
	 * @param material
	 * @return
	 */
	IPage<SysMaterial> getPage(Page page, SysMaterial material);

}
