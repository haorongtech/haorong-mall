/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.upms.api.dto;

import com.baomidou.mybatisplus.annotation.TableField;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;

/**
 * 系统菜单
 *
 * @author haorong
 * @date 2022/7/30
 */
@Data
public class SysMenuDTO implements Serializable {

	@Serial
	private static final long serialVersionUID = 1L;

	@Schema(description = "父菜单ID")
	private String parentId;

	@Schema(description = "父菜单名称")
	private String parentName;

	@Schema(description = "权限前缀")
	@TableField(exist = false)
	private String permissionPrefix;

}
