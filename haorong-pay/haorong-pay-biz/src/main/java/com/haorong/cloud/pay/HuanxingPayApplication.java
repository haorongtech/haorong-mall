/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.pay;

import org.apache.dubbo.config.spring.context.annotation.EnableDubbo;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * 支付模块启动类
 *
 * @author haorong
 * @since 2022/2/26 16:38
 */
@EnableDubbo
@SpringBootApplication
public class HuanxingPayApplication {

	public static void main(String[] args) {
		SpringApplication.run(HuanxingPayApplication.class, args);
	}

}
