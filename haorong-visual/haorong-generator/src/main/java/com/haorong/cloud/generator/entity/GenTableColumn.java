package com.haorong.cloud.generator.entity;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.annotation.*;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.apache.commons.lang3.StringUtils;

import java.time.LocalDateTime;

@Data
@Schema(description = "代码生成业务字段")
@EqualsAndHashCode(callSuper = true)
@TableName(value = "gen_table_column")
public class GenTableColumn extends Model<GenTableColumn> {

	@Schema(description = "主键")
	@TableId(type = IdType.ASSIGN_ID)
	private String columnId;

	@Schema(description = "归属表ID")
	private String tableId;

	@Schema(description = "列名称")
	private String columnName;

	@Schema(description = "列描述")
	private String columnComment;

	@Schema(description = "列类型")
	private String columnType;

	@Schema(description = "JAVA类型")
	private String javaType;

	@Schema(description = "JAVA字段名")
	@NotBlank(message = "Java属性不能为空")
	private String javaField;

	@Schema(description = "是否主键（1是）")
	private String isPk;

	@Schema(description = "是否自增（1是）")
	private String isIncrement;

	@Schema(description = "是否必填（1是）")
	private String isRequired;

	@Schema(description = "是否为插入字段（1是）")
	private String isInsert;

	@Schema(description = "是否编辑字段（1是）")
	private String isEdit;

	@Schema(description = "是否列表字段（1是）")
	private String isList;

	@Schema(description = "是否查询字段（1是）")
	private String isQuery;

	@Schema(description = "查询方式（EQ等于、NE不等于、GT大于、LT小于、LIKE模糊、BETWEEN范围） ")
	private String queryType;

	/**
	 * 显示类型（input文本框、textarea文本域、select下拉框、checkbox复选框、radio单选框、datetime日期控件、image图片上传控件、upload文件上传控件、editor富文本控件）
	 */
	@Schema(description = "显示类型")
	private String htmlType;

	@Schema(description = "字典类型")
	private String dictType;

	@Schema(description = "排序")
	private Integer sort;

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

	public boolean isPk() {
		return isPk(this.isPk);
	}

	public boolean isPk(String isPk) {
		return isPk != null && StrUtil.equals("1", isPk);
	}

	public boolean isSuperColumn() {
		return isSuperColumn(this.javaField);
	}

	public static boolean isSuperColumn(String javaField) {
		return StringUtils.equalsAnyIgnoreCase(javaField,
				// BaseEntity
				"createBy", "createTime", "updateBy", "updateTime", "remark",
				// TreeEntity
				"parentName", "parentId", "orderNum", "ancestors");
	}

	public boolean isUsableColumn() {
		return isUsableColumn(javaField);
	}

	public static boolean isUsableColumn(String javaField) {
		// isSuperColumn()中的名单用于避免生成多余Domain属性，若某些属性在生成页面时需要用到不能忽略，则放在此处白名单
		return StringUtils.equalsAnyIgnoreCase(javaField, "parentId", "orderNum", "remark");
	}

	public boolean isList() {
		return isList(this.isList);
	}

	public boolean isList(String isList) {
		return isList != null && StringUtils.equals("1", isList);
	}

}
