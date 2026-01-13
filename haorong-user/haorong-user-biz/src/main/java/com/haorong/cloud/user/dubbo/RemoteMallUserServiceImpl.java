/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.user.dubbo;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.haorong.cloud.user.api.entity.UserInfo;
import com.haorong.cloud.user.api.remote.RemoteMallUserService;
import com.haorong.cloud.user.api.vo.UserInfoVO;
import com.haorong.cloud.user.service.IUserInfoService;
import lombok.RequiredArgsConstructor;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * @author lijia
 * @description
 * @date 2024/11/23
 */
@Service
@DubboService
@RequiredArgsConstructor
public class RemoteMallUserServiceImpl implements RemoteMallUserService {

	private final IUserInfoService userInfoService;

	@Override
	public UserInfo getInfoByPhone(String phone, String clientType) {
		UserInfo userInfo = userInfoService.getOne(Wrappers.<UserInfo>lambdaQuery().eq(UserInfo::getPhone, phone));
		if (ObjectUtil.isNull(userInfo)) {
			userInfo = userInfoService.createUser(phone, clientType);

		}
		return userInfo;
	}

	@Override
	public UserInfoVO getUserById(String userId) {
		UserInfo userInfo = userInfoService.getById(userId);
		if (Objects.isNull(userInfo)) {
			return null;
		}
		return BeanUtil.copyProperties(userInfo, UserInfoVO.class);
	}

	@Override
	public UserInfoVO getUserByPhone(String phone) {
		UserInfo userInfo = userInfoService.getOne(Wrappers.<UserInfo>lambdaQuery().eq(UserInfo::getPhone, phone));
		if (Objects.isNull(userInfo)) {
			return null;
		}
		return BeanUtil.copyProperties(userInfo, UserInfoVO.class);
	}

	@Override
	public List<UserInfoVO> getUserByIds(List<String> userIds) {
		List<UserInfo> userInfoList = userInfoService.listByIds(userIds);
		if (!CollectionUtils.isEmpty(userInfoList)) {
			return userInfoList.stream().map(v -> {
				UserInfoVO userInfoVO = new UserInfoVO();
				BeanUtil.copyProperties(v, userInfoVO);
				return userInfoVO;
			}).collect(Collectors.toList());
		}
		return null;
	}

}
