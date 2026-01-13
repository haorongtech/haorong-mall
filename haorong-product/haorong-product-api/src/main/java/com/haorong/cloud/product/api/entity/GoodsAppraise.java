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

import java.time.LocalDateTime;

/**
 * 商品评价
 *
 * @author haorong
 * @since 2022/3/10 17:06
 */
@Data
@Schema(description = "商品评价")
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName(value = "goods_appraise")
public class GoodsAppraise extends Model<GoodsAppraise> {

	@Schema(description = "主键")
	@TableId(type = IdType.ASSIGN_ID)
	private String id;

	@Schema(description = "spuId")
	private String spuId;

	@Schema(description = "订单主键")
	private String orderId;

	@Schema(description = "子订单主键")
	private String orderItemId;

	@Schema(description = "用户主键")
	private String userId;

	@Schema(description = "头像")
	private String avatarUrl;

	@Schema(description = "昵称")
	private String nickName;

	@Schema(description = "图片")
	@TableField(typeHandler = JsonArrayStringTypeHandler.class)
	private String[] picUrls;

	@Schema(description = "商品评分")
	private Integer goodsScore;

	@Schema(description = "物流评分")
	private Integer logisticsScore;

	@Schema(description = "服务评分")
	private Integer serviceScore;

	@Schema(description = "商家回复")
	private String businessReply;

	@Schema(description = "回复时间")
	private LocalDateTime replyTime;

	@Schema(description = "评论内容")
	private String content;

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

	@TableField(exist = false)
	private String spuName;

	@TableField(exist = false, typeHandler = JsonArrayStringTypeHandler.class)
	private String[] spuUrls;

}
