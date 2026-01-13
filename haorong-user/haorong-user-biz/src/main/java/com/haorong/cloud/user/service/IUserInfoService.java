/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.user.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.haorong.cloud.user.api.entity.UserInfo;
import com.haorong.cloud.user.api.vo.UserRespVO;
import com.haorong.cloud.user.api.vo.UserStatisticsVO;

import java.util.List;

/**
 * 商城用户
 *
 * @author haorong
 * @since 2022/2/26 16:36
 */
public interface IUserInfoService extends IService<UserInfo> {

	/**
	 * 验证手机号是否存在
	 * @param phone 手机号
	 * @author haorong
	 * @date 2022/3/10 10:07
	 * @return: boolean
	 */
	boolean checkPhone(String phone);

	/**
	 * 分页查询商城用户列表
	 * @param page 分页对象
	 * @param userInfo 查询条件
	 * @author haorong
	 * @date 2022/7/12
	 * @return: com.baomidou.mybatisplus.core.metadata.IPage<com.haorong.cloud.mall.common.entity.UserInfo>
	 */
	IPage<UserRespVO> getPage(Page page, UserInfo userInfo);

	/**
	 * 根据用户ID获取用户信息
	 * @param id 用户ID
	 * @return
	 */
	UserRespVO getUserById(String id);

	/**
	 * 根据手机号和来源类型创建用户
	 * @param phone 手机号
	 * @param clientType 来源类型
	 * @return
	 */
	UserInfo createUser(String phone, String clientType);

	/**
	 * 新增用户
	 * @param userInfo
	 * @return
	 */
	boolean saveUser(UserInfo userInfo);

	/**
	 * 修改用户
	 * @param userInfo
	 * @return
	 */
	boolean updateUserById(UserInfo userInfo);

	List<UserStatisticsVO> sourceStatistics(UserInfo userInfo);

}
