/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.pay.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.haorong.cloud.pay.api.entity.PayNotifyRecord;
import jakarta.servlet.http.HttpServletRequest;

/**
 * 支付订单
 *
 * @author haorong
 * @date 2022/6/16
 */
public interface IPayNotifyRecordService extends IService<PayNotifyRecord> {

	/**
	 * 微信支付通知
	 * @param tenantId
	 * @param terminalType
	 * @param notifyData
	 * @return
	 */
	String wxPayNotify(String tenantId, String terminalType, String notifyData);

	/**
	 * 支付宝支付通知
	 * @param tenantId
	 * @param terminalType
	 * @param request
	 * @return
	 */
	String aliPayNotify(String tenantId, String terminalType, HttpServletRequest request);

	/**
	 * 微信退款通知
	 * @param tenantId
	 * @param notifyData
	 * @return
	 */
	String wxPayRefundNotify(String tenantId, String terminalType, String notifyData);

}
