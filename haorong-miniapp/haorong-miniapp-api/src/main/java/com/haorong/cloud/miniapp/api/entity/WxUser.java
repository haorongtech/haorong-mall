/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.miniapp.api.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;

/**
 * 微信用户
 *
 * @author haorong
 * @date 2022/6/11
 */
@Data
@Schema(description = "微信用户")
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName(value = "wx_user")
public class WxUser extends Model<WxUser> {

	@Schema(description = "主键")
	@TableId(type = IdType.ASSIGN_ID)
	private String id;

	@Schema(description = "appId")
	private String appId;

	@Schema(description = "openid")
	private String openid;

	@Schema(description = "会话密钥")
	private String sessionKey;

	@Schema(description = "用户在开放平台的唯一标识符，若当前小程序已绑定到微信开放平台帐号下会返回")
	private String unionid;

	@Schema(description = "昵称")
	private String nickName;

	@Schema(description = "头像")
	private String avatarUrl;

	@Schema(description = "手机号码")
	private String phone;

	@Schema(description = "商城用户")
	private String mallUserId;

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
