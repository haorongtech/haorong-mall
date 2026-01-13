/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.product.service.impl;

import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.haorong.cloud.common.core.constant.CommonConstants;
import com.haorong.cloud.common.core.enums.MallErrorCodeEnum;
import com.haorong.cloud.common.security.entity.HxUser;
import com.haorong.cloud.common.security.handler.HxBusinessException;
import com.haorong.cloud.common.security.util.SecurityUtils;
import com.haorong.cloud.product.api.entity.*;
import com.haorong.cloud.product.mapper.*;
import com.haorong.cloud.product.service.IGoodsSpuService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.*;

/**
 * 商品spu
 *
 * @author haorong
 * @since 2022/2/22 15:27
 */
@Service
@RequiredArgsConstructor
public class GoodsSpuServiceImpl extends ServiceImpl<GoodsSpuMapper, GoodsSpu> implements IGoodsSpuService {

	private final GoodsSkuMapper goodsSkuMapper;

	private final GoodsSpuSpecsMapper goodsSpuSpecsMapper;

	private final GoodsSkuSpecsValueMapper goodsSkuSpecsValueMapper;

	private final GoodsCollectMapper goodsCollectMapper;

	private final GoodsFootprintMapper goodsFootprintMapper;

	private final GoodsCategoryMapper goodsCategoryMapper;

	@Override
	public IPage<GoodsSpu> adminPage(Page page, GoodsSpu goodsSpu) {
		return baseMapper.selectPageByAdmin(page, goodsSpu);
	}

	@Override
	public IPage<GoodsSpu> warehousePage(Page page, GoodsSpu goodsSpu) {
		return baseMapper.selectPageWarehouse(page, goodsSpu);
	}

