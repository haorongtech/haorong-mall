/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.product.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.haorong.cloud.product.api.entity.GoodsSku;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 商品sku
 *
 * @author haorong
 * @since 2022/2/26 16:32
 */
@Mapper
public interface GoodsSkuMapper extends BaseMapper<GoodsSku> {

	/**
	 * 通过spuId查询
	 *
	 * @author haorong
	 * @date 2022/6/15
	 * @param spuId
	 * @return: java.util.List<com.haorong.cloud.mall.common.entity.GoodsSku>
	 */
	List<GoodsSku> selectBySpuId(@Param("spuId") String spuId);

	/**
	 * 批量查询sku附带spu信息
	 * @param ids
	 * @return
	 */
	List<GoodsSku> selectListByIds(@Param("ids") List<String> ids);

	/**
	 * 批量查询sku附带规格信息
	 * @param ids
	 * @return
	 */
	List<GoodsSku> selectSkuByIds(@Param("ids") List<String> ids);

}
