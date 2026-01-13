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
 * 字典键值
 *
 * @author haorong
 * @date 2022/10/21
 */
@Data
@Schema(description = "字典键值")
@EqualsAndHashCode(callSuper = true)
@TableName(value = "sys_dict_value")
public class SysDictValue extends Model<SysDictValue> {

	@Schema(description = "主键")
	@TableId(type = IdType.ASSIGN_ID)
	private String id;

	@Schema(description = "字典主键")
	private String dictId;

	@Schema(description = "字典标签")
	private String dictLabel;

	@Schema(description = "字典键值")
	private String dictValue;

	@Schema(description = "字典类型")
	private String dictType;

	@Schema(description = "状态：0.正常；1.停用；")
	private String status;

	@Schema(description = "排序")
	private Integer sort;

	@Schema(description = "备注")
	private String remarks;

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

	@Schema(description = "回显样式")
	private String showClass;

}
