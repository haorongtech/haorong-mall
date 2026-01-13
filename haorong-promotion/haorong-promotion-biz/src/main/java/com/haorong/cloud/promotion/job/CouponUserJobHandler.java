/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.promotion.job;

import com.haorong.cloud.common.myabtis.tenant.HxTenantContextHolder;
import com.haorong.cloud.promotion.api.entity.CouponUser;
import com.haorong.cloud.promotion.api.enums.CouponUserStatusEnum;
import com.haorong.cloud.promotion.service.ICouponUserService;
import com.haorong.cloud.upms.api.entity.SysTenant;
import com.haorong.cloud.upms.api.remote.RemoteTenantService;
import com.xxl.job.core.context.XxlJobHelper;
import com.xxl.job.core.handler.annotation.XxlJob;
import lombok.RequiredArgsConstructor;
import org.apache.dubbo.config.annotation.DubboReference;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import java.util.List;

/**
 * 用户优惠券定时任务
 *
 * @author haorong
 * @date 2022/11/02
 */
@Component
@RequiredArgsConstructor
public class CouponUserJobHandler {

	private final ICouponUserService couponUserService;

	@DubboReference
	private final RemoteTenantService remoteTenantService;

	/**
	 * 扫描过期的优惠券
	 *
	 * @author haorong
	 * @date 2022/11/02
	 * @return: void
	 */
	@XxlJob("scanExpiredCouponsJobHandler")
	public void scanExpiredCouponsJobHandler() throws Exception {
		XxlJobHelper.log("扫描过期的优惠券, upCouponUserStatusJobHandler.");
		List<SysTenant> listSysTenant = remoteTenantService.list();
		if (!CollectionUtils.isEmpty(listSysTenant)) {
			listSysTenant.forEach(sysTenant -> {
				HxTenantContextHolder.setTenantId(sysTenant.getId());
				List<CouponUser> couponUserList = couponUserService.getExpireCouponList();
				couponUserList.forEach(couponUser -> {
					couponUser.setStatus(CouponUserStatusEnum.STATUS_2.getCode());
					couponUser.setUpdateBy("job");
					couponUserService.updateById(couponUser);
				});
				HxTenantContextHolder.removeTenantId();
			});
		}
		// default success
	}

}
