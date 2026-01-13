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
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

/**
 * 订单信息
 *
 * @author haorong
 * @since 2022/2/22 14:28
 */
@Data
@Schema(description = "订单信息")
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName(value = "order_info")
public class OrderInfo extends Model<OrderInfo> {

	@Schema(description = "主键")
	@TableId(type = IdType.ASSIGN_ID)
	private String id;

	@Schema(description = "用户主键")
	private String userId;

	@Schema(description = "配送方式：1.普通快递；2.上门自提；")
	private String deliveryWay;

	@Schema(description = "订单单号")
	private String orderNo;

	@Schema(description = "支付类型：1.微信支付；2.支付宝支付")
	private String paymentType;

	@Schema(description = "交易类型")
	private String tradeType;

	@Schema(description = "备注")
	private String remark;

	@Schema(description = "支付状态：0.未支付；1.已支付;")
	private String payStatus;

	@Schema(description = "订单状态")
	private String status;

	@Schema(description = "评价状态：0.待评价；1.已平价;")
	private String appraiseStatus;

	@Schema(description = "订单总金额（元）")
	private BigDecimal totalPrice;

	@Schema(description = "运费（元）")
	private BigDecimal freightPrice;

	@Schema(description = "优惠券优惠金额（元）")
	private BigDecimal couponPrice;

	@Schema(description = "支付金额（总金额-优惠券优惠金额+运费 = 支付金额）")
	private BigDecimal paymentPrice;

	@Schema(description = "付款时间")
	private LocalDateTime paymentTime;

	@Schema(description = "发货时间")
	private LocalDateTime deliverTime;

	@Schema(description = "取消时间")
	private LocalDateTime cancelTime;

	@Schema(description = "收货时间")
	private LocalDateTime receiverTime;

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

	@Schema(description = "微信支付单号")
	private String transactionId;

	@Schema(description = "用户优惠券id")
	private String couponUserId;

	@Schema(description = "租户id")
	private String tenantId;

	@Schema(description = "收货人姓名")
	private String recipientName;

	@Schema(description = "收货人电话")
	private String recipientPhone;

	@Schema(description = "省")
	private String recipientProvince;

	@Schema(description = "市")
	private String recipientCity;

	@Schema(description = "区/县")
	private String recipientArea;

	@Schema(description = "省编码")
	private String recipientProvinceCode;

	@Schema(description = "市编码")
	private String recipientCityCode;

	@Schema(description = "区/县编码")
	private String recipientAreaCode;

	@Schema(description = "详细地址")
	private String recipientAddress;

	@Schema(description = "应用ID")
	private String appId;

	@Schema(description = "openId")
	private String openId;

	@Schema(description = "子订单集合")
	@TableField(exist = false)
	private List<OrderItemEntity> orderItemList;

	@Schema(description = "搜索关键字")
	@TableField(exist = false)
	private String keyword;

	@Schema(description = "支付时间范围[开始时间,结束时间]")
	@TableField(exist = false)
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private LocalDateTime[] paymentQueryTimes;

	@Schema(description = "发货单")
	@TableField(exist = false)
	private OrderDelivery orderDelivery;

}
