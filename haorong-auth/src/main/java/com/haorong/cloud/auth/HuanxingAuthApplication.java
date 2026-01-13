/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.auth;

import org.apache.dubbo.config.spring.context.annotation.EnableDubbo;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * 认证授权模块
 *
 * @author haorong
 * @since 2022/2/18 14:45
 */
@EnableDubbo
@SpringBootApplication
public class HuanxingAuthApplication {

	public static void main(String[] args) {
		SpringApplication.run(HuanxingAuthApplication.class, args);
	}

}
