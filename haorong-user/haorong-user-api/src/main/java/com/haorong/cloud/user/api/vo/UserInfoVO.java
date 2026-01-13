/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.user.api.vo;

import com.haorong.cloud.common.core.annotation.Desensitization;
import com.haorong.cloud.common.core.desensitization.MobilePhoneDesensitization;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;

/**
 * 用户信息VO
 *
 * @author haorong
 * @date 2022/7/11
 */
@Data
@Schema(description = "用户信息VO")
public class UserInfoVO implements Serializable {

	@Serial
	private static final long serialVersionUID = 1L;

	@Schema(description = "主键")
	private String id;

	@Schema(description = "昵称")
	private String nickName;

	@Schema(description = "头像")
	private String avatarUrl;

	@Schema(description = "手机号")
	@Desensitization(MobilePhoneDesensitization.class)
	private String phone;

	@Schema(description = "密码")
	private String password;

	@Schema(description = "租户id")
	private String tenantId;

}
