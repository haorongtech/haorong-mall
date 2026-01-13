/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.product.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.haorong.cloud.product.api.entity.GoodsSkuSpecsValue;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 商品sku关联规格值
 *
 * @author haorong
 * @since 2022/2/26 16:32
 */
@Mapper
public interface GoodsSkuSpecsValueMapper extends BaseMapper<GoodsSkuSpecsValue> {

	/**
	 * 通过skuId查询关联规格值
	 *
	 * @author haorong
	 * @date 2022/6/16
	 * @param skuId
	 * @return: java.util.List<com.haorong.cloud.mall.common.entity.GoodsSkuSpecsValue>
	 */
	List<GoodsSkuSpecsValue> selectBySkuId(@Param("skuId") String skuId);

	/**
	 * 通过SpuId 和 规格ID查询所有sku下的规格值
	 *
	 * @author haorong
	 * @date 2022/6/6
	 * @param spuId
	 * @param specsId
	 * @return: java.util.List<com.haorong.cloud.mall.common.entity.GoodsSkuSpecsValue>
	 */
	List<GoodsSkuSpecsValue> selectGoodsSkuSpecsValues(@Param("spuId") String spuId, @Param("specsId") String specsId);

}
