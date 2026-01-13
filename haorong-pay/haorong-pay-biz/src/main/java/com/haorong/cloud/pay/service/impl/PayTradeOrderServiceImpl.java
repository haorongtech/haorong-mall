/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.pay.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.haorong.cloud.pay.api.entity.PayTradeOrder;
import com.haorong.cloud.pay.mapper.PayTradeOrderMapper;
import com.haorong.cloud.pay.service.IPayTradeOrderService;
import org.springframework.stereotype.Service;

/**
 * 支付订单
 *
 * @author haorong
 * @date 2022/6/16
 */
@Service
public class PayTradeOrderServiceImpl extends ServiceImpl<PayTradeOrderMapper, PayTradeOrder>
		implements IPayTradeOrderService {

}
