/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.product.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.haorong.cloud.product.api.entity.GoodsAppraise;
import com.haorong.cloud.product.api.vo.AppraiseCountVO;

import java.util.List;

/**
 * 商品评价
 *
 * @author haorong
 * @since 2022/2/26 16:36
 */
public interface IGoodsAppraiseService extends IService<GoodsAppraise> {

	/**
	 * 用户发表评论
	 * @param listGoodsAppraise
	 * @return
	 */
	boolean add(List<GoodsAppraise> listGoodsAppraise);

	/**
	 * 数量查询
	 * @param goodsAppraise
	 * @return
	 */
	AppraiseCountVO getCount(GoodsAppraise goodsAppraise);

	IPage<GoodsAppraise> getPage(Page page, GoodsAppraise goodsAppraise);

	/**
	 * 回复评价
	 * @param goodsAppraise
	 * @return
	 */
	boolean reply(GoodsAppraise goodsAppraise);

}
