/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.order.service.impl;

import com.alibaba.fastjson2.JSON;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.haorong.cloud.common.core.constant.CacheConstants;
import com.haorong.cloud.common.core.constant.CommonConstants;
import com.haorong.cloud.common.myabtis.tenant.HxTenantContextHolder;
import com.haorong.cloud.order.api.entity.OrderConfig;
import com.haorong.cloud.order.mapper.OrderConfigMapper;
import com.haorong.cloud.order.service.IOrderConfigService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Objects;

/**
 * 订单配置
 *
 * @author haorong
 * @date 2025/5/27
 */
@Service
@RequiredArgsConstructor
public class OrderConfigServiceImpl extends ServiceImpl<OrderConfigMapper, OrderConfig> implements IOrderConfigService {

	private final StringRedisTemplate stringRedisTemplate;

	@Override
	public boolean saveConfig(OrderConfig orderConfig) {
		// 如果状态是正常，把其他已启用改为停用
		if (CommonConstants.NORMAL_STATUS.equals(orderConfig.getStatus())) {
			setStatus();
		}
		return this.save(orderConfig);
	}

	@Override
	public boolean updateConfigById(OrderConfig orderConfig) {
		if (CommonConstants.NORMAL_STATUS.equals(orderConfig.getStatus())) {
			setStatus();
		}
		String key = CacheConstants.ORDER_CONFIG_CACHE + HxTenantContextHolder.getTenantId();
		stringRedisTemplate.delete(key);
		return this.updateById(orderConfig);
	}

	@Override
	public OrderConfig getConfig() {
		String key = CacheConstants.ORDER_CONFIG_CACHE + HxTenantContextHolder.getTenantId();
		String obj = stringRedisTemplate.opsForValue().get(key);
		if (StringUtils.hasText(obj)) {
			return JSON.parseObject(obj, OrderConfig.class);
		}
		OrderConfig orderConfig = this.getOne(Wrappers.<OrderConfig>lambdaQuery()
			.eq(OrderConfig::getStatus, CommonConstants.NORMAL_STATUS)
			.last("limit 1"));
		if (Objects.isNull(orderConfig)) {
			return null;
		}
		stringRedisTemplate.opsForValue().set(key, JSON.toJSONString(orderConfig));
		return orderConfig;
	}

	@Override
	public boolean removeConfigById(String id) {
		String key = CacheConstants.ORDER_CONFIG_CACHE + HxTenantContextHolder.getTenantId();
		stringRedisTemplate.delete(key);
		return this.removeById(id);
	}

	public void setStatus() {
		OrderConfig orderConfig = new OrderConfig();
		orderConfig.setStatus(CommonConstants.YES);
		super.update(orderConfig,
				Wrappers.<OrderConfig>lambdaQuery().eq(OrderConfig::getStatus, CommonConstants.NORMAL_STATUS));
	}

}
