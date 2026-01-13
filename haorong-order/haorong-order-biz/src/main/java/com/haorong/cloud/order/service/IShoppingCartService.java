/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.order.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.haorong.cloud.order.api.entity.ShoppingCart;

import java.util.List;

/**
 * 购物车
 *
 * @author haorong
 * @since 2022/3/17 14:56
 */
public interface IShoppingCartService extends IService<ShoppingCart> {

	/**
	 * 购物车列表
	 *
	 * @author haorong
	 * @date 2022/5/31
	 * @param shoppingCart
	 * @return: com.baomidou.mybatisplus.core.metadata.IPage<com.haorong.cloud.mall.common.entity.ShoppingCart>
	 */
	List<ShoppingCart> apiPage(Page page, ShoppingCart shoppingCart);

	/**
	 * 保存
	 *
	 * @author haorong
	 * @date 2022/5/31
	 * @param shoppingCart
	 * @return: boolean
	 */
	boolean saveShoppingCart(ShoppingCart shoppingCart);

	/**
	 * 删除购物车
	 * @param userId 用户id
	 * @param spuIds 商品id列表
	 * @return
	 */
	boolean clear(String userId, List<String> spuIds);

	/**
	 * 更新购物车
	 * @param shoppingCart 购物车
	 * @return
	 */
	boolean updateShoppingCartById(ShoppingCart shoppingCart);

}
