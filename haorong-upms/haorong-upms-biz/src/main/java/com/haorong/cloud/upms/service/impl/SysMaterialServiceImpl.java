/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.upms.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.haorong.cloud.upms.api.entity.SysMaterial;
import com.haorong.cloud.upms.mapper.SysMaterialMapper;
import com.haorong.cloud.upms.service.ISysMaterialService;
import org.springframework.stereotype.Service;

/**
 * 素材
 *
 * @author haorong
 * @since 2022/2/26 16:37
 */
@Service
public class SysMaterialServiceImpl extends ServiceImpl<SysMaterialMapper, SysMaterial> implements ISysMaterialService {

	@Override
	public IPage<SysMaterial> getPage(Page page, SysMaterial material) {
		return baseMapper.selectMaterialPage(page, material);
	}

}
