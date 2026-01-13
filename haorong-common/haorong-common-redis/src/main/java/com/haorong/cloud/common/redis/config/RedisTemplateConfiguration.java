/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.common.redis.config;

import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.*;
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;

/**
 * redisTemplate配置类
 *
 * @author haorong
 */
@Configuration
@EnableCaching
public class RedisTemplateConfiguration {

	@Bean
	public RedisTemplate<String, Object> redisTemplate(RedisConnectionFactory factory) {
		RedisTemplate<String, Object> redisTemplate = new RedisTemplate<>();
		redisTemplate.setKeySerializer(RedisSerializer.string());
		redisTemplate.setHashKeySerializer(RedisSerializer.string());
		redisTemplate.setValueSerializer(RedisSerializer.java());
		redisTemplate.setHashValueSerializer(RedisSerializer.java());
		redisTemplate.setConnectionFactory(factory);
		// RedisTemplate<String, Object> template = new RedisTemplate<>();
		// template.setConnectionFactory(factory);
		//
		// // 设置序列化工具
		// Jackson2JsonRedisSerializer<Object> jackson2JsonRedisSerializer = new
		// Jackson2JsonRedisSerializer<>(Object.class);
		//
		// // 设置key的序列化方式为String类型
		// template.setKeySerializer(new StringRedisSerializer());
		// // 设置value的序列化方式为JSON类型
		// template.setValueSerializer(jackson2JsonRedisSerializer);
		//
		// // 如果你还需要设置hash key或hash value的序列化方式，也可以在这里配置
		// template.setHashKeySerializer(new StringRedisSerializer());
		// template.setHashValueSerializer(jackson2JsonRedisSerializer);
		//
		// template.afterPropertiesSet();
		return redisTemplate;
	}

	@Bean
	public HashOperations<String, String, Object> hashOperations(RedisTemplate<String, Object> redisTemplate) {
		return redisTemplate.opsForHash();
	}

	@Bean
	public ValueOperations<String, String> valueOperations(RedisTemplate<String, String> redisTemplate) {
		return redisTemplate.opsForValue();
	}

	@Bean
	public ListOperations<String, Object> listOperations(RedisTemplate<String, Object> redisTemplate) {
		return redisTemplate.opsForList();
	}

	@Bean
	public SetOperations<String, Object> setOperations(RedisTemplate<String, Object> redisTemplate) {
		return redisTemplate.opsForSet();
	}

	@Bean
	public ZSetOperations<String, Object> zSetOperations(RedisTemplate<String, Object> redisTemplate) {
		return redisTemplate.opsForZSet();
	}

}
