/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.product.api.remote;

import com.haorong.cloud.product.api.dto.GoodsSkuStockReqDTO;
import com.haorong.cloud.product.api.entity.GoodsSku;
import com.haorong.cloud.product.api.entity.GoodsSkuSpecsValue;

import java.util.List;

/**
 * @author haorong
 */
public interface RemoteGoodsSkuService {

	/**
	 * 批量回滚库存
	 * @param goodsSkuStockReqDTOList
	 * @return void
	 */
	void rollbackStock(List<GoodsSkuStockReqDTO> goodsSkuStockReqDTOList);

	/**
	 * 扣减库存
	 * @param goodsSkuStockReqDTO
	 * @return Boolean
	 */

	boolean reduceStock(List<GoodsSkuStockReqDTO> goodsSkuStockReqDTO);

	/**
	 * 通过id批量查询
	 * @param ids
	 * @return
	 */
	List<GoodsSku> getBySkuIds(List<String> ids);

	/**
	 * 通过skuId查询规格值
	 * @param skuId
	 * @return
	 */

	List<GoodsSkuSpecsValue> selectGoodsSkuSpecsValueList(String skuId);

	/**
	 * 通过id批量查询SKU 附带规格信息
	 * @param ids
	 * @return
	 */
	List<GoodsSku> getSkuByIds(List<String> ids);

}
