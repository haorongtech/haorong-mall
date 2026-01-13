/** 
  * Copyright (c) 2025 沈阳浩荣科技有限公司 
  * All rights reserved. 
  * <p> 
  * 注意： 
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。 
 
  */
package com.haorong.cloud.pay.config;

import com.alipay.api.AlipayClient;
import com.alipay.api.CertAlipayRequest;
import com.alipay.api.DefaultAlipayClient;
import com.haorong.cloud.common.core.util.SpringUtils;
import com.haorong.cloud.pay.api.constants.PayConstants;
import com.haorong.cloud.pay.api.vo.PayConfigVO;
import com.haorong.cloud.pay.service.IPayConfigService;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.context.annotation.Configuration;

/**
 * 支付宝配置
 *
 * @author haorong
 * @since 2022/3/14 15:24
 */
@Configuration
@RequiredArgsConstructor
@ConditionalOnClass(AliPayConfiguration.class)
public class AliPayConfiguration {

	/**
	 * 通用sdk
	 * @return
	 * @throws Exception
	 */
	public static AlipayClient getAlipayClient(String terminalType) throws Exception {
		IPayConfigService payConfigService = SpringUtils.getBean(IPayConfigService.class);

		PayConfigVO payConfig = payConfigService.getConfig(PayConstants.PAY_TYPE_2, terminalType);
		if (null == payConfig) {
			throw new IllegalArgumentException("未配置支付宝支付");
		}

		CertAlipayRequest certAlipayRequest = new CertAlipayRequest();
		// 支付宝网关（固定）。
		certAlipayRequest.setServerUrl("https://openapi.alipay.com/gateway.do");
		// APPID 即创建应用后生成。
		certAlipayRequest.setAppId(payConfig.getAppId());
		// 开发者私钥，由开发者自己生成。
		certAlipayRequest.setPrivateKey(payConfig.getMchKey());
		// 参数返回格式，只支持 JSON（固定）。
		certAlipayRequest.setFormat("json");
		// 编码集，支持 GBK/UTF-8。
		certAlipayRequest.setCharset("utf-8");
		// 生成签名字符串所使用的签名算法类型，目前支持 RSA2 算法。
		certAlipayRequest.setSignType("RSA2");
		// 应用公钥证书文件本地路径。
		certAlipayRequest.setCertPath(payConfig.getPrivateCertPath());
		// 支付宝公钥证书文件本地路径。
		certAlipayRequest.setAlipayPublicCertPath(payConfig.getPrivateKeyPath());
		// 支付宝根证书文件本地路径。
		certAlipayRequest.setRootCertPath(payConfig.getKeyPath());
		return new DefaultAlipayClient(certAlipayRequest);
	}

}
