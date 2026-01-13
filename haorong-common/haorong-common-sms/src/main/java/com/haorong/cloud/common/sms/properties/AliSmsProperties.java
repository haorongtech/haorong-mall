/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.common.sms.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.context.annotation.Configuration;

/**
 * 阿里短信服务配置
 *
 * @author haorong
 * @date 2022/7/4
 */
@Data
@RefreshScope
@Configuration
@ConfigurationProperties(prefix = "sms.ali")
public class AliSmsProperties {

	private String accessKeyId;

	private String accessKeySecret;

	/** 登录模板名称 */
	private String loginTemplateCode;

	/** 登录签名名称 */
	private String loginSignName;

}
