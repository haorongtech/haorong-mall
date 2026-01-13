/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.order.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.haorong.cloud.order.api.dto.OrderStatisticsDTO;
import com.haorong.cloud.order.api.entity.OrderRefund;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 商城退款单
 *
 * @author haorong
 * @date 2022/5/31
 */
@Mapper
public interface OrderRefundMapper extends BaseMapper<OrderRefund> {

	/**
	 * 商城退款单列表
	 * @param page
	 * @param orderRefund
	 * @author haorong
	 * @date 2022/5/31
	 * @return: com.baomidou.mybatisplus.core.metadata.IPage<com.haorong.cloud.mall.common.entity.OrderRefund>
	 */
	IPage<OrderRefund> selectAdminPage(Page page, @Param("query") OrderRefund orderRefund);

	OrderRefund selectRefundById(Serializable id);

	/**
	 * 通过子订单ID查询退款单
	 * @param orderItemId
	 * @author haorong
	 * @date 2022/7/1
	 * @return: com.haorong.cloud.mall.common.entity.OrderRefund
	 */
	OrderRefund selectByOrderItemId(String orderItemId);

	/**
	 * 退款金额查询
	 * @param request
	 * @return
	 */
	BigDecimal selectRefundAmount(@Param("query") OrderStatisticsDTO request);

	/**
	 * 退款数量查询
	 * @param request
	 * @return
	 */
	Integer selectRefundCount(@Param("query") OrderStatisticsDTO request);

}
