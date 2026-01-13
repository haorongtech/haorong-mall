/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.common.storage.entity;

import lombok.Data;

/**
 * 文件存储配置
 *
 * @author haorong
 * @date 2022/6/10
 */
@Data
public class StorageConfig {

	/** AccessKeyId */
	private String accessKeyId;

	/** AccessKeySecret。 */
	private String accessKeySecret;

	/** endpoint。 */
	private String endpoint;

	/** bucketname。 */
	private String bucket;

	/** 指定文件夹 */
	private String dir;

	private String contextType;

}
