/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.promotion.dubbo;

import com.haorong.cloud.promotion.api.dto.CouponUserReqDTO;
import com.haorong.cloud.promotion.api.remote.RemoteCouponUserService;
import com.haorong.cloud.promotion.api.vo.CouponUserRespVO;
import com.haorong.cloud.promotion.service.ICouponUserService;
import lombok.RequiredArgsConstructor;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.stereotype.Service;

/**
 * @author lijia
 * @description
 * @date 2024/11/23
 */
@Service
@DubboService
@RequiredArgsConstructor
public class RemoteCouponUserServiceImpl implements RemoteCouponUserService {

	private final ICouponUserService couponUserService;

	@Override
	public boolean updateCouponUserStatus(CouponUserReqDTO request) {
		return couponUserService.updateCouponUserStatus(request);
	}

	@Override
	public CouponUserRespVO getById(String id) {
		return couponUserService.getCouponUserById(id);
	}

}
