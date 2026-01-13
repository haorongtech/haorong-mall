/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.pay.service.impl;

import cn.hutool.core.date.DatePattern;
import cn.hutool.core.date.LocalDateTimeUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.alipay.api.AlipayApiException;
import com.alipay.api.internal.util.AlipaySignature;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.binarywang.wxpay.bean.notify.SignatureHeader;
import com.github.binarywang.wxpay.bean.notify.WxPayNotifyV3Response;
import com.github.binarywang.wxpay.bean.notify.WxPayNotifyV3Result;
import com.github.binarywang.wxpay.bean.notify.WxPayRefundNotifyV3Result;
import com.github.binarywang.wxpay.exception.WxPayException;
import com.haorong.cloud.common.core.constant.CommonConstants;
import com.haorong.cloud.common.core.constant.RocketMqConstants;
import com.haorong.cloud.pay.api.constants.PayConstants;
import com.haorong.cloud.pay.api.entity.PayNotifyRecord;
import com.haorong.cloud.pay.api.entity.PayRefundOrder;
import com.haorong.cloud.pay.api.entity.PayTradeOrder;
import com.haorong.cloud.pay.api.enums.PayRefundOrderStatusEnum;
import com.haorong.cloud.pay.api.vo.PayConfigVO;
import com.haorong.cloud.pay.config.WxPayConfiguration;
import com.haorong.cloud.pay.mapper.PayNotifyRecordMapper;
import com.haorong.cloud.pay.mapper.PayRefundOrderMapper;
import com.haorong.cloud.pay.mapper.PayTradeOrderMapper;
import com.haorong.cloud.pay.service.IPayConfigService;
import com.haorong.cloud.pay.service.IPayNotifyRecordService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.apache.rocketmq.spring.core.RocketMQTemplate;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.messaging.support.GenericMessage;
import org.springframework.stereotype.Service;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.OffsetDateTime;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * 支付订单
 *
 * @author haorong
 * @date 2022/6/16
 */
