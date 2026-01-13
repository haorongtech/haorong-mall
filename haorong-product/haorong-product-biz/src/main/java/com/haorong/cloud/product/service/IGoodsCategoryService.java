/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.product.service;

import cn.hutool.core.lang.tree.Tree;
import com.baomidou.mybatisplus.extension.service.IService;
import com.haorong.cloud.product.api.entity.GoodsCategory;

import java.util.List;

/**
 * 商品类目
 *
 * @author haorong
 * @since 2022/2/26 16:32
 */
public interface IGoodsCategoryService extends IService<GoodsCategory> {

	/**
	 * 商品类目树形结构
	 *
	 * @author haorong
	 * @date 2022/6/16
	 * @return: java.util.List<cn.hutool.core.lang.tree.Tree<java.lang.String>>
	 */
	List<Tree<String>> getGoodsCategoryTreeList();

}
