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
 * 系统角色
 *
 * @author haorong
 * @since 2022/2/10 11:00
 */
@Data
@Schema(description = "系统角色")
@EqualsAndHashCode(callSuper = true)
@TableName(value = "sys_role")
public class SysRole extends Model<SysRole> {

	@Schema(description = "主键")
	@TableId(type = IdType.ASSIGN_ID)
	private String id;

	@Schema(description = "角色名称")
	private String roleName;

	@Schema(description = "角色编码")
	private String roleCode;

	@Schema(description = "角色描述")
	private String roleDesc;

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

	public SysRole() {
	}

	public SysRole(String roleName, String roleCode) {
		this.setRoleName(roleName);
		this.setRoleCode(roleCode);
	}

	public SysRole(String id, String roleName, String roleCode) {
		this.setRoleName(roleName);
		this.setRoleCode(roleCode);
		this.setId(id);
	}

}
