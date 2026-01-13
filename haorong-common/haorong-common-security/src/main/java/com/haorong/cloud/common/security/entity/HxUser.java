/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.common.security.entity;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

@Data
@NoArgsConstructor
public class HxUser implements Serializable {

	private static final long serialVersionUID = 1L;

	@Schema(description = "用户id")
	private String userId;

	@Schema(description = "用户名")
	private String username;

	@Schema(description = "密码")
	private String password;

	@Schema(description = "邮箱")
	private String email;

	@Schema(description = "用户昵称")
	private String nikeName;

	@Schema(description = "头像")
	private String avatar;

	@Schema(description = "部门ID")
	private String deptId;

	@Schema(description = "手机号")
	private String phone;

	@Schema(description = "状态：0.正常；1.停用；")
	private String status;

	@Schema(description = "租户id")
	private String tenantId;

	@Schema(description = "openId")
	private String openId;

	@Schema(description = "账号类型：0.系统主账户")
	private String type;

	/** 权限标识 */
	private List<String> permissions;

	/** 角色 */
	private List<String> roles;

}