	@Override
	public GoodsSpu getSpuById(String id) {
		GoodsSpu goodsSpu = baseMapper.selectSpuById(id);
		if (Objects.nonNull(goodsSpu)) {
			// 查询分类
			GoodsCategory firstCategory = goodsCategoryMapper.selectById(goodsSpu.getCategoryFirstId());
			GoodsCategory secondCategory = goodsCategoryMapper.selectById(goodsSpu.getCategorySecondId());
			StringBuilder categoryName = new StringBuilder();
			if (Objects.nonNull(firstCategory)) {
				categoryName.append(firstCategory.getName());
			}
			if (Objects.nonNull(secondCategory)) {
				categoryName.append("/").append(secondCategory.getName());
			}
			goodsSpu.setCategoryName(categoryName.toString());
		}
		return goodsSpu;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public boolean updateGoods(GoodsSpu goodsSpu) {

		List<GoodsSku> goodsSkuList = goodsSpu.getGoodsSkus();
		// 获取sku最低销售价
		goodsSpu.setSalesPrice(
				goodsSkuList.stream().min(Comparator.comparing(GoodsSku::getSalesPrice)).get().getSalesPrice());
		// 获取sku最低原价
		goodsSpu.setOriginalPrice(
				goodsSkuList.stream().min(Comparator.comparing(GoodsSku::getOriginalPrice)).get().getSalesPrice());
		// 获取sku最低成本价
		goodsSpu.setCostPrice(
				goodsSkuList.stream().min(Comparator.comparing(GoodsSku::getCostPrice)).get().getSalesPrice());
		// 累加sku库存
		goodsSpu.setStock(goodsSkuList.stream().mapToInt(GoodsSku::getStock).sum());
		List<String> notDelSkuIds = new ArrayList<>();
		// 保存sku
		goodsSkuList.forEach(goodsSku -> {
			goodsSku.setSpuId(goodsSpu.getId());
			if (StringUtils.hasText(goodsSku.getId())) {
				goodsSkuMapper.updateById(goodsSku);
			}
			else {
				goodsSkuMapper.insert(goodsSku);
			}
			notDelSkuIds.add(goodsSku.getId());
		});
		// sku处理
		goodsSkuMapper.delete(Wrappers.<GoodsSku>lambdaQuery()
			.eq(GoodsSku::getSpuId, goodsSpu.getId())
			.notIn(!CollectionUtils.isEmpty(notDelSkuIds), GoodsSku::getId, notDelSkuIds.toArray()));

		// 删除多规格
		goodsSpuSpecsMapper.delete(Wrappers.<GoodsSpuSpecs>lambdaQuery().eq(GoodsSpuSpecs::getSpuId, goodsSpu.getId()));
		goodsSkuSpecsValueMapper
			.delete(Wrappers.<GoodsSkuSpecsValue>lambdaQuery().eq(GoodsSkuSpecsValue::getSpuId, goodsSpu.getId()));
		// 多规格处理
		if (CommonConstants.YES.equals(goodsSpu.getEnableSpecs())) {
			this.addSpecs(goodsSpu);
		}
		super.updateById(goodsSpu);
		return Boolean.TRUE;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public boolean saveGoods(GoodsSpu goodsSpu) {
		List<GoodsSku> goodsSkuList = goodsSpu.getGoodsSkus();

		goodsSpu.setSalesPrice(
				goodsSkuList.stream().min(Comparator.comparing(GoodsSku::getSalesPrice)).get().getSalesPrice());

		goodsSpu.setOriginalPrice(
				goodsSkuList.stream().min(Comparator.comparing(GoodsSku::getOriginalPrice)).get().getSalesPrice());

		goodsSpu.setCostPrice(
				goodsSkuList.stream().min(Comparator.comparing(GoodsSku::getCostPrice)).get().getSalesPrice());

		goodsSpu.setStock(goodsSkuList.stream().mapToInt(GoodsSku::getStock).sum());
		super.save(goodsSpu);
		// 保存sku
		goodsSkuList.forEach(goodsSku -> {
			goodsSku.setId(null);
			goodsSku.setSpuId(goodsSpu.getId());
			goodsSkuMapper.insert(goodsSku);
		});
		// 多规格处理
		if (CommonConstants.YES.equals(goodsSpu.getEnableSpecs())) {
			this.addSpecs(goodsSpu);
		}

		return Boolean.TRUE;
	}

	private void addSpecs(GoodsSpu goodsSpu) {
		List<GoodsSpuSpecs> goodsSpuSpecsList = goodsSpu.getGoodsSpuSpecs();
		for (int i = 0; i < goodsSpuSpecsList.size(); i++) {
			GoodsSpuSpecs goodsSpuSpecs = goodsSpuSpecsList.get(i);
			if (ObjectUtil.isNotNull(goodsSpuSpecs)) {
				goodsSpuSpecs.setId(null);
				goodsSpuSpecs.setSort(i);
				goodsSpuSpecs.setSpuId(goodsSpu.getId());
				goodsSpuSpecsMapper.insert(goodsSpuSpecs);
			}
		}
		// 保存sku规格值
		List<GoodsSku> goodsSkus = goodsSpu.getGoodsSkus();
		goodsSkus.forEach(goodsSku -> {
			List<GoodsSkuSpecsValue> goodsSkuSpecsValues = goodsSku.getGoodsSkuSpecsValues();
			for (int j = 0; j < goodsSkuSpecsValues.size(); j++) {
				GoodsSkuSpecsValue goodsSkuSpecsValue = goodsSkuSpecsValues.get(j);
				if (ObjectUtil.isNotNull(goodsSkuSpecsValue)) {
					goodsSkuSpecsValue.setId(null);
					goodsSkuSpecsValue.setSort(j);
					goodsSkuSpecsValue.setSkuId(goodsSku.getId());
					goodsSkuSpecsValue.setSpuId(goodsSku.getSpuId());
					goodsSkuSpecsValueMapper.insert(goodsSkuSpecsValue);
				}
			}
		});
	}

	@Override
	public IPage<GoodsSpu> apiPage(Page page, GoodsSpu goodsSpu) {
		return baseMapper.selectApiPage(page, goodsSpu);
	}

	@Override
	public GoodsSpu getApiSpuById(String id) {
		GoodsSpu goodsSpu = baseMapper.selectApiSpuById(id);
		if (Objects.nonNull(goodsSpu)) {
			HxUser hxUser = SecurityUtils.getUser();
			if (Objects.nonNull(hxUser) && StringUtils.hasText(hxUser.getUserId())) {
				GoodsCollect goodsCollect = goodsCollectMapper.selectOne(Wrappers.<GoodsCollect>lambdaQuery()
					.eq(GoodsCollect::getSpuId, id)
					.eq(GoodsCollect::getUserId, hxUser.getUserId()));
				if (Objects.nonNull(goodsCollect)) {
					goodsSpu.setCollectId(goodsCollect.getId());
				}
				// 保存浏览记录
				GoodsFootprint goodsFootprint = new GoodsFootprint();
				goodsFootprint.setSpuId(id);
				goodsFootprint.setUserId(hxUser.getUserId());
				goodsFootprintMapper.insert(goodsFootprint);
			}

		}
		return goodsSpu;
	}

	@Override
	public boolean updateSalesVolume(String spuId, Integer buyQuantity) {
		return baseMapper.update(new GoodsSpu(),
				Wrappers.<GoodsSpu>lambdaUpdate()
					.eq(GoodsSpu::getId, spuId)
					.setSql(" sales_volume = sales_volume + " + buyQuantity)) > 0;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public boolean reduceStock(Map<String, Integer> result) {
		for (Map.Entry<String, Integer> entry : result.entrySet()) {
			String spuId = entry.getKey();
			int quantity = entry.getValue();
			if (baseMapper.update(new GoodsSpu(),
					Wrappers.<GoodsSpu>lambdaUpdate()
						.eq(GoodsSpu::getId, spuId)
						.ge(GoodsSpu::getStock, 0)
						.setSql(" stock = stock - " + quantity)) <= 0) {
				throw new HxBusinessException(MallErrorCodeEnum.ERROR_60008.getCode(),
						MallErrorCodeEnum.ERROR_60008.getMsg());
			}
		}
		return Boolean.TRUE;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public boolean rollbackStock(Map<String, Integer> result) {
		for (Map.Entry<String, Integer> entry : result.entrySet()) {
			String spuId = entry.getKey();
			int quantity = entry.getValue();
			if (baseMapper.update(new GoodsSpu(),
					Wrappers.<GoodsSpu>lambdaUpdate()
						.eq(GoodsSpu::getId, spuId)
						.ge(GoodsSpu::getStock, 0)
						.setSql(" stock = stock + " + quantity)) <= 0) {
				throw new HxBusinessException("回滚库存失败！");
			}
		}
		return Boolean.TRUE;
	}

}
