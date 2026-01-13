/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.user.controller.app;

import cn.dev33.satoken.secure.SaSecureUtil;
import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.haorong.cloud.common.core.constant.CacheConstants;
import com.haorong.cloud.common.core.constant.MallCommonConstants;
import com.haorong.cloud.common.core.util.Result;
import com.haorong.cloud.common.security.util.SecurityUtils;
import com.haorong.cloud.user.api.dto.UserInfoDTO;
import com.haorong.cloud.user.api.entity.UserInfo;
import com.haorong.cloud.user.api.vo.UserRespVO;
import com.haorong.cloud.user.service.IUserInfoService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

/**
 * 商城用户
 *
 * @author haorong
 * @since 2022/3/1 10:13
 */
@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/app/userinfo")
@Tag(description = "userinfo", name = "商城用户-API")
public class AppUserInfoController {

	private final IUserInfoService userInfoService;

	private final RedisTemplate<String, String> redisTemplate;

	@Operation(summary = "注册用户")
	@PostMapping("/register")
	public Result register(HttpServletRequest request, @RequestBody UserInfo userInfo) {
		if (userInfoService.checkPhone(userInfo.getPhone())) {
			return Result.fail("手机号已存在");
		}
		userInfo.setUserSource(request.getHeader(MallCommonConstants.HEADER_CLIENT_TYPE));
		return Result.success(userInfoService.save(userInfo));
	}

	@Operation(summary = "获取用户信息")
	@GetMapping
	public Result<UserRespVO> getUserInfo() {
		return Result.success(userInfoService.getUserById(SecurityUtils.getUser().getUserId()));
	}

	@Operation(summary = "修改用户信息")
	@PostMapping("/update/info")
	public Result updateInfo(@RequestBody UserInfo userInfo) {
		userInfo.setPhone(null);
		userInfo.setPassword(null);
		userInfo.setUserSource(null);
		return Result.success(userInfoService.updateById(userInfo));
	}

	@Operation(summary = "用户修改手机号")
	@PostMapping("/update/phone")
	public Result updatePhone(@RequestBody UserInfoDTO userInfoDTO) {
		String randomStr = userInfoDTO.getPhone();
		String key = CacheConstants.SMS_CODE_KEY + randomStr;
		Object codeObj = redisTemplate.opsForValue().get(key);

		if (ObjectUtil.isEmpty(codeObj) || !userInfoDTO.getCode().equals(codeObj)) {
			return Result.fail("验证码不合法");
		}
		String userId = SecurityUtils.getUser().getUserId();
		// 查询手机号是否已存在
		long count = userInfoService.count(Wrappers.<UserInfo>lambdaQuery()
			.eq(UserInfo::getPhone, userInfoDTO.getPhone())
			.ne(UserInfo::getId, userId));
		if (count > 0) {
			return Result.fail("手机号已存在");
		}
		UserInfo userInfo = new UserInfo();
		userInfo.setId(userId);
		userInfo.setPhone(userInfoDTO.getPhone());
		return Result.success(userInfoService.updateById(userInfo));
	}

	@Operation(summary = "修改密码")
	@PostMapping("/update/password")
	public Result updatePassword(@RequestBody UserInfoDTO userInfoDTO) {
		if (!StringUtils.hasText(userInfoDTO.getPassword())) {
			return Result.fail("密码不能为空");
		}
		if (!StringUtils.hasText(userInfoDTO.getConfirmPassword())) {
			return Result.fail("确认密码不能为空");
		}
		String userId = SecurityUtils.getUser().getUserId();
		return Result.success(userInfoService.update(Wrappers.<UserInfo>lambdaUpdate()
			.set(UserInfo::getPassword, SaSecureUtil.md5(userInfoDTO.getPassword()))
			.eq(UserInfo::getId, userId)));
	}

}
