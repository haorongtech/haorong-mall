/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.product.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.haorong.cloud.common.security.handler.HxBusinessException;
import com.haorong.cloud.product.api.entity.GoodsAppraise;
import com.haorong.cloud.product.api.vo.AppraiseCountVO;
import com.haorong.cloud.product.mapper.GoodsAppraiseMapper;
import com.haorong.cloud.product.service.IGoodsAppraiseService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;

/**
 * 商品评价
 *
 * @author haorong
 * @since 2022/3/7 14:18
 */
@Service
@RequiredArgsConstructor
public class GoodsAppraiseServiceImpl extends ServiceImpl<GoodsAppraiseMapper, GoodsAppraise>
		implements IGoodsAppraiseService {

	@Override
	@Transactional(rollbackFor = Exception.class)
	public boolean add(List<GoodsAppraise> listGoodsAppraise) {
		return this.saveBatch(listGoodsAppraise);
	}

	@Override
	public AppraiseCountVO getCount(GoodsAppraise goodsAppraise) {
		return baseMapper.selectGoodsAppraiseCount(goodsAppraise);
	}

	@Override
	public IPage<GoodsAppraise> getPage(Page page, GoodsAppraise goodsAppraise) {
		return baseMapper.selectAppraisePage(page, goodsAppraise);
	}

	@Override
	public boolean reply(GoodsAppraise goodsAppraise) {
		if (!StringUtils.hasText(goodsAppraise.getId())) {
			throw new HxBusinessException("id 不能为空");
		}
		if (!StringUtils.hasText(goodsAppraise.getBusinessReply())) {
			throw new HxBusinessException("回复内容不能为空");
		}
		GoodsAppraise target = this.getById(goodsAppraise.getId());
		if (Objects.isNull(target)) {
			throw new HxBusinessException("评价不存在");
		}
		target.setBusinessReply(goodsAppraise.getBusinessReply());
		target.setReplyTime(LocalDateTime.now());
		return this.updateById(target);
	}

}
