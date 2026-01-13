/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.order.api.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.haorong.cloud.product.api.entity.GoodsSku;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * 购物车
 *
 * @author haorong
 * @since 2022/3/17 10:52
 */
@Data
@Schema(description = "购物车")
@EqualsAndHashCode(callSuper = true)
@TableName(value = "shopping_cart")
public class ShoppingCart extends Model<ShoppingCart> {

	@Schema(description = "主键")
	@TableId(type = IdType.ASSIGN_ID)
	private String id;

	@Schema(description = "用户主键")
	private String userId;

	@Schema(description = "spuId")
	private String spuId;

	@Schema(description = "skuId")
	private String skuId;

	@Schema(description = "加入数量")
	private Integer quantity;

	@Schema(description = "商品名称")
	private String spuName;

	@Schema(description = "销售价格（元）")
	private BigDecimal salesPrice;

	@Schema(description = "商品图")
	private String picUrl;

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

	@Schema(description = "规格信息")
	private String specsInfo;

	@TableField(exist = false)
	private GoodsSku goodsSku;

}
