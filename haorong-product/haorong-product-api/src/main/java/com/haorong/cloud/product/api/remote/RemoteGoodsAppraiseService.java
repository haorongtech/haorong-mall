/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.product.api.remote;

import com.haorong.cloud.product.api.entity.GoodsAppraise;

import java.util.List;

/**
 * @author haorong
 */
public interface RemoteGoodsAppraiseService {

	/**
	 * this is addGoodsAppraise method
	 * @param goodsAppraiseList
	 * @return
	 */
	boolean addGoodsAppraise(List<GoodsAppraise> goodsAppraiseList);

}
