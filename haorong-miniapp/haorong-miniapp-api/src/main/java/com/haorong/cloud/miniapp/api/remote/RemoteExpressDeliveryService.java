/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.miniapp.api.remote;

import cn.binarywang.wx.miniapp.bean.express.WxMaExpressDelivery;

import java.util.List;

/**
 * 微信小程序订单接口
 *
 * @author haorong
 * @date 2022/6/10
 */
public interface RemoteExpressDeliveryService {

	List<WxMaExpressDelivery> getDeliveryList(String appId);

}
