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

@Data
public class SysLogReqDTO implements Serializable {

	@Serial
	private static final long serialVersionUID = 1L;

	@Schema(description = "ip地址")
	private String ipAddr;

	@Schema(description = "请求标题")
	private String title;

	@Schema(description = "请求方式")
	private String requestMethod;

	@Schema(description = "请求URI")
	private String requestUri;

	@Schema(description = "请求数据")
	private String requestParams;

	@Schema(description = "请求时长")
	private Long requestTime;

	@Schema(description = "操作地点")
	private String location;

	@Schema(description = "操作方法")
	private String method;

	@Schema(description = "操作用户")
	private String userName;

	@Schema(description = "状态：0.失败；1.成功；")
	private String status;

	@Schema(description = "异常信息")
	private String exMsg;

	@Schema(description = "创建ID")
	private String createId;

	@Schema(description = "租户id")
	private String tenantId;

}
