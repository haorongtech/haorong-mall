/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.common.core.annotation;

import com.fasterxml.jackson.annotation.JacksonAnnotationsInside;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.haorong.cloud.common.core.config.AbstractDesensitization;
import com.haorong.cloud.common.core.config.DesensitizationJsonSerializer;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

/**
 * 数据脱敏注解
 *
 * @author haorong
 * @date 2022/5/31
 */
@Retention(RetentionPolicy.RUNTIME)
@JacksonAnnotationsInside
@JsonSerialize(using = DesensitizationJsonSerializer.class)
public @interface Desensitization {

	Class<? extends AbstractDesensitization> value();

}
