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
import com.haorong.cloud.upms.api.entity.SysMaterialGroup;
import com.haorong.cloud.upms.mapper.SysMaterialGroupMapper;
import com.haorong.cloud.upms.service.ISysMaterialGroupService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 素材分组
 *
 * @author haorong
 * @since 2022/2/26 16:37
 */
@Service
public class SysMaterialGroupServiceImpl extends ServiceImpl<SysMaterialGroupMapper, SysMaterialGroup>
		implements ISysMaterialGroupService {

	@Override
	public IPage<SysMaterialGroup> getPage(Page page, SysMaterialGroup sysMaterialGroup) {
		return baseMapper.selectMaterialGroupPage(page, sysMaterialGroup);
	}

	@Override
	public List<SysMaterialGroup> getList(SysMaterialGroup sysMaterialGroup) {
		return baseMapper.selectMaterialGroupList(sysMaterialGroup);
	}

}
