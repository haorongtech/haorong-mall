/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.promotion.api.remote;

import com.haorong.cloud.promotion.api.dto.CouponUserReqDTO;
import com.haorong.cloud.promotion.api.vo.CouponUserRespVO;

/**
 * @author haorong
 */
public interface RemoteCouponUserService {

	/**
	 * 修改用户优惠券状态
	 * @param couponUserReqDTO
	 * @return
	 */
	boolean updateCouponUserStatus(CouponUserReqDTO couponUserReqDTO);

	/**
	 * 查询用户优惠券信息
	 * @param id
	 * @return
	 */
	CouponUserRespVO getById(String id);

}
