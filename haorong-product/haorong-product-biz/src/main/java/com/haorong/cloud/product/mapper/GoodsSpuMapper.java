/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.product.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.haorong.cloud.product.api.entity.GoodsSpu;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.io.Serializable;

/**
 * 商品spu
 *
 * @author haorong
 * @since 2022/2/22 14:31
 */
@Mapper
public interface GoodsSpuMapper extends BaseMapper<GoodsSpu> {

	/**
	 * 分页查询商品
	 *
	 * @author haorong
	 * @date 2022/6/15
	 * @param page
	 * @param goodsSpu
	 * @return: com.baomidou.mybatisplus.core.metadata.IPage<com.haorong.cloud.mall.common.entity.GoodsSpu>
	 */
	IPage<GoodsSpu> selectPageByAdmin(Page page, @Param("query") GoodsSpu goodsSpu);

	/**
	 * 分页查询商品库列表
	 *
	 * @author haorong
	 * @date 2022/6/15
	 * @param page
	 * @param goodsSpu
	 * @return: com.baomidou.mybatisplus.core.metadata.IPage<com.haorong.cloud.mall.common.entity.GoodsSpu>
	 */
	IPage<GoodsSpu> selectPageWarehouse(Page page, @Param("query") GoodsSpu goodsSpu);

	/**
	 * 商品详情
	 *
	 * @author haorong
	 * @date 2022/6/15
	 * @param id
	 * @return: com.haorong.cloud.mall.common.entity.GoodsSpu
	 */
	GoodsSpu selectSpuById(Serializable id);

	/**
	 * 分页查询商品列表
	 *
	 * @author haorong
	 * @date 2022/6/6
	 * @param page
	 * @param goodsSpu
	 * @return: com.baomidou.mybatisplus.core.metadata.IPage<com.haorong.cloud.mall.common.entity.GoodsSpu>
	 */
	IPage<GoodsSpu> selectApiPage(Page page, @Param("query") GoodsSpu goodsSpu);

	/**
	 * 购物车查询商品
	 *
	 * @author haorong
	 * @date 2022/6/6
	 * @param id
	 * @return: com.haorong.cloud.mall.common.entity.GoodsSpu
	 */
	GoodsSpu selectSpuByShoppingCart(Serializable id);

	/**
	 * 商品详情
	 *
	 * @author haorong
	 * @date 2022/6/6
	 * @param id
	 * @return: com.haorong.cloud.mall.common.entity.GoodsSpu
	 */
	GoodsSpu selectApiSpuById(Serializable id);

}
