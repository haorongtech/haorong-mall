/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.product.service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.haorong.cloud.product.api.entity.GoodsFootprint;
import com.haorong.cloud.product.api.vo.GoodsFootprintVO;

/**
 * 用户足迹
 *
 * @author haorong
 * @since 2022/2/22 15:03
 */
public interface IGoodsFootprintService extends IService<GoodsFootprint> {

	/**
	 * 用户足迹列表
	 * @param: page lambdaQuery
	 * @return: IPage<GoodsFootprintVO>
	 * @author Administrator
	 * @date: 2022/3/19 22:50
	 */
	IPage<GoodsFootprintVO> apiPage(Page page, LambdaQueryWrapper<GoodsFootprint> lambdaQuery);

}
