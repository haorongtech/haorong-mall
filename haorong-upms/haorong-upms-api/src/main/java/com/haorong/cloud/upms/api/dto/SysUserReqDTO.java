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
 * 系统用户
 *
 * @author MAX
 * @date 2024/05/07 13:36
 */
@Data
public class SysUserReqDTO implements Serializable {

	@Serial
	private static final long serialVersionUID = 1L;

	@Schema(description = "主键")
	private String username;

	@Schema(description = "密码")
	private String password;

	@Schema(description = "手机号")
	private String phone;

	@Schema(description = "账号类型：0.系统主账户（管理全部店铺）；")
	private String type;

}
