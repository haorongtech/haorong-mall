/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.upms.controller;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.json.JSONUtil;
import com.haorong.cloud.common.core.constant.CacheConstants;
import com.haorong.cloud.common.core.util.Result;
import com.haorong.cloud.common.log.annotation.SysLog;
import com.haorong.cloud.common.myabtis.tenant.HxTenantContextHolder;
import com.haorong.cloud.upms.api.entity.SysUserOnline;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.core.Cursor;
import org.springframework.data.redis.core.ScanOptions;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.web.bind.annotation.*;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Objects;

/**
 * 系统在线用户
 *
 * @author haorong
 * @since 2022/2/26 16:45
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/onlineuser")
@Tag(description = "onlineuser", name = "系统在线用户")
public class SysOnlineUserController {

	private final StringRedisTemplate redisTemplate;

	@Operation(summary = "在线用户列表")
	@GetMapping("/list")
	public Result<List<SysUserOnline>> page() {
		String tenantId = HxTenantContextHolder.getTenantId();

		String pattern = CacheConstants.SYS_ONLINE_KEY + tenantId + ":*";

		List<SysUserOnline> result = new ArrayList<>();

		ScanOptions options = ScanOptions.scanOptions().match(pattern).count(1000).build(); // count越大遍历越快但越耗资源
		Cursor<byte[]> cursor = null;

		try (RedisConnection connection = Objects.requireNonNull(redisTemplate.getConnectionFactory())
			.getConnection()) {
			cursor = connection.scan(options);
			while (cursor.hasNext()) {
				byte[] key = cursor.next();
				byte[] value = connection.get(key);
				if (value != null) {
					String jsonStr = new String(value, StandardCharsets.UTF_8);
					SysUserOnline online = JSONUtil.toBean(jsonStr, SysUserOnline.class);
					result.add(online);
				}
			}
		}
		catch (Exception e) {
			return Result.fail("Redis SCAN 查询失败: " + e.getMessage());
		}

		result.sort(Comparator.comparing(SysUserOnline::getLoginTime).reversed());

		return Result.success(result);
	}

	@SysLog("强退用户")
	@Operation(summary = "强退用户")
	@DeleteMapping("/{token}")
	public Result<Void> kickoutByToken(@PathVariable String token) {
		StpUtil.kickoutByTokenValue(token);
		return Result.success();
	}

}
