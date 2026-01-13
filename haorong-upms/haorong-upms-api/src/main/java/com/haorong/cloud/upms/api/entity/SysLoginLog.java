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
 * 登录日志
 *
 * @author haorong
 * @since 2022/2/16 15:41
 */
@Data
@Schema(description = "登录日志")
@EqualsAndHashCode(callSuper = true)
@TableName(value = "sys_login_log")
public class SysLoginLog extends Model<SysLoginLog> {

	@Schema(description = "主键")
	@TableId(type = IdType.ASSIGN_ID)
	private String id;

	@Schema(description = "ip地址")
	private String ipAddr;

	@Schema(description = "登录地点")
	private String location;

	@Schema(description = "登录用户")
	private String userName;

	@Schema(description = "状态：0.失败；1.成功；")
	private String status;

	@Schema(description = "信息")
	private String msg;

	@Schema(description = "浏览器")
	private String browser;

	@Schema(description = "操作系统")
	private String os;

	@TableField(fill = FieldFill.INSERT)
	@Schema(description = "创建人")
	private String createBy;

	@TableField(fill = FieldFill.INSERT)
	@Schema(description = "创建时间")
	private LocalDateTime createTime;

	@TableLogic
	@TableField(fill = FieldFill.INSERT)
	@Schema(description = "逻辑删除：0.显示；1.隐藏；")
	private String delFlag;

	@Schema(description = "租户id")
	private String tenantId;

}
