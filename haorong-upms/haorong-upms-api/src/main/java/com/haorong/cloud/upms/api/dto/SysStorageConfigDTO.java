/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.upms.api.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;

/**
 * 系统文件存储配置
 *
 * @author haorong
 * @date 2022/9/20
 */
@Data
@Schema(description = "系统文件存储配置")
public class SysStorageConfigDTO implements Serializable {

	@Serial
	private static final long serialVersionUID = 1L;

	@Schema(description = "存储类型1、阿里OSS；2、七牛云；3、腾讯云")
	private String type;

	@Schema(description = "access_key")
	private String accessKey;

	@Schema(description = "access_secret")
	private String accessSecret;

	@Schema(description = "地域节点")
	private String endpoint;

	@Schema(description = "域名")
	private String bucket;

	@Schema(description = "指定文件夹")
	private String dir;

}
