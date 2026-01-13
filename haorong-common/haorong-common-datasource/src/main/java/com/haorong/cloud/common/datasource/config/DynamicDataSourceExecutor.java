/**
 * Copyright (c) 2025 沈阳浩荣科技有限公司
 * All rights reserved.
 * <p>
 * 注意：
 * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。
 * 仅供购买并获得正式授权的客户使用，侵权必究。
 */
package com.haorong.cloud.common.datasource.config;

import com.baomidou.dynamic.datasource.toolkit.DynamicDataSourceContextHolder;

import java.util.function.Supplier;

/**
 * 动态数据源执行工具类 用于在指定数据源上下文中执行逻辑，执行完毕后自动清理。
 */
public class DynamicDataSourceExecutor {

	/**
	 * 在指定数据源上下文中执行无返回值逻辑
	 * @param dsName 数据源名称
	 * @param runnable 执行逻辑
	 */
	public static void run(String dsName, Runnable runnable) {
		try {
			DynamicDataSourceContextHolder.push(dsName);
			runnable.run();
		}
		finally {
			DynamicDataSourceContextHolder.clear();
		}
	}

	/**
	 * 在指定数据源上下文中执行有返回值逻辑
	 * @param dsName 数据源名称
	 * @param supplier 执行逻辑（有返回值）
	 * @param <T> 返回类型
	 * @return 执行结果
	 */
	public static <T> T call(String dsName, Supplier<T> supplier) {
		try {
			DynamicDataSourceContextHolder.push(dsName);
			return supplier.get();
		}
		finally {
			DynamicDataSourceContextHolder.clear();
		}
	}

}
