/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.promotion.handler;

import com.haorong.cloud.common.core.entity.OrderPaySuccessEvent;
import com.haorong.cloud.promotion.api.dto.CouponUserReqDTO;
import com.haorong.cloud.promotion.api.enums.CouponUserStatusEnum;
import com.haorong.cloud.promotion.service.ICouponUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

@Component
@RequiredArgsConstructor
public class CouponPayHandler implements PromotionPayEventHandler {

	private final ICouponUserService couponUserService;

	@Override
	public void handle(OrderPaySuccessEvent event) {
		if (!StringUtils.hasText(event.getCouponUserId())) {
			return;
		}
		// 更新用户优惠券状态
		CouponUserReqDTO couponUserReqDTO = new CouponUserReqDTO();
		couponUserReqDTO.setId(event.getCouponUserId());
		couponUserReqDTO.setCouponUserStatusEnum(CouponUserStatusEnum.STATUS_1);
		couponUserService.updateCouponUserStatus(couponUserReqDTO);
	}

}
