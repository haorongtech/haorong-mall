/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.common.myabtis.tenant;

import com.haorong.cloud.common.core.constant.CommonConstants;
import com.haorong.cloud.common.security.util.SecurityUtils;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.GenericFilterBean;

import java.io.IOException;
import java.util.Objects;

@Slf4j
@Component
public class HxTenantContextFilter extends GenericFilterBean {

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		// 获取请求头 租户id
		String tenantId = request.getHeader(CommonConstants.TENANT_ID);
		String token = request.getHeader(CommonConstants.TOKEN_KEY);
		if (StringUtils.hasText(token) && Objects.nonNull(SecurityUtils.getUser())) {
			// 判断是否是平台管理员 平台管理员可以切换租户
			if (SecurityUtils.getUser().getTenantId().equals(CommonConstants.PLATFORM_TENANT_ID)
					&& StringUtils.hasText(tenantId)) {
				HxTenantContextHolder.setTenantId(tenantId);
			}
			else {
				HxTenantContextHolder.setTenantId(SecurityUtils.getUser().getTenantId());
			}
		}
		else {
			HxTenantContextHolder.setTenantId(tenantId);
		}
		filterChain.doFilter(request, response);
	}

}
