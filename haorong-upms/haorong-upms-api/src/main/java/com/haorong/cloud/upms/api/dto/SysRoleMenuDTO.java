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
import java.util.List;

/**
 * @author haorong
 */
@Data
public class SysRoleMenuDTO implements Serializable {

	@Serial
	private static final long serialVersionUID = 1L;

	@Schema(description = "角色ID")
	private String roleId;

	@Schema(description = "菜单权限集合")
	private List<String> menuIds;

	@Schema(description = "租户ID")
	private String tenantId;

}
