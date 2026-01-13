/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.user.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.haorong.cloud.user.api.entity.UserInfo;
import com.haorong.cloud.user.api.vo.UserInfoVO;
import com.haorong.cloud.user.api.vo.UserRespVO;
import com.haorong.cloud.user.api.vo.UserStatisticsVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.io.Serializable;
import java.util.List;

/**
 * 商城用户
 *
 * @author haorong
 * @since 2022/2/26 16:32
 */
@Mapper
public interface UserInfoMapper extends BaseMapper<UserInfo> {

	/**
	 * 分页查询商城用户列表
	 * @param page
	 * @param userInfo
	 * @author haorong
	 * @date 2022/7/12
	 * @return: com.baomidou.mybatisplus.core.metadata.IPage<com.haorong.cloud.mall.common.entity.UserInfo>
	 */
	IPage<UserRespVO> selectAdminPage(Page page, @Param("query") UserInfo userInfo);

	UserInfoVO selectUserById(Serializable id);

	List<UserStatisticsVO> sourceStatistics(@Param("query") UserInfo userInfo);

}