@Service
@RequiredArgsConstructor
public class PayNotifyRecordServiceImpl extends ServiceImpl<PayNotifyRecordMapper, PayNotifyRecord>
		implements IPayNotifyRecordService {

	private final RocketMQTemplate rocketMQTemplate;

	private final RedisTemplate redisTemplate;

	private final PayTradeOrderMapper payTradeOrderMapper;

	private final PayRefundOrderMapper payRefundOrderMapper;

	private final HttpServletRequest httpServletRequest;

	private final IPayConfigService payConfigService;

	@Override
	public String wxPayNotify(String tenantId, String terminalType, String notifyData) {
		// 解密微信支付回调
		WxPayNotifyV3Result wxPayOrderNotifyV3Result = null;
		try {
			wxPayOrderNotifyV3Result = WxPayConfiguration.wxPayService(terminalType)
				.parseOrderNotifyV3Result(notifyData, buildSignatureHeader());
		}
		catch (WxPayException e) {
			return WxPayNotifyV3Response.fail("解密失败");
		}
		WxPayNotifyV3Result.DecryptNotifyResult decryptNotifyResult = wxPayOrderNotifyV3Result.getResult();

		final String outTradeNo = decryptNotifyResult.getOutTradeNo();

		Boolean bIfAbsent = isDuplicate(outTradeNo);
		if (Boolean.FALSE.equals(bIfAbsent)) {
			PayNotifyRecord payNotifyRecord = new PayNotifyRecord();
			payNotifyRecord.setRequest(JSON.toJSONString(decryptNotifyResult));
			payNotifyRecord.setResponse("重复回调");
			payNotifyRecord.setOutTradeNo(outTradeNo);
			payNotifyRecord.setChannelOrderNo(decryptNotifyResult.getTransactionId());
			payNotifyRecord.setType(PayConstants.PAY_NOTIFY_TYPE);
			this.save(payNotifyRecord);
			return WxPayNotifyV3Response.fail("重复回调");
		}
		// 查询订单
		PayTradeOrder orderInfo = payTradeOrderMapper
			.selectOne(Wrappers.<PayTradeOrder>lambdaQuery().eq(PayTradeOrder::getOutTradeNo, outTradeNo));
		if (ObjectUtil.isNull(orderInfo)) {
			return WxPayNotifyV3Response.fail("order not found! orderNo: " + outTradeNo);
		}
		orderInfo.setChannelOrderNo(decryptNotifyResult.getTransactionId());
		orderInfo.setPayStatus(CommonConstants.YES);
		OffsetDateTime offsetDateTime = OffsetDateTime.parse(decryptNotifyResult.getSuccessTime());
		orderInfo.setPaySuccessTime(offsetDateTime.toLocalDateTime());
		payTradeOrderMapper.updateById(orderInfo);
		// 保存回调记录
		PayNotifyRecord payNotifyRecord = new PayNotifyRecord();
		payNotifyRecord.setRequest(JSON.toJSONString(decryptNotifyResult));
		payNotifyRecord.setResponse(WxPayNotifyV3Response.success("成功"));
		payNotifyRecord.setOutTradeNo(decryptNotifyResult.getOutTradeNo());
		payNotifyRecord.setChannelOrderNo(decryptNotifyResult.getTransactionId());
		payNotifyRecord.setType(PayConstants.PAY_NOTIFY_TYPE);
		this.save(payNotifyRecord);
		// rocketmq 通知
		JSONObject jsonObject = new JSONObject();
		jsonObject.put(PayConstants.OUT_TRADE_NO, payNotifyRecord.getOutTradeNo());
		jsonObject.put(PayConstants.CHANNEL_ORDER_NO, payNotifyRecord.getChannelOrderNo());
		jsonObject.put(PayConstants.PAY_SUCCESS_TIME, orderInfo.getPaySuccessTime());
		jsonObject.put(PayConstants.EXTRA_PARAMS, orderInfo.getExtra());
		jsonObject.put(PayConstants.TENANT_ID, orderInfo.getTenantId());
		JSONObject json = JSON.parseObject(orderInfo.getExtra());
		rocketMQTemplate.syncSend(json.getString("mqNotifyUrl"), new GenericMessage<>(jsonObject),
				RocketMqConstants.TIME_OUT);
		return WxPayNotifyV3Response.success("成功");
	}

	@Override
	public String aliPayNotify(String tenantId, String terminalType, HttpServletRequest request) {
		PayConfigVO payConfig = payConfigService.getConfig(PayConstants.PAY_TYPE_2, terminalType);

		Map<String, String> params = new HashMap<>();
		Map requestParams = request.getParameterMap();
		for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
			}
			// 乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
			// valueStr = new String(valueStr.getBytes("ISO-8859-1"), "gbk");
			params.put(name, valueStr);
		}
		try {
			AlipaySignature.certVerifyV1(params, payConfig.getPrivateKeyPath(), "UTF-8", "RSA2");
		}
		catch (AlipayApiException e) {
			e.printStackTrace();
			log.error("支付宝验签失败");
			return PayConstants.ALIPAY_FAIL;
		}
		// 获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以下仅供参考)//
		// 商户订单号
		String outTradeNo = request.getParameter("out_trade_no");
		// 交易状态
		String tradeStatus = request.getParameter("trade_status");
		// 总退款金额
		String refundFee = request.getParameter("refund_fee");
		// 退款单号
		String outBizNo = request.getParameter("out_biz_no");

		Boolean bIfAbsent = isDuplicate(outTradeNo);
		if (Boolean.FALSE.equals(bIfAbsent)) {
			PayNotifyRecord payNotifyRecord = new PayNotifyRecord();
			payNotifyRecord.setRequest(JSON.toJSONString(params));
			payNotifyRecord.setResponse("重复回调");
			payNotifyRecord.setOutTradeNo(outTradeNo);
			payNotifyRecord.setChannelOrderNo(outTradeNo);
			payNotifyRecord.setType(PayConstants.PAY_NOTIFY_TYPE);
			this.save(payNotifyRecord);
			return PayConstants.ALIPAY_FAIL;
		}

		if (StrUtil.isEmpty(outBizNo) && StrUtil.isEmpty(refundFee)) {
			// 支付回调

			// 获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以上仅供参考)//
			if ("TRADE_SUCCESS".equals(tradeStatus) || "TRADE_FINISHED".equals(tradeStatus)) {
				// 查询订单
				PayTradeOrder orderInfo = payTradeOrderMapper
					.selectOne(Wrappers.<PayTradeOrder>lambdaQuery().eq(PayTradeOrder::getOutTradeNo, outTradeNo));
				if (ObjectUtil.isNull(orderInfo)) {
					log.error("order not found! orderNo:" + outTradeNo);
					return PayConstants.ALIPAY_FAIL;
				}
				orderInfo.setChannelOrderNo(outTradeNo);
				orderInfo.setPayStatus(CommonConstants.YES);
				orderInfo.setPaySuccessTime(LocalDateTimeUtil.parse(request.getParameter("gmt_payment"),
						DatePattern.NORM_DATETIME_PATTERN));
				payTradeOrderMapper.updateById(orderInfo);
				// 保存回调记录
				PayNotifyRecord payNotifyRecord = new PayNotifyRecord();
				payNotifyRecord.setRequest(JSON.toJSONString(params));
				payNotifyRecord.setResponse(PayConstants.ALIPAY_SUCCESS);
				payNotifyRecord.setOutTradeNo(outTradeNo);
				payNotifyRecord.setChannelOrderNo(outTradeNo);
				payNotifyRecord.setType(PayConstants.PAY_NOTIFY_TYPE);
				this.save(payNotifyRecord);
				// rocketmq 通知
				JSONObject jsonObject = new JSONObject();
				jsonObject.put(PayConstants.OUT_TRADE_NO, payNotifyRecord.getOutTradeNo());
				jsonObject.put(PayConstants.PAY_SUCCESS_TIME, orderInfo.getPaySuccessTime());
				jsonObject.put(PayConstants.EXTRA_PARAMS, orderInfo.getExtra());
				jsonObject.put(PayConstants.TENANT_ID, orderInfo.getTenantId());
				JSONObject json = JSON.parseObject(orderInfo.getExtra());
				rocketMQTemplate.syncSend(json.getString("mqNotifyUrl"), new GenericMessage<>(jsonObject),
						RocketMqConstants.TIME_OUT);
			}
		}

		return PayConstants.ALIPAY_SUCCESS;
	}

	@Override
	public String wxPayRefundNotify(String tenantId, String terminalType, String params) {
		WxPayRefundNotifyV3Result wxPayRefundNotifyV3Result = null;
		try {
			wxPayRefundNotifyV3Result = WxPayConfiguration.wxPayService(terminalType)
				.parseRefundNotifyV3Result(params, buildSignatureHeader());
		}
		catch (WxPayException e) {
			return WxPayNotifyV3Response.fail("解密失败");
		}
		WxPayRefundNotifyV3Result.DecryptNotifyResult result = wxPayRefundNotifyV3Result.getResult();
		final String outRefundNo = result.getOutRefundNo();
		Boolean bIfAbsent = isDuplicate(outRefundNo);
		if (Boolean.FALSE.equals(bIfAbsent)) {
			PayNotifyRecord payNotifyRecord = new PayNotifyRecord();
			payNotifyRecord.setRequest(JSON.toJSONString(params));
			payNotifyRecord.setResponse("重复回调");
			payNotifyRecord.setChannelOrderNo(result.getRefundId());
			payNotifyRecord.setType(PayConstants.REFUND_NOTIFY_TYPE);
			this.save(payNotifyRecord);
			return WxPayNotifyV3Response.fail("重复回调");
		}
		PayRefundOrder payRefundOrder = payRefundOrderMapper.selectOne(
				Wrappers.<PayRefundOrder>lambdaQuery().eq(PayRefundOrder::getRefundTradeNo, result.getOutRefundNo()));
		if (ObjectUtil.isNull(payRefundOrder)) {
			return WxPayNotifyV3Response.fail("order not found! orderNo: " + result.getOutRefundNo());
		}
		payRefundOrder.setChannelRefundNo(result.getRefundId());
		payRefundOrder.setRefundStatus(PayRefundOrderStatusEnum.STATUS_2.getCode());
		payRefundOrder.setRefundSuccessTime(LocalDateTime.now());
		payRefundOrderMapper.updateById(payRefundOrder);
		// 保存回调记录
		PayNotifyRecord payNotifyRecord = new PayNotifyRecord();
		payNotifyRecord.setRequest(JSON.toJSONString(result));
		payNotifyRecord.setResponse(WxPayNotifyV3Response.success("成功"));
		payNotifyRecord.setOutTradeNo(result.getOutRefundNo());
		payNotifyRecord.setChannelOrderNo(result.getRefundId());
		payNotifyRecord.setType(PayConstants.REFUND_NOTIFY_TYPE);
		this.save(payNotifyRecord);
		// rocketmq 通知
		JSONObject jsonObject = new JSONObject();
		jsonObject.put(PayConstants.EXTRA_PARAMS, payRefundOrder.getExtra());
		jsonObject.put(PayConstants.REFUND_TRADE_NO, payRefundOrder.getRefundTradeNo());
		jsonObject.put(PayConstants.TENANT_ID, payRefundOrder.getTenantId());
		JSONObject json = JSON.parseObject(payRefundOrder.getExtra());
		rocketMQTemplate.syncSend(json.getString("mqNotifyUrl"), new GenericMessage<>(jsonObject),
				RocketMqConstants.TIME_OUT);
		return WxPayNotifyV3Response.success("成功");
	}

	// 去重
	private Boolean isDuplicate(String key) {
		return redisTemplate.opsForValue().setIfAbsent(key, key, Duration.ofSeconds(10L));
	}

	private SignatureHeader buildSignatureHeader() {
		SignatureHeader signatureHeader = new SignatureHeader();
		signatureHeader.setSerial(httpServletRequest.getHeader("Wechatpay-Serial"));
		signatureHeader.setSignature(httpServletRequest.getHeader("Wechatpay-Signature"));
		signatureHeader.setNonce(httpServletRequest.getHeader("Wechatpay-Nonce"));
		signatureHeader.setTimeStamp(httpServletRequest.getHeader("Wechatpay-Timestamp"));
		return signatureHeader;
	}

}
