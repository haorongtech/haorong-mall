/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.order.api.constant;

/**
 * 商城订单常量
 *
 * @author haorong
 * @date 2022/6/8
 */
public class MallOrderConstants {

	/** 配送方式：1.普通快递；2.上门自提 */
	public static final String DELIVERY_WAY_1 = "1";

	public static final String DELIVERY_WAY_2 = "2";

	/** 支付类型：1.微信支付；2.支付宝支付; */
	public static final String PAYMENT_TYPE_0 = "0";

	public static final String PAYMENT_TYPE_1 = "1";

	public static final String PAYMENT_TYPE_2 = "2";

	/** 订单创建方式：1.购物车下单；2.普通购买下单 */
	public static final String ORDER_CREATE_WAY_1 = "1";

	/** 物流回调接口 */
	public static final String NOTIFY_LOGISTICS_URL = "/mall-order/notify/delivery?deliveryId=%s&tenantId=%s";

	/** 退货退款操作状态：2.拒绝；4.退款 */

	public static final String OPERATE_STATUS_REJECT = "2";

	public static final String OPERATE_STATUS_REFUND = "4";

}
