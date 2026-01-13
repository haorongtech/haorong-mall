/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.order.service.impl;

import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.haorong.cloud.order.api.entity.ShoppingCart;
import com.haorong.cloud.order.mapper.ShoppingCartMapper;
import com.haorong.cloud.order.service.IShoppingCartService;
import com.haorong.cloud.product.api.entity.GoodsSku;
import com.haorong.cloud.product.api.remote.RemoteGoodsSkuService;
import lombok.RequiredArgsConstructor;
import org.apache.dubbo.config.annotation.DubboReference;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * 购物车
 *
 * @author haorong
 * @since 2022/3/17 14:51
 */
@Service
@RequiredArgsConstructor
public class ShoppingCartServiceImpl extends ServiceImpl<ShoppingCartMapper, ShoppingCart>
		implements IShoppingCartService {

	@DubboReference
	private final RemoteGoodsSkuService remoteGoodsSkuService;

	@Override
	public List<ShoppingCart> apiPage(Page page, ShoppingCart shoppingCart) {
		IPage<ShoppingCart> iPage = baseMapper.selectApiPage(page, shoppingCart);
		if (CollectionUtils.isEmpty(iPage.getRecords())) {
			return null;
		}
		// 从List中提取SKUID
		List<String> skuIds = iPage.getRecords()
			.stream()
			.map(ShoppingCart::getSkuId)
			.distinct() // 去重，如果有可能有重复的商品ID
			.toList();

		// 调用商品服务，获取商品详情
		List<GoodsSku> goodsSkuList = remoteGoodsSkuService.getSkuByIds(skuIds);
		if (CollectionUtils.isEmpty(goodsSkuList)) {
			throw new IllegalArgumentException("query goods sku list fail!");
		}

		// 创建商品SKU ID到商品对象的映射
		Map<String, GoodsSku> skuIdToGoodsSku = goodsSkuList.stream()
			.collect(Collectors.toMap(GoodsSku::getId, goodsSku -> goodsSku, (existing, replacement) -> existing)); // 解决key冲突的情况
		iPage.getRecords().forEach(s -> {
			s.setGoodsSku(skuIdToGoodsSku.get(s.getSkuId()));
		});
		return iPage.getRecords();
	}

	@Override
	public boolean saveShoppingCart(ShoppingCart shoppingCart) {
		ShoppingCart target = baseMapper.selectOne(Wrappers.<ShoppingCart>lambdaQuery()
			.eq(ShoppingCart::getUserId, shoppingCart.getUserId())
			.eq(ShoppingCart::getSpuId, shoppingCart.getSpuId())
			.eq(ShoppingCart::getSkuId, shoppingCart.getSkuId()));
		if (ObjectUtil.isNotNull(target)) {
			target.setQuantity(target.getQuantity() + shoppingCart.getQuantity());
			super.updateById(target);
		}
		else {
			super.save(shoppingCart);
		}
		return Boolean.TRUE;
	}

	@Override
	public boolean clear(String userId, List<String> spuIds) {
		return baseMapper.delete(Wrappers.<ShoppingCart>lambdaQuery()
			.in(ShoppingCart::getSpuId, spuIds)
			.eq(ShoppingCart::getUserId, userId)) > 0;
	}

	@Override
	public boolean updateShoppingCartById(ShoppingCart shoppingCart) {
		ShoppingCart existCart = baseMapper.selectOne(Wrappers.<ShoppingCart>lambdaQuery()
			.eq(ShoppingCart::getUserId, shoppingCart.getUserId())
			.eq(ShoppingCart::getSpuId, shoppingCart.getSpuId())
			.eq(ShoppingCart::getSkuId, shoppingCart.getSkuId())
			.ne(ShoppingCart::getId, shoppingCart.getId()));
		if (Objects.nonNull(existCart)) {
			shoppingCart.setQuantity(existCart.getQuantity() + shoppingCart.getQuantity());
			baseMapper.deleteById(existCart.getId());
		}
		return baseMapper.updateById(shoppingCart) > 0;
	}

}
