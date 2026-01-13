/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.common.logistics.util;

import cn.hutool.json.JSONUtil;
import com.google.gson.Gson;
import com.kuaidi100.sdk.api.Subscribe;
import com.kuaidi100.sdk.contant.ApiInfoConstant;
import com.kuaidi100.sdk.core.IBaseClient;
import com.kuaidi100.sdk.pojo.HttpResult;
import com.kuaidi100.sdk.request.SubscribeParam;
import com.kuaidi100.sdk.request.SubscribeParameters;
import com.kuaidi100.sdk.request.SubscribeReq;
import com.kuaidi100.sdk.response.SubscribeResp;
import lombok.extern.slf4j.Slf4j;
import org.apache.http.HttpStatus;
import org.springframework.context.annotation.Configuration;

/**
 * 快递100
 *
 * @author haorong
 * @date 2022/6/11
 */
@Slf4j
@Configuration
public class Kuaidi100Utils {

	/**
	 * 订阅接口
	 * @param logisticsCode 快递编码
	 * @param logisticsNo 快递单号
	 * @param address 收件地址
	 * @param key 快递100的key
	 * @param callbackUrl 回调地址
	 * @param telephone 手机号
	 * @param salt 签名用随机字符串
	 */
	public void poll(String logisticsCode, String logisticsNo, String address, String key, String callbackUrl,
			String telephone, String salt) {
		SubscribeParameters subscribeParameters = new SubscribeParameters();
		subscribeParameters.setCallbackurl(callbackUrl);
		subscribeParameters.setPhone(telephone);
		subscribeParameters.setSalt(salt);
		SubscribeParam subscribeParam = new SubscribeParam();
		subscribeParam.setParameters(subscribeParameters);
		subscribeParam.setCompany(logisticsCode);
		subscribeParam.setNumber(logisticsNo);
		subscribeParam.setTo(address);
		subscribeParam.setKey(key);
		SubscribeReq subscribeReq = new SubscribeReq();
		subscribeReq.setSchema(ApiInfoConstant.SUBSCRIBE_SCHEMA);

		subscribeReq.setParam(new Gson().toJson(subscribeParam));

		IBaseClient subscribe = new Subscribe();
		HttpResult result;
		try {
			result = subscribe.execute(subscribeReq);
		}
		catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
		if (result.getStatus() != HttpStatus.SC_OK) {
			log.error("快递订阅失败：status：{}；error：{}", result.getStatus(), result.getError());
			throw new RuntimeException(result.getError());
		}
		SubscribeResp subscribeResp = JSONUtil.toBean(result.getBody(), SubscribeResp.class);
		log.info("快递订阅：{}；", subscribeResp.toString());

	}

}
