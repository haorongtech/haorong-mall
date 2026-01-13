/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.upms.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.haorong.cloud.upms.api.entity.SysLoginLog;
import com.haorong.cloud.upms.mapper.SysLoginLogMapper;
import com.haorong.cloud.upms.service.ISysLoginLogService;
import org.springframework.stereotype.Service;

/**
 * 登录日志
 *
 * @author haorong
 * @since 2022/2/26 16:47
 */
@Service
public class SysLoginLogServiceImpl extends ServiceImpl<SysLoginLogMapper, SysLoginLog> implements ISysLoginLogService {

}
