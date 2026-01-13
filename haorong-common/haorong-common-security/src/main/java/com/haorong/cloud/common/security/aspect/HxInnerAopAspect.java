/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.common.security.aspect;

import cn.hutool.core.util.StrUtil;
import com.haorong.cloud.common.core.constant.SecurityConstants;
import com.haorong.cloud.common.security.annotation.HxInner;
import com.haorong.cloud.common.security.handler.HxBusinessException;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;

import jakarta.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;

/**
 * 内部接口调用处理 aop
 *
 * @author haorong
 * @date 2022/6/28
 */
@Slf4j
@Aspect
@RequiredArgsConstructor
public class HxInnerAopAspect {

	private final HttpServletRequest request;

	@SneakyThrows
	@Around("@annotation(com.haorong.cloud.common.security.annotation.HxInner)")
	public Object around(ProceedingJoinPoint point) {
		// 获取方法签名
		MethodSignature methodSignature = (MethodSignature) point.getSignature();
		// 获取方法
		Method method = methodSignature.getMethod();
		// 获取方法上面的注解
		HxInner hxInner = method.getAnnotation(HxInner.class);
		String header = request.getHeader(SecurityConstants.SOURCE);
		if (hxInner.value() && !StrUtil.equals(SecurityConstants.SOURCE_IN, header)) {
			log.warn("访问接口 {} 没有权限", point.getSignature().getName());
			throw new HxBusinessException("无权访问");
		}
		return point.proceed();
	}

}
