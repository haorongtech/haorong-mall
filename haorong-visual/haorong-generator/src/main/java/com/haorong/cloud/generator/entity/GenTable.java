package com.haorong.cloud.generator.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;
import java.util.List;

@Data
@Schema(description = "代码生成表")
@EqualsAndHashCode(callSuper = true)
@TableName(value = "gen_table")
public class GenTable extends Model<GenTable> {

	/** 编号 */
	@TableId(type = IdType.INPUT)
	private String tableId;

	/** 表名称 */
	@NotBlank(message = "表名称不能为空")
	private String tableName;

	/** 表描述 */
	@NotBlank(message = "表描述不能为空")
	private String tableComment;

	/** 关联父表的表名 */
	private String subTableName;

	/** 本表关联父表的外键名 */
	private String subTableFkName;

	/** 实体类名称(首字母大写) */
	@NotBlank(message = "实体类名称不能为空")
	private String className;

	/** 使用的模板（crud单表操作 tree树表操作 sub主子表操作） */
	private String tplCategory;

	/** 前端类型（element-ui模版 element-plus模版） */
	private String tplWebType;

	/** 生成包路径 */
	@NotBlank(message = "生成包路径不能为空")
	private String packageName;

	/** 生成模块名 */
	@NotBlank(message = "生成模块名不能为空")
	private String moduleName;

	/** 生成业务名 */
	@NotBlank(message = "生成业务名不能为空")
	private String businessName;

	/** 生成功能名 */
	@NotBlank(message = "生成功能名不能为空")
	private String functionName;

	/** 生成作者 */
	@NotBlank(message = "作者不能为空")
	private String functionAuthor;

	/** 生成代码方式（0zip压缩包 1自定义路径） */
	private String genType;

	/** 生成路径（不填默认项目路径） */
	private String genPath;

	/** 主键信息 */
	@TableField(exist = false)
	private GenTableColumn pkColumn;

	/** 子表信息 */
	@TableField(exist = false)
	private GenTable subTable;

	/** 表列信息 */
	@TableField(exist = false)
	private List<GenTableColumn> columns;

	/** 其它生成选项 */
	private String options;

	/** 树编码字段 */
	private String treeCode;

	/** 树父编码字段 */
	private String treeParentCode;

	/** 树名称字段 */
	private String treeName;

	/** 上级菜单ID字段 */
	private Long parentMenuId;

	/** 上级菜单名称字段 */
	private String parentMenuName;

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

	@Schema(description = "数据源名称")
	private String dsName;

}
