/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.promotion.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.haorong.cloud.promotion.api.entity.CouponGoods;
import com.haorong.cloud.promotion.mapper.CouponGoodsMapper;
import com.haorong.cloud.promotion.service.ICouponGoodsService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CouponGoodsServiceImpl extends ServiceImpl<CouponGoodsMapper, CouponGoods> implements ICouponGoodsService {

	@Override
	public List<CouponGoods> getByCouponId(String couponId) {
		return baseMapper.selectByCouponId(couponId);
	}

}
