/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.upms.api.vo.server;

/**
 * 內存相关信息
 *
 * @author haorong
 * @since 2022/5/21 15:42
 */
public class Mem {

	/** 内存总量 */
	private double total;

	/** 已用内存 */
	private double used;

	/** 剩余内存 */
	private double free;

	public double getTotal() {

		return total / (1024 * 1024 * 1024);
	}

	public void setTotal(long total) {

		this.total = total;
	}

	public double getUsed() {

		return used / (1024 * 1024 * 1024);
	}

	public void setUsed(long used) {

		this.used = used;
	}

	public double getFree() {

		return free / (1024 * 1024 * 1024);
	}

	public void setFree(long free) {

		this.free = free;
	}

	public double getUsage() {

		return (used / total) * 100;
	}

}
