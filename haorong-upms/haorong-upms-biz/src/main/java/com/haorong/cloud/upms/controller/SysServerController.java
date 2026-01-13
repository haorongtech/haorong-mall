/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.upms.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.haorong.cloud.common.core.util.Result;
import com.haorong.cloud.upms.api.vo.server.Server;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * CPU相关信息
 *
 * @author haorong
 * @since 2022/5/21 15:35
 */
@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/sysserver")
@Tag(description = "sysserver", name = "服务器监控")
public class SysServerController {

	@Operation(summary = "查询服务器监控信息")
	@GetMapping
	@SaCheckPermission("upms:sysserver:get")
	public Result<Server> getServerInfo() throws Exception {
		Server server = new Server();
		server.copyTo();
		return Result.success(server);
	}

}
