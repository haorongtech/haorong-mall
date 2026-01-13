/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.miniapp.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.haorong.cloud.miniapp.api.dto.WxQrCodeDTO;
import com.haorong.cloud.miniapp.api.entity.WxApp;
import com.haorong.cloud.miniapp.api.vo.WxAppV0;

/**
 * 微信应用
 *
 * @author haorong
 * @since 2022/2/26 16:36
 */
public interface IWxAppService extends IService<WxApp> {

	WxAppV0 findByAppId(String appId);

	IPage<WxAppV0> getPage(Page page, WxApp wxApp);

	WxAppV0 getWxAppById(String appId);

	/**
	 * 创建-小程序码
	 * @param wxQrCodeDTO
	 * @return
	 */
	String createWxaCodeUnlimit(WxQrCodeDTO wxQrCodeDTO);

	/**
	 * 修改-应用信息
	 * @param wxApp
	 * @return
	 */
	Boolean updateWxAppById(WxApp wxApp);

	/**
	 * 新增小程序配置
	 * @param wxApp
	 * @return
	 */
	boolean saveWxApp(WxApp wxApp);

	/**
	 * 删除小程序配置
	 * @param id
	 * @return
	 */
	boolean removeWxAppById(String id);

}
