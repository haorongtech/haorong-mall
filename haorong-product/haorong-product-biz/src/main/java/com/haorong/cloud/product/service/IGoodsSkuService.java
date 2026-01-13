/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.haorong.cloud.product.api.dto.GoodsSkuStockReqDTO;
import com.haorong.cloud.product.api.entity.GoodsSku;

import java.util.List;

/**
 * 商品sku
 *
 * @author haorong
 * @since 2022/2/26 16:32
 */
public interface IGoodsSkuService extends IService<GoodsSku> {

	List<GoodsSku> getListByIds(List<String> ids);

	/**
	 * 回滚库存
	 * @param goodsSkuStockRqDTOList
	 * @return
	 */
	void rollbackStockList(List<GoodsSkuStockReqDTO> goodsSkuStockRqDTOList);

	/**
	 * 扣减库存
	 * @param goodsSkuStockRqDTO
	 * @return boolean true false
	 */
	Boolean reduceStock(List<GoodsSkuStockReqDTO> goodsSkuStockRqDTO);

	/**
	 * 批量查询sku附带规格信息
	 * @param ids
	 * @return
	 */
	List<GoodsSku> getSkuByIds(List<String> ids);

}
