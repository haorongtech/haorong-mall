/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud;

import com.haorong.cloud.common.job.annotation.HxEnableXxlJob;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * 单体模块启动类
 *
 * @author haorong
 * @since 2022/2/18 13:52
 */
@HxEnableXxlJob
@SpringBootApplication
public class HuanxingBootApplication {

	public static void main(String[] args) {
		SpringApplication.run(HuanxingBootApplication.class, args);
	}

}
