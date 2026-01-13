/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.miniapp.mapper;

import com.baomidou.mybatisplus.annotation.InterceptorIgnore;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.haorong.cloud.miniapp.api.entity.WxApp;
import com.haorong.cloud.miniapp.api.vo.WxAppV0;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * 微信应用
 *
 * @author haorong
 * @since 2022/2/26 16:32
 */
@Mapper
public interface WxAppMapper extends BaseMapper<WxApp> {

	@InterceptorIgnore(tenantLine = "true")
	WxAppV0 selectByAppId(String appId);

	WxAppV0 selectWxAppByAppId(String appId);

	IPage<WxAppV0> selectWxAppPage(Page page, @Param("query") WxApp wxApp);

}
