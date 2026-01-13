/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.common.core.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

import java.util.concurrent.Executor;
import java.util.concurrent.ThreadPoolExecutor;

/**
 * 异步线程池配置
 *
 * @author haorong
 * @date 2024/6/21
 */
@Configuration
@EnableAsync
public class AsyncConfig {

	// 线程最大的空闲存活时间，单位为秒
	public static final int KEEP_ALIVE_TIME = 60;

	// 任务缓存队列长度
	private static final int QUEUE_CAPACITY = 500;

	// 当前机器的核数
	private static final int PROCESSORS = Runtime.getRuntime().availableProcessors();

	@Bean(name = "hxAsyncExecutor")
	public Executor getAsyncExecutor() {

		ThreadPoolTaskExecutor threadPoolTaskExecutor = new ThreadPoolTaskExecutor();
		// 线程核心数目
		threadPoolTaskExecutor.setCorePoolSize(PROCESSORS);
		threadPoolTaskExecutor.setKeepAliveSeconds(KEEP_ALIVE_TIME);
		threadPoolTaskExecutor.setAllowCoreThreadTimeOut(true);
		// 最大线程数
		threadPoolTaskExecutor.setMaxPoolSize(PROCESSORS * 2);
		// 配置队列大小
		threadPoolTaskExecutor.setQueueCapacity(QUEUE_CAPACITY);
		// 配置线程池前缀
		threadPoolTaskExecutor.setThreadNamePrefix("Hx-Async-");
		// 配置拒绝策略
		threadPoolTaskExecutor.setRejectedExecutionHandler(new ThreadPoolExecutor.CallerRunsPolicy());
		// 数据初始化
		threadPoolTaskExecutor.initialize();
		return threadPoolTaskExecutor;
	}

}
