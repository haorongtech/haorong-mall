/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.haorong.cloud.product.api.entity.GoodsSpuSpecs;

import java.util.List;

/**
 * 商品关联规格
 *
 * @author haorong
 * @since 2022/2/26 16:32
 */
public interface IGoodsSpuSpecsService extends IService<GoodsSpuSpecs> {

	/**
	 * 通过SpuId查询关联规格
	 *
	 * @author haorong
	 * @date 2022/6/6
	 * @param goodsSpuSpecs
	 * @return: java.util.List<com.haorong.cloud.mall.common.entity.GoodsSpuSpecs>
	 */
	List<GoodsSpuSpecs> getList(GoodsSpuSpecs goodsSpuSpecs);

}
