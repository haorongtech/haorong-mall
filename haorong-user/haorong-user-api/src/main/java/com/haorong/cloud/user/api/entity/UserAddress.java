/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.user.api.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;

/**
 * 用户收货地址
 *
 * @author haorong
 * @since 2022/2/23 13:09
 */
@Data
@Schema(description = "用户收货地址")
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName(value = "user_address")
public class UserAddress extends Model<UserAddress> {

	@Schema(description = "主键")
	@TableId(type = IdType.ASSIGN_ID)
	private String id;

	@Schema(description = "用户ID")
	private String userId;

	@Schema(description = "收件人姓名")
	private String recipientName;

	@Schema(description = "联系电话")
	private String telephone;

	@Schema(description = "邮政编码")
	private String postalCode;

	@Schema(description = "省名称")
	private String provinceName;

	@Schema(description = "市名称")
	private String cityName;

	@Schema(description = "区名称")
	private String areaName;

	@Schema(description = "省编码")
	private String provinceCode;

	@Schema(description = "市编码")
	private String cityCode;

	@Schema(description = "区编码")
	private String areaCode;

	@Schema(description = "默认地址 0.否；1.是；")
	private String isDefault;

	@Schema(description = "详细地址")
	private String detailAddress;

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

}
