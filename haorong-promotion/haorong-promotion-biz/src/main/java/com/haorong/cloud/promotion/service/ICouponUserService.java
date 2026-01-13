/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.promotion.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.haorong.cloud.promotion.api.dto.CouponUserReqDTO;
import com.haorong.cloud.promotion.api.entity.CouponUser;
import com.haorong.cloud.promotion.api.vo.CouponUserRespVO;
import com.haorong.cloud.promotion.api.vo.CouponUserVO;

import java.util.List;

public interface ICouponUserService extends IService<CouponUser> {

	IPage<CouponUser> getPage(Page page, CouponUser couponUser);

	CouponUser receive(CouponUser couponUser);

	boolean rollBackCoupon(String couponUserId);

	IPage<CouponUser> getApiPage(Page page, CouponUser couponUser);

	Boolean updateCouponUserStatus(CouponUserReqDTO request);

	CouponUserRespVO getCouponUserById(String id);

	List<CouponUser> getExpireCouponList();

	/**
	 * 根据优惠券id查询优惠券领取数量
	 * @param couponIds
	 * @return
	 */
	List<CouponUserVO> getCountByCouponIds(String[] couponIds);

}
