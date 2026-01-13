/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.pay.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.haorong.cloud.pay.api.entity.PayRefundOrder;
import org.apache.ibatis.annotations.Mapper;

/**
 * 退款订单
 *
 * @author haorong
 * @date 2022/6/16
 */
@Mapper
public interface PayRefundOrderMapper extends BaseMapper<PayRefundOrder> {

}
