/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.common.myabtis.resolver;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.metadata.OrderItem;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

/**
 * 解决Mybatis Plus Order By SQL注入问题 参照pig开源项目
 * https://gitee.com/log4j/pig/blob/jdk17/pig-common/pig-common-mybatis/src/main/java/com/pig4cloud/pig/common/mybatis/resolver/SqlFilterArgumentResolver.java
 *
 * @author haorong
 * @date 2022/6/10
 */
public class PageArgumentResolver implements HandlerMethodArgumentResolver {

	@Override
	public boolean supportsParameter(MethodParameter parameter) {
		Class<?> type = parameter.getParameterType();
		return Page.class.isAssignableFrom(type);
	}

	/**
	 * 处理Controller中方法 page对象参数
	 *
	 * @author haorong
	 * @date 2022/6/10
	 */
	@Override
	public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer,
			NativeWebRequest webRequest, WebDataBinderFactory binderFactory) {

		String currentStr = webRequest.getParameter("current");
		String sizeStr = webRequest.getParameter("size");
		String ascsStr = webRequest.getParameter("asc");
		String descsStr = webRequest.getParameter("desc");
		// 构建排序规则
		List<OrderItem> orders = new ArrayList<>();
		if (StrUtil.isNotBlank(ascsStr)) {
			Arrays.stream(ascsStr.split(",")).filter(StrUtil::isNotBlank).map(OrderItem::asc).forEach(orders::add);
		}
		if (StrUtil.isNotBlank(descsStr)) {
			Arrays.stream(descsStr.split(",")).filter(StrUtil::isNotBlank).map(OrderItem::desc).forEach(orders::add);
		}

		// 构建分页参数
		long current = Optional.ofNullable(currentStr).filter(StrUtil::isNotBlank).map(Long::parseLong).orElse(1L);

		long size = Optional.ofNullable(sizeStr).filter(StrUtil::isNotBlank).map(Long::parseLong).orElse(10L);

		// 创建分页对象
		Page<?> page = new Page<>(current, size);
		page.setOrders(orders);
		return page;

	}

}
