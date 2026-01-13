/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.promotion.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.haorong.cloud.promotion.api.entity.CouponGoods;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CouponGoodsMapper extends BaseMapper<CouponGoods> {

	List<CouponGoods> selectByCouponId(@Param("couponId") String couponId);

}
