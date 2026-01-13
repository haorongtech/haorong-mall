/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.common.security.annotation;

import java.lang.annotation.*;

/**
 * 内部调用注解
 *
 * @author haorong
 * @date 2022/5/3 21:10
 * @version 1.0
 */
@Target({ ElementType.METHOD, ElementType.TYPE })
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface HxInner {

	boolean value() default true;

}
