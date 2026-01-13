/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.pay.api.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;

@Data
public class CreateOrderReqDTO implements Serializable {

	@Serial
	private static final long serialVersionUID = 1L;

	@Schema(description = "商户订单号")
	private String outTradeNo;

	@Schema(description = "订单总金额 单位为元，精确到小数点后两位，取值范围为 [0.01,100000000]。金额不能为0。")
	private String totalAmount;

	@Schema(description = "订单标题。注意：不可使用特殊字符，如 /，=，& 等。")
	private String subject;

	@Schema(description = "通知地址")
	private String notifyUrl;

	@Schema(description = "支付类型")
	private String tradeType;

	@Schema(description = "同步跳转地址，仅支持http/https")
	private String returnUrl;

	@Schema(description = "用户付款中途退出返回商户网站的地址")
	private String quitUrl;

	@Schema(description = "买家用户ID")
	private String buyerId;

	@Schema(description = "额外参数")
	private String extra;

	@Schema(description = "用户ID")
	private String userId;

}
