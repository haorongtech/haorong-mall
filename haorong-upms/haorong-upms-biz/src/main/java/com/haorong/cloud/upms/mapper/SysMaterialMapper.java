/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.upms.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.haorong.cloud.upms.api.entity.SysMaterial;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * 素材
 *
 * @author haorong
 * @since 2022/2/22 15:02
 */
@Mapper
public interface SysMaterialMapper extends BaseMapper<SysMaterial> {

	/**
	 * 分页查询
	 * @param page
	 * @param material
	 * @return
	 */
	IPage<SysMaterial> selectMaterialPage(Page page, @Param("query") SysMaterial material);

}
