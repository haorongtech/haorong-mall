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
import com.haorong.cloud.common.core.annotation.Desensitization;
import com.haorong.cloud.common.core.desensitization.KeyDesensitization;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;

/**
 * 系统文件存储配置
 *
 * @author haorong
 * @date 2022/9/20
 */
@Data
@Schema(description = "系统文件存储配置")
@EqualsAndHashCode(callSuper = true)
@TableName(value = "sys_storage_config")
public class SysStorageConfig extends Model<SysStorageConfig> {

	private static final long serialVersionUID = 1L;

	@Schema(description = "主键")
	@TableId(type = IdType.ASSIGN_ID)
	private String id;

	@Schema(description = "存储类型1、阿里OSS；2、七牛云；3、腾讯云")
	private String type;

	@Schema(description = "access_key")
	@Desensitization(KeyDesensitization.class)
	private String accessKey;

	@Schema(description = "access_secret")
	@Desensitization(KeyDesensitization.class)
	private String accessSecret;

	@Schema(description = "地域节点")
	private String endpoint;

	@Schema(description = "域名")
	private String bucket;

	@Schema(description = "指定文件夹")
	private String dir;

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

	@Schema(description = "状态：0.正常；1.禁用；")
	private String status;

}
