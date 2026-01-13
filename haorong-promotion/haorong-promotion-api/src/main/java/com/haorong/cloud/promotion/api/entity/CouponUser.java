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
import com.haorong.cloud.user.api.vo.UserInfoVO;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;

/**
 * 用户领券记录
 *
 * @author haorong
 * @date 2022/9/23
 */
@Data
@Schema(description = "用户领券记录")
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName(value = "coupon_user")
public class CouponUser extends Model<CouponUser> {

	@Schema(description = "主键")
	@TableId(type = IdType.ASSIGN_ID)
	private String id;

	@Schema(description = "优惠券id")
	private String couponId;

	@Schema(description = "用户id")
	private String userId;

	@Schema(description = "状态：0.未使用；1.已使用；2.已过期；3.冻结；")
	private String status;

	@Schema(description = "订单id")
	private String orderId;

	@Schema(description = "领取时间")
	private LocalDateTime receivedTime;

	@Schema(description = "有效日期")
	private LocalDateTime validatTime;

	@Schema(description = "使用时间")
	private LocalDateTime usedTime;

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

	@Schema(description = "优惠券名称")
	@TableField(exist = false)
	private String couponName;

	@TableField(exist = false)
	private CouponInfo couponInfo;

	@TableField(exist = false)
	private String[] spuIds;

	@TableField(exist = false)
	private UserInfoVO userInfoVO;

}
