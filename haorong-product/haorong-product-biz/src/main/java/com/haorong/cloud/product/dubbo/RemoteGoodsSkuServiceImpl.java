/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.product.dubbo;

import com.haorong.cloud.product.api.dto.GoodsSkuStockReqDTO;
import com.haorong.cloud.product.api.entity.GoodsSku;
import com.haorong.cloud.product.api.entity.GoodsSkuSpecsValue;
import com.haorong.cloud.product.api.remote.RemoteGoodsSkuService;
import com.haorong.cloud.product.service.IGoodsSkuService;
import com.haorong.cloud.product.service.IGoodsSkuSpecsValueService;
import lombok.RequiredArgsConstructor;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author lijia
 * @description
 * @date 2024/11/22
 */
@Service
@DubboService
@RequiredArgsConstructor
public class RemoteGoodsSkuServiceImpl implements RemoteGoodsSkuService {

	private final IGoodsSkuService goodsSkuService;

	private final IGoodsSkuSpecsValueService goodsSkuSpecsValueService;

	@Override
	public void rollbackStock(List<GoodsSkuStockReqDTO> goodsSkuStockReqDTOList) {
		goodsSkuService.rollbackStockList(goodsSkuStockReqDTOList);
	}

	@Override
	public boolean reduceStock(List<GoodsSkuStockReqDTO> goodsSkuStockReqDTO) {
		return goodsSkuService.reduceStock(goodsSkuStockReqDTO);
	}

	@Override
	public List<GoodsSku> getBySkuIds(List<String> ids) {
		return goodsSkuService.getListByIds(ids);
	}

	@Override
	public List<GoodsSkuSpecsValue> selectGoodsSkuSpecsValueList(String skuId) {
		return goodsSkuSpecsValueService.getBySkuId(skuId);
	}

	@Override
	public List<GoodsSku> getSkuByIds(List<String> ids) {
		return goodsSkuService.getSkuByIds(ids);
	}

}
