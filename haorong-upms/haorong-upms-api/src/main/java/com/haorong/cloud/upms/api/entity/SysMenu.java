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
 * 菜单
 *
 * @author haorong
 * @since 2022/2/10 11:00
 */
@Data
@Schema(description = "菜单")
@EqualsAndHashCode(callSuper = true)
@TableName(value = "sys_menu")
public class SysMenu extends Model<SysMenu> {

	@Schema(description = "主键")
	@TableId(type = IdType.ASSIGN_ID)
	private String id;

	@Schema(description = "菜单名称")
	private String name;

	@Schema(description = "菜单权限")
	private String permission;

	@Schema(description = "URL")
	private String path;

	@Schema(description = "重定向url")
	private String redirect;

	@Schema(description = "父菜单ID")
	private String parentId;

	@Schema(description = "图标")
	private String icon;

	@Schema(description = "页面地址")
	private String component;

	@Schema(description = "排序")
	private Integer sort;

	@Schema(description = "类型: 0.菜单; 1.按钮;")
	private String type;

	@Schema(description = "外链状态：0.否；1.是；")
	private String outerStatus;

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

	@Schema(description = "应用key")
	private String applicationKey;

}
