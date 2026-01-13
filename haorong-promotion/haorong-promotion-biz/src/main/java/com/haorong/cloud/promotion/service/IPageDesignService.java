/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.promotion.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.haorong.cloud.promotion.api.entity.PageDesign;

/**
 * 页面设计
 *
 * @author haorong
 * @date 2022/12/07
 */
public interface IPageDesignService extends IService<PageDesign> {

	/**
	 * @param request 页面设计
	 * @return
	 */
	PageDesign getHomePage(PageDesign request);

	/**
	 * 修改页面设计
	 * @param pageDesign 页面设计
	 * @return
	 */
	boolean updatePageDesignById(PageDesign pageDesign);

}
