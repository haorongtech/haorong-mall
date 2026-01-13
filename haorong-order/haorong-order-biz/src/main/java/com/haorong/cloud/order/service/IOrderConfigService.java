/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.order.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.haorong.cloud.order.api.entity.OrderConfig;

/**
 * 订单配置
 *
 * @author haorong
 * @date 2025/5/27
 */
public interface IOrderConfigService extends IService<OrderConfig> {

	boolean saveConfig(OrderConfig orderConfig);

	boolean updateConfigById(OrderConfig orderConfig);

	OrderConfig getConfig();

	boolean removeConfigById(String id);

}
