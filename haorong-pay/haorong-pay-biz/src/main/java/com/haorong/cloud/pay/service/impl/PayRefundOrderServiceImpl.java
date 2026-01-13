/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.pay.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.haorong.cloud.pay.api.entity.PayRefundOrder;
import com.haorong.cloud.pay.mapper.PayRefundOrderMapper;
import com.haorong.cloud.pay.service.IPayRefundOrderService;
import org.springframework.stereotype.Service;

@Service
public class PayRefundOrderServiceImpl extends ServiceImpl<PayRefundOrderMapper, PayRefundOrder>
		implements IPayRefundOrderService {

}
