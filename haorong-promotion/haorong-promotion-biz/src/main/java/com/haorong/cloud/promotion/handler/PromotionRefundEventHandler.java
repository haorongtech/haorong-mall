/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.promotion.handler;

import com.haorong.cloud.common.core.entity.OrderRefundSuccessEvent;

public interface PromotionRefundEventHandler {

	void handle(OrderRefundSuccessEvent event);

}
