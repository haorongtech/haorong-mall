/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.promotion.api.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

/**
 * 优惠券
 *
 * @author haorong
 * @date 2022/9/23
 */
@Data
@Schema(description = "优惠券")
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName(value = "coupon_info")
public class CouponInfo extends Model<CouponInfo> {

	@Schema(description = "主键")
	@TableId(type = IdType.ASSIGN_ID)
	private String id;

	@Schema(description = "优惠券名称")
	@NotBlank(message = "优惠券名称为空")
	private String couponName;

	@Schema(description = "优惠券类型：1.满减券；2.折扣券；")
	@NotBlank(message = "优惠券类型为空")
	private String couponType;

	@Schema(description = "优惠金额（元）")
	private BigDecimal amount;

	@Schema(description = "折扣")
	private BigDecimal discount;

	@Schema(description = "使用门槛  0元表示无门槛")
	private BigDecimal threshold;

	@Schema(description = "发行数量")
	@NotNull(message = "发行数量不能为空")
	private Integer totalNum;

	@Schema(description = "剩余数量")
	private Integer remainNum;

	@Schema(description = "已发放券数量")
	private Integer assignCount;

	@Schema(description = "已使用数量")
	private Integer usedCount;

	@Schema(description = "领取限制 0表示无限制")
	private Integer receiveCount;

	@Schema(description = "有效开始时间")
	@NotNull(message = "有效开始时间为空")
	private LocalDateTime receiveStartedAt;

	@Schema(description = "有效结束时间")
	@NotNull(message = "有效结束时间为空")
	private LocalDateTime receiveEndedAt;

	@Schema(description = "可用范围：1.全部商品；2.指定商品；")
	@NotBlank(message = "可用范围为空")
	private String useRange;

	@Schema(description = "商品id")
	private String spuId;

	@Schema(description = "使用说明")
	private String useDescription;

	@Schema(description = "状态：0.正常；1.禁用；")
	@NotBlank(message = "状态为空")
	private String status;

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

	@Schema(description = "租户id")
	private String tenantId;

	@TableField(exist = false)
	private List<CouponGoods> couponGoodsList;

	/**
	 * 用户领取数量
	 */
	@TableField(exist = false)
	private Long userReceiveCount;

}
