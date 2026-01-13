/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.pay.handler;

import com.haorong.cloud.pay.api.dto.CreateRefundsReqDTO;
import com.haorong.cloud.pay.api.entity.PayRefundOrder;

public interface PayRefundOrderHandler {

	/**
	 * 创建退款单
	 * @param createRefundsReqDTO 退款参数
	 * @return obj
	 */
	PayRefundOrder createRefundOrder(CreateRefundsReqDTO createRefundsReqDTO);

	/**
	 * 调起渠道退款
	 * @param createRefundsReqDTO 退款参数
	 * @return obj
	 */
	Object refund(CreateRefundsReqDTO createRefundsReqDTO);

}
