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
import com.haorong.cloud.product.api.entity.GoodsCollect;
import com.haorong.cloud.product.api.vo.GoodsCollectVO;

import java.util.List;

public interface IGoodsCollectService extends IService<GoodsCollect> {

	/**
	 * 分页查询收藏
	 * @param page
	 * @param userCollect
	 * @return
	 */
	IPage<GoodsCollectVO> getPage(Page page, GoodsCollect userCollect);

	/**
	 * 保存收藏
	 * @param userCollect
	 * @return
	 */
	GoodsCollect saveCollect(GoodsCollect userCollect);

	/**
	 * 批量收藏
	 * @param goodsCollectList
	 * @return
	 */
	boolean saveBatchCollect(List<GoodsCollect> goodsCollectList);

}
