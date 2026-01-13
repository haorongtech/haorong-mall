/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.pay.handler.impl;

import com.alibaba.fastjson.JSONObject;
import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.request.AlipayTradeRefundRequest;
import com.alipay.api.response.AlipayTradeRefundResponse;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.haorong.cloud.common.core.constant.RocketMqConstants;
import com.haorong.cloud.common.security.handler.HxBusinessException;
import com.haorong.cloud.pay.api.dto.CreateRefundsReqDTO;
import com.haorong.cloud.pay.api.entity.PayRefundOrder;
import com.haorong.cloud.pay.api.entity.PayTradeOrder;
import com.haorong.cloud.pay.api.enums.PayRefundOrderStatusEnum;
import com.haorong.cloud.pay.config.AliPayConfiguration;
import com.haorong.cloud.pay.handler.AbstractPayRefundOrderHandler;
import com.haorong.cloud.pay.service.IPayRefundOrderService;
import com.haorong.cloud.pay.service.IPayTradeOrderService;
import lombok.RequiredArgsConstructor;
import org.apache.rocketmq.spring.core.RocketMQTemplate;
import org.springframework.messaging.support.GenericMessage;
import org.springframework.stereotype.Service;

@Service("ALIPAY_REFUND")
@RequiredArgsConstructor
public class AlipayRefundHandler extends AbstractPayRefundOrderHandler {

	private final IPayRefundOrderService payRefundOrderService;

	private final RocketMQTemplate rocketMQTemplate;

	private final IPayTradeOrderService tradeOrderService;

	@Override
	public Object doRefund(PayRefundOrder payRefundOrder) {
		// 查询支付单
		PayTradeOrder payTradeOrder = tradeOrderService.getOne(
				Wrappers.<PayTradeOrder>lambdaQuery().eq(PayTradeOrder::getOutTradeNo, payRefundOrder.getOutTradeNo()));

		AlipayClient alipayClient = null;
		try {
			alipayClient = AliPayConfiguration.getAlipayClient(payTradeOrder.getTerminalType());
		}
		catch (Exception e) {
			throw new RuntimeException(e);
		}
		AlipayTradeRefundRequest request = new AlipayTradeRefundRequest();
		JSONObject bizContent = new JSONObject();
		bizContent.put("refund_amount", payRefundOrder.getRefundAmount());
		bizContent.put("out_trade_no", payRefundOrder.getOutTradeNo());
		bizContent.put("out_request_no", payRefundOrder.getRefundTradeNo());
		request.setBizContent(bizContent.toString());

		AlipayTradeRefundResponse response = null;
		try {
			response = alipayClient.certificateExecute(request);
		}
		catch (AlipayApiException e) {
			throw new HxBusinessException(e.getErrMsg());
		}
		if (!response.isSuccess()) {
			throw new HxBusinessException(response.getMsg() + response.getSubMsg());
		}
		if ("Y".equals(response.getFundChange())) {
			// 退款成功发送mq消息
			// rocketmq 通知
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("extraParams", payRefundOrder.getExtra());
			jsonObject.put("refundTradeMo", payRefundOrder.getRefundTradeNo());
			rocketMQTemplate.syncSend(RocketMqConstants.PAY_REFUND_NOTIFY_TOPIC, new GenericMessage<>(jsonObject),
					RocketMqConstants.TIME_OUT);
			payRefundOrder.setRefundStatus(PayRefundOrderStatusEnum.STATUS_2.getCode());
		}
		else {
			// 退款接口返回 fund_change=N
			// 不代表交易没有退款，只是代表该次接口请求没有资金变动，此时需使用退款查询接口进行查询判断，该笔交易是退款失败，还是退款成功后重复操作导致。
			// 状态更改成待确认 定时任务跑批处理
			payRefundOrder.setRefundStatus(PayRefundOrderStatusEnum.STATUS_4.getCode());
		}
		payRefundOrderService.updateById(payRefundOrder);

		return response;
	}

	@Override
	public PayRefundOrder createRefundOrder(CreateRefundsReqDTO createRefundsReqDTO) {
		PayRefundOrder payRefundOrder = payRefundOrderService.getOne(Wrappers.<PayRefundOrder>lambdaQuery()
			.eq(PayRefundOrder::getRefundTradeNo, createRefundsReqDTO.getRefundTradeNo()));
		if (null != payRefundOrder) {
			return payRefundOrder;
		}
		payRefundOrder = new PayRefundOrder();
		payRefundOrder.setRefundAmount(createRefundsReqDTO.getRefundAmount());
		payRefundOrder.setPayAmount(createRefundsReqDTO.getTotalAmount());
		payRefundOrder.setRefundStatus(PayRefundOrderStatusEnum.STATUS_1.getCode());
		payRefundOrder.setRefundTradeNo(createRefundsReqDTO.getRefundTradeNo());
		payRefundOrder.setNotifyUrl(createRefundsReqDTO.getNotifyUrl());
		payRefundOrder.setOutTradeNo(createRefundsReqDTO.getOutTradeNo());
		payRefundOrder.setExtra(createRefundsReqDTO.getExtra());
		payRefundOrderService.save(payRefundOrder);
		return payRefundOrder;
	}

}
