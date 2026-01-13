/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.common.job.annotation;

import com.haorong.cloud.common.job.config.XxlJobConfig;
import org.springframework.context.annotation.Import;

import java.lang.annotation.*;

/**
 * xxlJob注解
 *
 * @author haorong
 * @since 2022/5/19 15:18
 */
@Documented
@Inherited
@Target({ ElementType.TYPE })
@Retention(RetentionPolicy.RUNTIME)
@Import({ XxlJobConfig.class })
public @interface HxEnableXxlJob {

}
