/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.haorong.cloud.product.api.entity.GoodsSkuSpecsValue;

import java.util.List;

/**
 * 商品sku关联规格值
 *
 * @author haorong
 * @since 2022/2/26 16:32
 */
public interface IGoodsSkuSpecsValueService extends IService<GoodsSkuSpecsValue> {

	List<GoodsSkuSpecsValue> getBySkuId(String skuId);

}
