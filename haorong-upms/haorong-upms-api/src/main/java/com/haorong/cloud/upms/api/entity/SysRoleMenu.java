/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.upms.api.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;

/**
 * 角色关联菜单
 *
 * @author haorong
 * @since 2022/2/10 11:00
 */
@Data
@Schema(description = "角色关联菜单")
@EqualsAndHashCode(callSuper = true)
@TableName(value = "sys_role_menu")
public class SysRoleMenu extends Model<SysRoleMenu> {

	@Schema(description = "主键")
	@TableId(type = IdType.ASSIGN_ID)
	private String id;

	@Schema(description = "角色ID")
	private String roleId;

	@Schema(description = "菜单ID")
	private String menuId;

	@TableField(fill = FieldFill.INSERT)
	@Schema(description = "创建时间")
	private LocalDateTime createTime;

	@Schema(description = "租户id")
	private String tenantId;

}
