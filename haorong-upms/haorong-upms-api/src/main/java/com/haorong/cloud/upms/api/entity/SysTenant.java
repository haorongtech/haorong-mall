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
import jakarta.validation.constraints.NotBlank;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;

/**
 * 租户管理
 *
 * @author haorong
 * @date 2022/11/09
 */
@Data
@Schema(description = "租户管理")
@EqualsAndHashCode(callSuper = true)
@TableName(value = "sys_tenant")
public class SysTenant extends Model<SysTenant> {

	@Schema(description = "主键")
	@TableId(type = IdType.ASSIGN_ID)
	private String id;

	@Schema(description = "租户名称")
	@NotBlank(message = "租户名称不能为空")
	private String name;

	@Schema(description = "租户logo")
	private String logoUrl;

	@Schema(description = "租户地址")
	private String address;

	@Schema(description = "官网地址")
	private String siteUrl;

	@Schema(description = "状态：0.正常；1.停用；")
	@NotBlank(message = "状态不能为空")
	private String status;

	@Schema(description = "邮箱")
	private String email;

	@Schema(description = "手机号")
	private String phone;

	@Schema(description = "授权开始时间")
	private LocalDateTime authBeginTime;

	@Schema(description = "授权结束时间")
	private LocalDateTime authEndTime;

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

	@Schema(description = "套餐包ID")
	private String packageId;

	@Schema(description = "用户名")
	@TableField(exist = false)
	private String username;

	@Schema(description = "密码")
	@TableField(exist = false)
	private String password;

}
