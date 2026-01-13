/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.order.api.dto;

import com.haorong.cloud.order.api.entity.OrderItemEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

/**
 * 商城订单DTO
 *
 * @author haorong
 * @date 2022/6/10
 */
@Data
@Schema(description = "商城订单DTO")
public class OrderInfoDTO {

	@Schema(description = "用户ID")
	private String userId;

	@Schema(description = "配送方式：1.普通快递；2.上门自提")
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

	@Schema(description = "订单状态：0.待付款；1.待发货；2.已完成")
	private String status;

	@Schema(description = "评价状态：0.待评价；1.已平价;")
	private String appraiseStatus;

	@Schema(description = "订单金额（元）")
	private BigDecimal salesPrice;

	@Schema(description = "订单总金额（元）")
	private BigDecimal totalPrice;

	@Schema(description = "运费（元）")
	private BigDecimal freightPrice;

	@Schema(description = "优惠券优惠金额（元）")
	private BigDecimal couponPrice;

	@Schema(description = "用户优惠券id")
	private String couponUserId;

	@Schema(description = "支付金额（总金额-优惠券优惠金额+运费 = 支付金额）")
	private BigDecimal paymentPrice;

	@Schema(description = "用户收货地址")
	private String userAddressId;

	@Schema(description = "子订单集合")
	private List<OrderItemEntity> orderItemList;

	@Schema(description = "订单创建方式：1.购物车下单；2.普通购买下单")
	private String createWay;

	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@Schema(description = "查询开始时间")
	private LocalDateTime beginTime;

	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@Schema(description = "查询结束时间")
	private LocalDateTime endTime;

}
