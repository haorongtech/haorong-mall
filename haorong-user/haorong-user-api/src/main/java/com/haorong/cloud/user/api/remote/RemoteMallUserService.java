/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.user.api.remote;

import com.haorong.cloud.user.api.entity.UserInfo;
import com.haorong.cloud.user.api.vo.UserInfoVO;

import java.util.List;

public interface RemoteMallUserService {

	/**
	 * 根据手机号获取用户信息
	 * @param phone 手机号
	 * @param clientType 客户端类型
	 * @return 用户信息
	 */
	UserInfo getInfoByPhone(String phone, String clientType);

	UserInfoVO getUserById(String userId);

	UserInfoVO getUserByPhone(String phone);

	List<UserInfoVO> getUserByIds(List<String> userIds);

}
