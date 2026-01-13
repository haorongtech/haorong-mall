/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.common.log.annotation;

import java.lang.annotation.*;

/**
 * 日志注解
 *
 * @author haorong
 * @since 2022/2/17 9:23
 */
@Target({ ElementType.METHOD, ElementType.TYPE })
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface SysLog {

	/** 标题 */
	String value() default "";

}
