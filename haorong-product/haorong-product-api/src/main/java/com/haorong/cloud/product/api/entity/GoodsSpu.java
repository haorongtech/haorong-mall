/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.product.api.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.haorong.cloud.common.myabtis.handler.JsonArrayStringTypeHandler;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

/**
 * 商品spu
 *
 * @author haorong
 * @since 2022/2/22 14:28
 */
@Data
@Schema(description = "商品spu")
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName(value = "goods_spu", autoResultMap = true)
public class GoodsSpu extends Model<GoodsSpu> {

	@Schema(description = "主键")
	@TableId(type = IdType.ASSIGN_ID)
	private String id;

	@Schema(description = "商品名称")
	private String name;

	@Schema(description = "子标题")
	private String subTitle;

	@Schema(description = "商品图地址")
	@TableField(typeHandler = JsonArrayStringTypeHandler.class)
	private String[] spuUrls;

	@Schema(description = "状态：0.下架；1.上架")
	private String status;

	@Schema(description = "销量")
	private Integer salesVolume;

	@Schema(description = "一级类目主键")
	private String categoryFirstId;

	@Schema(description = "二级类目主键")
	private String categorySecondId;

	@Schema(description = "描述")
	private String description;

	@Schema(description = "多规格：0.否；1.是")
	private String enableSpecs;

	@Schema(description = "租户id")
	private String tenantId;

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

	@Schema(description = "商品类目名称")
	@TableField(exist = false)
	private String categoryName;

	@Schema(description = "商品sku")
	@TableField(exist = false)
	private List<GoodsSku> goodsSkus;

	@Schema(description = "商品规格")
	@TableField(exist = false)
	private List<GoodsSpuSpecs> goodsSpuSpecs;

	@TableField(exist = false)
	private String collectId;

	@Schema(description = "总库存 sku库存累计")
	private Integer stock;

	@Schema(description = "运费类型：0.包邮；1.固定运费")
	private String freightType;

	@Schema(description = "固定运费金额，仅当运费类型为1时生效")
	private BigDecimal fixedFreightPrice;

	@Schema(description = "商品销售价 sku最低销售价")
	private BigDecimal salesPrice;

	@Schema(description = "商品原价  sku最低原价")
	private BigDecimal originalPrice;

	@Schema(description = "商品成本价 sku最低成本价")
	private BigDecimal costPrice;

}
