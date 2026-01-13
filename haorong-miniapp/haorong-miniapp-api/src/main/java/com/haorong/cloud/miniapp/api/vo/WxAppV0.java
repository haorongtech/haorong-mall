/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.miniapp.api.vo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.haorong.cloud.common.core.annotation.Desensitization;
import com.haorong.cloud.common.core.desensitization.KeyDesensitization;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;

@Data
public class WxAppV0 implements Serializable {

	@Serial
	private static final long serialVersionUID = 1L;

	@Schema(description = "appId")
	@TableId(type = IdType.ASSIGN_ID)
	private String appId;

	@Schema(description = "秘钥")
	@Desensitization(KeyDesensitization.class)
	private String appSecret;

	/** 设置微信小程序消息服务器配置的token */
	@Schema(description = "token")
	private String token;

	/** 设置微信小程序消息服务器配置的EncodingAESKey */
	@Schema(description = "aesKey")
	private String aesKey;

	@Schema(description = "应用名称")
	private String appName;

	@Schema(description = "应用图片")
	private String miniCodeUrl;

	@Schema(description = "创建时间")
	private LocalDateTime createTime;

	@Schema(description = "更新时间")
	private LocalDateTime updateTime;

	@Schema(description = "创建者ID")
	private String createId;

	@Schema(description = "修改者ID")
	private String updateId;

	@Schema(description = "逻辑删除：0、显示；1、隐藏")
	private String delFlag;

	@Schema(description = "租户id")
	private String tenantId;

}
