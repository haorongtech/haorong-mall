/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.pay.dubbo;

import com.haorong.cloud.pay.api.dto.CreateOrderReqDTO;
import com.haorong.cloud.pay.api.remote.RemotePayService;
import com.haorong.cloud.pay.handler.PayOrderHandler;
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
public class RemotePayServiceImpl implements RemotePayService {

	private final Map<String, PayOrderHandler> payOrderHandlerMap;

	@Override
	public Object createOrder(CreateOrderReqDTO createOrderReqDTO) {
		return payOrderHandlerMap.get(createOrderReqDTO.getTradeType()).pay(createOrderReqDTO);
	}

}
