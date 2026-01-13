/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.miniapp.api.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotEmpty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;

/**
 * 微信应用
 *
 * @author haorong
 * @date 2022/6/11
 */
@Data
@Schema(description = "微信应用")
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName(value = "wx_app")
public class WxApp extends Model<WxApp> {

	@Schema(description = "appId")
	@TableId(type = IdType.INPUT)
	@NotEmpty(message = "appId is empty!")
	private String appId;

	@Schema(description = "秘钥")
	@NotEmpty(message = "appSecret is empty!")
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

	@TableField(fill = FieldFill.INSERT)
	@Schema(description = "创建人")
	private String createBy;

	@TableField(fill = FieldFill.UPDATE)
	@Schema(description = "修改人")
	private String updateBy;

	@TableField(fill = FieldFill.INSERT)
	@Schema(description = "创建时间")
	private LocalDateTime createTime;

	@TableField(fill = FieldFill.UPDATE)
	@Schema(description = "修改时间")
	private LocalDateTime updateTime;

	@TableLogic
	@TableField(fill = FieldFill.INSERT)
	@Schema(description = "逻辑删除：0.显示；1.隐藏；")
	private String delFlag;

	@Schema(description = "租户id")
	private String tenantId;

}
