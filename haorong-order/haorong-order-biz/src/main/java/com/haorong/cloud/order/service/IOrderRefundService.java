/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.order.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.haorong.cloud.order.api.entity.OrderRefund;

/**
 * 商城退款单
 *
 * @author haorong
 * @date 2022/5/31
 */
public interface IOrderRefundService extends IService<OrderRefund> {

	/**
	 * 商城退款单列表
	 * @param page
	 * @param orderRefund
	 * @author haorong
	 * @date 2022/5/31
	 * @return: com.baomidou.mybatisplus.core.metadata.IPage<com.haorong.cloud.mall.common.entity.OrderRefund>
	 */
	IPage<OrderRefund> adminPage(Page page, OrderRefund orderRefund);

	/**
	 * 退款单详情
	 * @param id
	 * @author haorong
	 * @date 2022/7/2
	 * @return: com.haorong.cloud.mall.common.entity.OrderRefund
	 */
	OrderRefund getRefundById(String id);

	/**
	 * 退款
	 * @param orderRefund
	 * @author haorong
	 * @date 2022/7/2
	 * @return: java.lang.Object
	 */
	boolean refund(OrderRefund orderRefund);

	/**
	 * 申请退款
	 * @param orderRefund
	 * @author haorong
	 * @date 2022/5/31
	 * @return: boolean
	 */
	OrderRefund saveRefund(OrderRefund orderRefund);

	/**
	 * 分页查询退单列表
	 * @param page
	 * @param orderRefund
	 * @author haorong
	 * @date 2022/7/2
	 * @return: com.baomidou.mybatisplus.core.metadata.IPage<com.haorong.cloud.mall.common.entity.OrderRefund>
	 */
	IPage<OrderRefund> getPage(Page page, OrderRefund orderRefund);

}
