/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.user.controller.app;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.haorong.cloud.common.core.constant.CommonConstants;
import com.haorong.cloud.common.core.util.Result;
import com.haorong.cloud.common.security.util.SecurityUtils;
import com.haorong.cloud.user.api.entity.UserAddress;
import com.haorong.cloud.user.service.IUserAddressService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

/**
 * 用户收货地址
 *
 * @author haorong
 * @since 2022/2/23 13:11
 */
@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/app/address")
@Tag(description = "address", name = "用户收货地址-API")
public class AppUserAddressController {

	private final IUserAddressService userAddressService;

	@Operation(summary = "收货地址分页列表")
	@GetMapping("/page")
	public Result page(Page page, UserAddress userAddress) {
		userAddress.setUserId(SecurityUtils.getUser().getUserId());
		return Result.success(userAddressService.page(page, Wrappers.lambdaQuery(userAddress)));
	}

	@Operation(summary = "查询用户默认收货地址")
	@GetMapping("/default")
	public Result getDefault() {
		UserAddress userAddress = new UserAddress();
		userAddress.setUserId(SecurityUtils.getUser().getUserId());
		userAddress.setIsDefault(CommonConstants.YES);
		return Result.success(userAddressService.getOne(Wrappers.lambdaQuery(userAddress)));
	}

	@Operation(summary = "新增/编辑用户收货地址")
	@PostMapping
	public Result saveOrUpdate(@RequestBody UserAddress userAddress) {
		userAddress.setUserId(SecurityUtils.getUser().getUserId());
		return Result.success(userAddressService.saveOrUpdate(userAddress));
	}

	/**
	 * 通过id查询
	 * @param id 主键
	 * @return UserAddress
	 */
	@GetMapping("/{id}")
	public Result<UserAddress> getById(@PathVariable("id") String id) {
		return Result.success(userAddressService.getById(id));

	}

	/**
	 * 通过id查询
	 * @param id 主键
	 * @return UserAddress
	 */
	@DeleteMapping("/{id}")
	public Result<Boolean> deleteById(@PathVariable("id") String id) {
		return Result.success(userAddressService.removeById(id));

	}

}
