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
import com.haorong.cloud.product.api.entity.GoodsFootprint;
import com.haorong.cloud.product.api.vo.GoodsFootprintVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * 用户足迹
 *
 * @author haorong
 * @since 2022/2/26 16:32
 */
@Mapper
public interface GoodsFootprintMapper extends BaseMapper<GoodsFootprint> {

	/**
	 * 用户足迹列表
	 * @param: page entity
	 * @return: IPage<GoodsFootprintVO>
	 * @author Administrator
	 * @date: 2022/3/19 22:51
	 */
	IPage<GoodsFootprintVO> apiPage(Page page, @Param("query") GoodsFootprint entity);

}
