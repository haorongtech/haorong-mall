/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.upms.service.impl;

import cn.hutool.core.util.RandomUtil;
import cn.hutool.json.JSONUtil;
import com.haorong.cloud.common.core.constant.CacheConstants;
import com.haorong.cloud.common.sms.util.AliSmsUtils;
import com.haorong.cloud.upms.service.ISysSmsService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

@Service
@RequiredArgsConstructor
public class SysSmsServiceImpl implements ISysSmsService {

	private final StringRedisTemplate redisTemplate;

	private final AliSmsUtils aliSmsUtils;

	@Override
	public Boolean sendSmsCode(String mobile, String type) {
		String code = RandomUtil.randomNumbers(4);
		switch (type) {
			case "register":
				// 发送注册验证码
				break;
			case "login":
			case "update":
				// 发送登录验证码
				// 发送忘记密码验证码
				String codeStr = redisTemplate.opsForValue().get(CacheConstants.SMS_CODE_KEY + mobile);
				if (StringUtils.hasText(codeStr)) {
					// 验证码未过期
					return Boolean.TRUE;
				}
				Map<String, String> maps = new HashMap<>();
				maps.put("code", code);
				try {
					aliSmsUtils.sendSms(mobile, JSONUtil.toJsonStr(maps));
				}
				catch (Exception e) {
					throw new RuntimeException(e.getMessage());
				}
				// 保存验证码信息
				redisTemplate.opsForValue().set(CacheConstants.SMS_CODE_KEY + mobile, code, 300, TimeUnit.SECONDS);
				break;
			case "forget":
				break;
			default:
		}
		return Boolean.TRUE;
	}

}
