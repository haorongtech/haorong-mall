/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.common.dubbo.config;

import com.haorong.cloud.common.core.factory.YamlPropertySourceFactory;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

/**
 * @author haorong
 * @description dubbo配置
 * @date 2024/11/25
 */
@PropertySource(value = "classpath:dubbo-config.yml", factory = YamlPropertySourceFactory.class)
@ConditionalOnProperty(prefix = "hx", value = "cloud.enable", matchIfMissing = true)
@Configuration(proxyBeanMethods = false)
public class HxDubboConfiguration {

}
