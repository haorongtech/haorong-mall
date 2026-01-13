/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.miniapp.api.vo;

import com.haorong.cloud.common.core.annotation.Desensitization;
import com.haorong.cloud.common.core.desensitization.KeyDesensitization;
import com.haorong.cloud.common.core.desensitization.MobilePhoneDesensitization;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 微信用户
 *
 * @author haorong
 * @date 2022/6/1
 */
@Data
@Schema(description = "微信用户")
public class WxUserVo implements Serializable {

	@Serial
	private static final long serialVersionUID = 1L;

	@Schema(description = "主键")
	private String id;

	@Schema(description = "appId")
	private String appId;

	@Schema(description = "openid")
	@Desensitization(KeyDesensitization.class)
	private String openid;

	@Schema(description = "会话密钥")
	private String sessionKey;

	@Schema(description = "用户在开放平台的唯一标识符，若当前小程序已绑定到微信开放平台帐号下会返回")
	private String unionid;

	@Schema(description = "昵称")
	private String nickName;

	@Schema(description = "头像")
	private String avatarUrl;

	@Schema(description = "手机号码")
	@Desensitization(MobilePhoneDesensitization.class)
	private String phone;

	@Schema(description = "商城用户")
	private String mallUserId;

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

}
