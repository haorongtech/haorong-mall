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
import com.haorong.cloud.upms.api.entity.SysMaterialGroup;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 素材分组
 *
 * @author haorong
 * @since 2022/2/22 15:27
 */
@Mapper
public interface SysMaterialGroupMapper extends BaseMapper<SysMaterialGroup> {

	/**
	 * 分页查询
	 * @param page
	 * @param sysMaterialGroup
	 * @return
	 */
	IPage<SysMaterialGroup> selectMaterialGroupPage(Page page, @Param("query") SysMaterialGroup sysMaterialGroup);

	/**
	 * 查询全部
	 * @param sysMaterialGroup
	 * @return
	 */
	List<SysMaterialGroup> selectMaterialGroupList(@Param("query") SysMaterialGroup sysMaterialGroup);

}
