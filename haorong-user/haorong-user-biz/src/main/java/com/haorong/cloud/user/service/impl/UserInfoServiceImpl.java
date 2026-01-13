/**
 * Copyright (c) 2025 沈阳浩荣科技有限公司
 * All rights reserved.
 * <p>
 * 注意：
 * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。
 */
package com.haorong.cloud.user.service.impl;

import cn.dev33.satoken.secure.SaSecureUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.haorong.cloud.common.core.desensitization.MobilePhoneDesensitization;
import com.haorong.cloud.common.security.handler.HxBusinessException;
import com.haorong.cloud.user.api.entity.UserInfo;
import com.haorong.cloud.user.api.vo.UserRespVO;
import com.haorong.cloud.user.api.vo.UserStatisticsVO;
import com.haorong.cloud.user.mapper.UserInfoMapper;
import com.haorong.cloud.user.service.IUserInfoService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.Objects;

/**
 * 商城用户
 *
 * @author haorong
 * @since 2022/2/26 16:37
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class UserInfoServiceImpl extends ServiceImpl<UserInfoMapper, UserInfo> implements IUserInfoService {

	private final MobilePhoneDesensitization mobilePhoneDesensitization = new MobilePhoneDesensitization();

	@Override
	public IPage<UserRespVO> getPage(Page page, UserInfo userInfo) {
		return baseMapper.selectAdminPage(page, userInfo);
	}

	@Override
	public boolean checkPhone(String phone) {
		if (StrUtil.isBlank(phone)) {
			throw new HxBusinessException("手机号为空");
		}
		return baseMapper.selectCount(Wrappers.<UserInfo>lambdaQuery().eq(UserInfo::getPhone, phone)) > 0;
	}

	@Override
	public UserRespVO getUserById(String id) {
		UserInfo userInfo = this.getById(id);
		if (Objects.isNull(userInfo)) {
			return null;
		}
		UserRespVO userRespVO = new UserRespVO();
		BeanUtils.copyProperties(userInfo, userRespVO);
		return userRespVO;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public UserInfo createUser(String phone, String clientType) {
		UserInfo userInfo = new UserInfo();
		userInfo.setPhone(phone);
		userInfo.setUserSource(clientType);
		userInfo.setNickName(mobilePhoneDesensitization.serialize(userInfo.getPhone()));
		userInfo.setCreateBy(phone);
		this.save(userInfo);
		return userInfo;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public boolean saveUser(UserInfo userInfo) {
		if (this.checkPhone(userInfo.getPhone())) {
			throw new RuntimeException("手机号已存在");
		}
		if (StringUtils.hasText(userInfo.getPassword())) {
			userInfo.setPassword(SaSecureUtil.md5(userInfo.getPassword()));
		}
		return this.save(userInfo);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public boolean updateUserById(UserInfo userInfo) {
		UserInfo target = this.getById(userInfo.getId());
		userInfo.setPhone(null);
		userInfo.setPassword(null);
		BeanUtils.copyProperties(userInfo, target);

		this.updateById(target);

		return true;
	}

	@Override
	public List<UserStatisticsVO> sourceStatistics(UserInfo userInfo) {
		return baseMapper.sourceStatistics(userInfo);
	}

}
