/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.product.dubbo;

import com.haorong.cloud.product.api.entity.GoodsAppraise;
import com.haorong.cloud.product.api.remote.RemoteGoodsAppraiseService;
import com.haorong.cloud.product.service.IGoodsAppraiseService;
import lombok.RequiredArgsConstructor;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author lijia
 * @description
 * @date 2024/11/22
 */
@Service
@DubboService
@RequiredArgsConstructor
public class RemoteGoodsAppraiseServiceImpl implements RemoteGoodsAppraiseService {

	private final IGoodsAppraiseService goodsAppraiseService;

	@Override
	public boolean addGoodsAppraise(List<GoodsAppraise> goodsAppraiseList) {
		return goodsAppraiseService.add(goodsAppraiseList);
	}

}
