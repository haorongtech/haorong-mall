/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.upms.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.haorong.cloud.upms.api.entity.SysLogisticsCompany;
import com.haorong.cloud.upms.mapper.SysLogisticsCompanyMapper;
import com.haorong.cloud.upms.service.ISysLogisticsCompanyService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * 物流公司
 *
 * @author haorong
 * @since 2023/1/10
 */
@Service
@RequiredArgsConstructor
public class SysLogisticsCompanyServiceImpl extends ServiceImpl<SysLogisticsCompanyMapper, SysLogisticsCompany>
		implements ISysLogisticsCompanyService {

}
