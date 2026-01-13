/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.product.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.haorong.cloud.product.api.entity.GoodsFootprint;
import com.haorong.cloud.product.api.vo.GoodsFootprintVO;
import com.haorong.cloud.product.mapper.GoodsFootprintMapper;
import com.haorong.cloud.product.service.IGoodsFootprintService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * 用户足迹
 *
 * @author haorong
 * @since 2022/2/22 15:27
 */
@Service
@RequiredArgsConstructor
public class GoodsFootprintServiceImpl extends ServiceImpl<GoodsFootprintMapper, GoodsFootprint>
		implements IGoodsFootprintService {

	@Override
	public IPage<GoodsFootprintVO> apiPage(Page page, LambdaQueryWrapper<GoodsFootprint> lambdaQuery) {
		return baseMapper.apiPage(page, lambdaQuery.getEntity());
	}

}
