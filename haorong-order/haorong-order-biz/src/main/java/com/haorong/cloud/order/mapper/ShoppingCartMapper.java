/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.order.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.haorong.cloud.order.api.entity.ShoppingCart;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * 购物车
 *
 * @author haorong
 * @since 2022/3/17 14:44
 */
@Mapper
public interface ShoppingCartMapper extends BaseMapper<ShoppingCart> {

	/**
	 * 购物车列表
	 *
	 * @author haorong
	 * @date 2022/5/31
	 * @param shoppingCart
	 * @return: com.baomidou.mybatisplus.core.metadata.IPage<com.haorong.cloud.mall.common.entity.ShoppingCart>
	 */
	IPage<ShoppingCart> selectApiPage(Page page, @Param("query") ShoppingCart shoppingCart);

}
