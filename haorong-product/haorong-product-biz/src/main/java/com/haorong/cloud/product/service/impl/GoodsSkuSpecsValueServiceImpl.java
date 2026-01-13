/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.product.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.haorong.cloud.product.api.entity.GoodsSkuSpecsValue;
import com.haorong.cloud.product.mapper.GoodsSkuSpecsValueMapper;
import com.haorong.cloud.product.service.IGoodsSkuSpecsValueService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 商品sku关联规格值
 *
 * @author haorong
 * @since 2022/2/26 16:37
 */
@Service
public class GoodsSkuSpecsValueServiceImpl extends ServiceImpl<GoodsSkuSpecsValueMapper, GoodsSkuSpecsValue>
		implements IGoodsSkuSpecsValueService {

	@Override
	public List<GoodsSkuSpecsValue> getBySkuId(String skuId) {
		return baseMapper.selectBySkuId(skuId);
	}

}
