/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.product.service.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.haorong.cloud.common.core.enums.MallErrorCodeEnum;
import com.haorong.cloud.common.security.handler.HxBusinessException;
import com.haorong.cloud.product.api.dto.GoodsSkuStockReqDTO;
import com.haorong.cloud.product.api.entity.GoodsSku;
import com.haorong.cloud.product.mapper.GoodsSkuMapper;
import com.haorong.cloud.product.service.IGoodsSkuService;
import com.haorong.cloud.product.service.IGoodsSpuService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 商品sku
 *
 * @author haorong
 * @since 2022/2/26 16:37
 */
@Service
@RequiredArgsConstructor
public class GoodsSkuServiceImpl extends ServiceImpl<GoodsSkuMapper, GoodsSku> implements IGoodsSkuService {

	private final IGoodsSpuService goodsSpuService;

	@Override
	public List<GoodsSku> getListByIds(List<String> ids) {
		return baseMapper.selectListByIds(ids);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public void rollbackStockList(List<GoodsSkuStockReqDTO> goodsSkuStockRqDTOList) {
		goodsSkuStockRqDTOList.forEach(goodsSkuStockRqDTO -> {
			baseMapper.update(new GoodsSku(),
					Wrappers.<GoodsSku>lambdaUpdate()
						.eq(GoodsSku::getId, goodsSkuStockRqDTO.getSkuId())
						.setSql(" stock = stock + " + goodsSkuStockRqDTO.getStockNum()));
		});
		Map<String, Integer> result = goodsSkuStockRqDTOList.stream()
			.collect(Collectors.toMap(GoodsSkuStockReqDTO::getSpuId, GoodsSkuStockReqDTO::getStockNum, Integer::sum)); // 如果遇到相同的key，则将count相加
		goodsSpuService.rollbackStock(result);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public Boolean reduceStock(List<GoodsSkuStockReqDTO> goodsSkuStockRqDTO) {
		for (GoodsSkuStockReqDTO goodsSkuStockReqDTO : goodsSkuStockRqDTO) {
			if (baseMapper.update(new GoodsSku(),
					Wrappers.<GoodsSku>lambdaUpdate()
						.eq(GoodsSku::getId, goodsSkuStockReqDTO.getSkuId())
						.gt(GoodsSku::getStock, 0)
						.setSql(" stock = stock - " + goodsSkuStockReqDTO.getStockNum())) <= 0) {
				throw new HxBusinessException(MallErrorCodeEnum.ERROR_60008.getCode(),
						MallErrorCodeEnum.ERROR_60008.getMsg());
			}
		}
		Map<String, Integer> result = goodsSkuStockRqDTO.stream()
			.collect(Collectors.toMap(GoodsSkuStockReqDTO::getSpuId, GoodsSkuStockReqDTO::getStockNum, Integer::sum)); // 如果遇到相同的key，则将count相加
		goodsSpuService.reduceStock(result);
		return Boolean.TRUE;
	}

	@Override
	public List<GoodsSku> getSkuByIds(List<String> ids) {
		return baseMapper.selectSkuByIds(ids);
	}

}
