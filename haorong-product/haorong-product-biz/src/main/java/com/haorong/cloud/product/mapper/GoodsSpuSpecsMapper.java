/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.product.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.haorong.cloud.product.api.entity.GoodsSpuSpecs;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 商品关联规格
 *
 * @author haorong
 * @since 2022/2/26 16:32
 */
@Mapper
public interface GoodsSpuSpecsMapper extends BaseMapper<GoodsSpuSpecs> {

	List<GoodsSpuSpecs> selectBySpuId(@Param("spuId") String spuId);

	/**
	 * 通过SpuId查询关联规格
	 *
	 * @author haorong
	 * @date 2022/6/6
	 * @param goodsSpuSpecs
	 * @return: java.util.List<com.haorong.cloud.mall.common.entity.GoodsSpuSpecs>
	 */
	List<GoodsSpuSpecs> selectListBySpuId(@Param("query") GoodsSpuSpecs goodsSpuSpecs);

	/**
	 * 通过SpuId查询关联规格
	 * @param spuId
	 * @return
	 */
	List<GoodsSpuSpecs> selectListBySpuId2(@Param("spuId") String spuId);

}
