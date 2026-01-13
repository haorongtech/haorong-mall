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
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

/**
 * 商品sku
 *
 * @author haorong
 * @since 2022/2/22 14:28
 */
@Data
@Schema(description = "商品sku")
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName(value = "goods_sku", autoResultMap = true)
public class GoodsSku extends Model<GoodsSku> {

	@Schema(description = "主键")
	@TableId(type = IdType.ASSIGN_ID)
	private String id;

	@Schema(description = "spuId")
	private String spuId;

	@Schema(description = "销售价格（元）")
	private BigDecimal salesPrice;

	@Schema(description = "原价（元）")
	private BigDecimal originalPrice;

	@Schema(description = "成本价（元）")
	private BigDecimal costPrice;

	@Schema(description = "库存")
	private Integer stock;

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

	@Schema(description = "版本号")
	@Version
	private Integer version;

	@Schema(description = "sku规格值集合")
	@TableField(exist = false)
	private List<GoodsSkuSpecsValue> goodsSkuSpecsValues;

	@TableField(exist = false)
	private GoodsSpu goodsSpu;

	@Schema(description = "租户id")
	private String tenantId;

	@Schema(description = "状态")
	private String status;

}
