/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.product.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.haorong.cloud.common.security.util.SecurityUtils;
import com.haorong.cloud.product.api.entity.GoodsCollect;
import com.haorong.cloud.product.api.entity.GoodsSpu;
import com.haorong.cloud.product.api.vo.GoodsCollectVO;
import com.haorong.cloud.product.mapper.GoodsCollectMapper;
import com.haorong.cloud.product.mapper.GoodsSpuMapper;
import com.haorong.cloud.product.service.IGoodsCollectService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

@Service
@RequiredArgsConstructor
public class GoodsCollectServiceImpl extends ServiceImpl<GoodsCollectMapper, GoodsCollect>
		implements IGoodsCollectService {

	private final GoodsSpuMapper goodsSpuMapper;

	@Override
	public IPage<GoodsCollectVO> getPage(Page page, GoodsCollect userCollect) {
		return baseMapper.selectCollectPage(page, userCollect);
	}

	@Override
	public GoodsCollect saveCollect(GoodsCollect userCollect) {
		// 查询商品信息
		GoodsSpu goodsSpu = goodsSpuMapper.selectById(userCollect.getSpuId());
		if (Objects.nonNull(goodsSpu)) {
			userCollect.setSalesPrice(goodsSpu.getSalesPrice());
		}
		baseMapper.insert(userCollect);
		return userCollect;
	}

	@Override
	public boolean saveBatchCollect(List<GoodsCollect> goodsCollectList) {
		String userId = SecurityUtils.getUser().getUserId();
		goodsCollectList.forEach(goodsCollect -> {
			boolean exists = this.exists(Wrappers.<GoodsCollect>lambdaQuery()
				.eq(GoodsCollect::getUserId, userId)
				.eq(GoodsCollect::getSpuId, goodsCollect.getSpuId()));
			if (!exists) {
				// 查询商品信息
				GoodsSpu goodsSpu = goodsSpuMapper.selectById(goodsCollect.getSpuId());
				if (Objects.nonNull(goodsSpu)) {
					goodsCollect.setSalesPrice(goodsSpu.getSalesPrice());
				}
				goodsCollect.setUserId(userId);
				goodsCollect.setId(null);
				this.save(goodsCollect);
			}
		});
		return true;
	}

}
