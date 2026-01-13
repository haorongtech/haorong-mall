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
import com.haorong.cloud.order.api.dto.OrderInfoDTO;
import com.haorong.cloud.order.api.dto.OrderStatisticsDTO;
import com.haorong.cloud.order.api.entity.OrderInfo;
import com.haorong.cloud.order.api.vo.OrderStatisticsVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

/**
 * 订单
 *
 * @author haorong
 * @since 2022/2/26 16:32
 */
@Mapper
public interface OrderInfoMapper extends BaseMapper<OrderInfo> {

	/**
	 * 分页查询订单列表
	 * @param page
	 * @param orderInfo
	 * @author haorong
	 * @date 2022/6/11
	 * @return: com.baomidou.mybatisplus.core.metadata.IPage<com.haorong.cloud.mall.common.entity.OrderInfo>
	 */
	IPage<OrderInfo> selectAdminPage(Page page, @Param("query") OrderInfo orderInfo);

	/**
	 * 订单详情
	 * @param id
	 * @author haorong
	 * @date 2022/6/11
	 * @return: com.haorong.cloud.mall.common.entity.OrderInfo
	 */
	OrderInfo selectOrderById(Serializable id);

	/**
	 * 支付金额统计
	 * @param orderInfoDTO
	 * @return
	 */
	BigDecimal selectPaySumStatistics(@Param("query") OrderInfoDTO orderInfoDTO);

	/**
	 * 订单列表
	 * @param page
	 * @param orderInfo
	 * @author haorong
	 * @date 2022/6/11
	 * @return: com.baomidou.mybatisplus.core.metadata.IPage<com.haorong.cloud.mall.common.entity.OrderInfo>
	 */
	IPage<OrderInfo> selectApiPage(Page page, @Param("query") OrderInfo orderInfo);

	/**
	 * 支付金额查询
	 * @param request
	 * @return
	 */
	BigDecimal selectPayAmount(@Param("query") OrderStatisticsDTO request);

	/**
	 * 支付数量查询
	 * @param request
	 * @return
	 */
	Integer selectPayCount(@Param("query") OrderStatisticsDTO request);

	List<OrderStatisticsVO> payTypeStatistics(@Param("query") OrderStatisticsDTO orderStatisticsDTO);

	List<OrderStatisticsVO> channelTypeStatistics(@Param("query") OrderStatisticsDTO orderStatisticsDTO);

}
