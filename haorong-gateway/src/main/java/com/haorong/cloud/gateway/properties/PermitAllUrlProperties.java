/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.gateway.properties;

import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

import java.util.List;

/**
 * 访问白名单路径
 *
 * @author haorong
 * @date 2022/6/28
 */
@Slf4j
@Configuration
@ConfigurationProperties(prefix = "secure.ignore")
public class PermitAllUrlProperties {

	@Getter
	@Setter
	private List<String> urls;

}
