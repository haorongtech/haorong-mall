/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.gateway.filter;

import com.haorong.cloud.common.core.constant.SecurityConstants;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

/**
 * 网关全局拦截器 作用所有微服务系统
 *
 * @author haorong
 * @since 2022/2/18 11:55
 */
@Component
public class HuanxingRequestGlobalFilter implements GlobalFilter {

	@Override
	public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
		ServerHttpRequest newRequest = exchange.getRequest()
			.mutate()
			// 为请求追加 请求来源参数
			.header(SecurityConstants.SOURCE, SecurityConstants.SOURCE_OUTER)
			.build();
		ServerWebExchange newExchange = exchange.mutate().request(newRequest).build();
		return chain.filter(newExchange);
	}

}
