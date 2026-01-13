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
import com.haorong.cloud.product.api.entity.GoodsAppraise;
import com.haorong.cloud.product.api.vo.AppraiseCountVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * 商品评价
 *
 * @author haorong
 * @since 2022/3/10 17:09
 */
@Mapper
public interface GoodsAppraiseMapper extends BaseMapper<GoodsAppraise> {

	/**
	 * 评论数量查询
	 * @param goodsAppraise
	 * @return
	 */
	AppraiseCountVO selectGoodsAppraiseCount(@Param("query") GoodsAppraise goodsAppraise);

	IPage<GoodsAppraise> selectAppraisePage(Page page, @Param("query") GoodsAppraise goodsAppraise);

}
