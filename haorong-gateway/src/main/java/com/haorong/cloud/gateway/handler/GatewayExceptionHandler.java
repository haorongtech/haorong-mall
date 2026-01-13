/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */

package com.haorong.cloud.gateway.handler;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.haorong.cloud.common.core.util.Result;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.web.reactive.error.ErrorWebExceptionHandler;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.core.io.buffer.DataBufferFactory;
import org.springframework.http.MediaType;
import org.springframework.http.server.reactive.ServerHttpResponse;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

/**
 * 网关统一异常处理
 *
 * @author haorong
 * @since 2022/2/26 13:28
 */
@Slf4j
@Order(-1)
@Configuration
@RequiredArgsConstructor
public class GatewayExceptionHandler implements ErrorWebExceptionHandler {

	private final ObjectMapper objectMapper;

	@Override
	public Mono<Void> handle(ServerWebExchange exchange, Throwable ex) {
		ServerHttpResponse response = exchange.getResponse();
		if (response.isCommitted()) {
			return Mono.error(ex);
		}

		// header set
		response.getHeaders().setContentType(MediaType.APPLICATION_JSON);
		if (ex instanceof ResponseStatusException) {
			response.setStatusCode(((ResponseStatusException) ex).getStatusCode());
		}
		return response.writeWith(Mono.fromSupplier(() -> {
			DataBufferFactory bufferFactory = response.bufferFactory();
			try {
				log.warn("Error Spring Cloud Gateway : {}", ex.getMessage());
				return bufferFactory.wrap(objectMapper.writeValueAsBytes(Result.fail(ex.getMessage())));
			}
			catch (JsonProcessingException e) {
				log.error("Error writing response", ex);
				return bufferFactory.wrap(new byte[0]);
			}
		}));
	}

}
