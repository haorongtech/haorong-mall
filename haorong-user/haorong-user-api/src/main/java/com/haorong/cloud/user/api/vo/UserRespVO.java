/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.user.api.vo;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.haorong.cloud.common.core.annotation.Desensitization;
import com.haorong.cloud.common.core.desensitization.MobilePhoneDesensitization;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;

@Data
public class UserRespVO implements Serializable {

	@Serial
	private static final long serialVersionUID = 1L;

	@Schema(description = "主键")
	private String id;

	@Schema(description = "昵称")
	private String nickName;

	@Schema(description = "手机号")
	@Desensitization(MobilePhoneDesensitization.class)
	private String phone;

	@Schema(description = "密码")
	private String password;

	@Schema(description = "性别：1、男；2、女；0、未知；")
	private String sex;

	@Schema(description = "头像")
	private String avatarUrl;

	@Schema(description = "所在城市")
	private String city;

	@Schema(description = "所在省份")
	private String province;

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

	@Schema(description = "用户来源")
	private String userSource;

}
