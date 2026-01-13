/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.order.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.haorong.cloud.order.api.entity.OrderConfig;
import org.apache.ibatis.annotations.Mapper;

/**
 * 订单配置
 *
 * @author haorong
 * @date 2025/5/27
 */
@Mapper
public interface OrderConfigMapper extends BaseMapper<OrderConfig> {

}
