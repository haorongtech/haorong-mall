/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.pay.dubbo;

import com.haorong.cloud.pay.api.dto.CreateRefundsReqDTO;
import com.haorong.cloud.pay.api.remote.RemoteRefundService;
import com.haorong.cloud.pay.handler.PayRefundOrderHandler;
import lombok.RequiredArgsConstructor;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * @author lijia
 * @description
 * @date 2024/11/23
 */
@Service
@DubboService
@RequiredArgsConstructor
public class RemoteRefundServiceImpl implements RemoteRefundService {

	private final Map<String, PayRefundOrderHandler> payRefundOrderHandlerMap;

	@Override
	public Object refunds(CreateRefundsReqDTO createRefundsReqDTO) {
		return payRefundOrderHandlerMap.get(createRefundsReqDTO.getRefundType()).refund(createRefundsReqDTO);
	}

}
