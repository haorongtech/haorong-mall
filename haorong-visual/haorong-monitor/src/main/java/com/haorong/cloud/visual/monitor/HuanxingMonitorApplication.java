/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.visual.monitor;

import de.codecentric.boot.admin.server.config.EnableAdminServer;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * 监控模块
 *
 * @author haorong
 * @since 2022/5/19 9:33
 */
@EnableAdminServer
@SpringBootApplication
public class HuanxingMonitorApplication {

	public static void main(String[] args) {
		SpringApplication.run(HuanxingMonitorApplication.class, args);

	}

}
