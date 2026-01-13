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
import com.haorong.cloud.common.myabtis.handler.JsonArrayStringTypeHandler;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.apache.ibatis.type.JdbcType;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * 租户套餐
 *
 * @author haorong
 * @date 2022/11/09
 */
@Data
@Schema(description = "租户套餐")
@EqualsAndHashCode(callSuper = true)
@TableName(value = "sys_tenant_package")
public class SysTenantPackage extends Model<SysTenantPackage> {

	@Schema(description = "主键")
	@TableId(type = IdType.ASSIGN_ID)
	private String id;

	@Schema(description = "套餐名称")
	@NotBlank(message = "套餐名称不能为空")
	private String name;

	@Schema(description = "子标题")
	private String subTitle;

	@Schema(description = "销售价格（元）")
	private BigDecimal salesPrice;

	@Schema(description = "原价（元）")
	private String originalPrice;

	@Schema(description = "状态：0.正常；1.停用；")
	@NotBlank(message = "状态不能为空")
	private String status;

	@Schema(description = "描述")
	private String description;

	@Schema(description = "应用key")
	@TableField(typeHandler = JsonArrayStringTypeHandler.class, jdbcType = JdbcType.VARCHAR)
	private String[] appKey;

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

}
