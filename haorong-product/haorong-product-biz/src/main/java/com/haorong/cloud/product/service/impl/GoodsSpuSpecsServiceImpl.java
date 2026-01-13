/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.product.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.haorong.cloud.product.api.entity.GoodsSpuSpecs;
import com.haorong.cloud.product.mapper.GoodsSpuSpecsMapper;
import com.haorong.cloud.product.service.IGoodsSpuSpecsService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 商品关联规格
 *
 * @author haorong
 * @since 2022/2/26 16:37
 */
@Service
public class GoodsSpuSpecsServiceImpl extends ServiceImpl<GoodsSpuSpecsMapper, GoodsSpuSpecs>
		implements IGoodsSpuSpecsService {

	@Override
	public List<GoodsSpuSpecs> getList(GoodsSpuSpecs goodsSpuSpecs) {
		return baseMapper.selectListBySpuId(goodsSpuSpecs);
	}

}
