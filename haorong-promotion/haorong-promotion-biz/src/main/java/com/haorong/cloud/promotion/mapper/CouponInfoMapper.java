/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.promotion.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.haorong.cloud.promotion.api.entity.CouponGoods;
import com.haorong.cloud.promotion.api.entity.CouponInfo;
import com.haorong.cloud.promotion.api.entity.CouponUser;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.io.Serializable;

@Mapper
public interface CouponInfoMapper extends BaseMapper<CouponInfo> {

	/**
	 * 分页查询优惠券
	 * @param page
	 * @param couponInfo
	 * @param couponGoods
	 * @param couponUser
	 * @return
	 */
	IPage<CouponInfo> selectCouponPage(Page page, @Param("query") CouponInfo couponInfo,
			@Param("couponGoods") CouponGoods couponGoods, @Param("couponUser") CouponUser couponUser);

	CouponInfo selectCouponById(Serializable id);

	IPage<CouponInfo> selectAdminPage(Page page, @Param("query") CouponInfo couponInfo);

}
