/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.product.dubbo;

import com.haorong.cloud.product.api.dto.GoodsSpuSalesVolumeReqDTO;
import com.haorong.cloud.product.api.entity.GoodsSpu;
import com.haorong.cloud.product.api.remote.RemoteGoodsSpuService;
import com.haorong.cloud.product.service.IGoodsSpuService;
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
public class RemoteGoodsSpuServiceImpl implements RemoteGoodsSpuService {

	private final IGoodsSpuService goodsSpuService;

	@Override
	public boolean updateSalesVolume(List<GoodsSpuSalesVolumeReqDTO> list) {
		list.forEach(v -> goodsSpuService.updateSalesVolume(v.getSpuId(), v.getSalesVolume()));
		return true;
	}

	@Override
	public GoodsSpu getBySpuId(String id) {
		return goodsSpuService.getApiSpuById(id);
	}

	@Override
	public List<GoodsSpu> getBySpuIds(List<String> ids) {
		return goodsSpuService.listByIds(ids);
	}

}
