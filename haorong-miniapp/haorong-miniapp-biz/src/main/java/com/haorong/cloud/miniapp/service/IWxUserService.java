/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.miniapp.service;

import cn.binarywang.wx.miniapp.bean.WxMaPhoneNumberInfo;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.haorong.cloud.miniapp.api.dto.WxUserLoginReqDTO;
import com.haorong.cloud.miniapp.api.dto.WxUserReqDTO;
import com.haorong.cloud.miniapp.api.entity.WxUser;
import com.haorong.cloud.miniapp.api.vo.WxUserVo;

/**
 * 微信用户
 *
 * @author haorong
 * @since 2022/2/26 16:36
 */
public interface IWxUserService extends IService<WxUser> {

	/**
	 * 微信用户列表
	 *
	 * @author haorong
	 * @date 2022/6/1
	 * @param page
	 * @param wxUser
	 * @return: com.baomidou.mybatisplus.core.metadata.IPage<com.haorong.cloud.weixin.common.vo.WxUserVo>
	 */
	IPage<WxUserVo> adminPage(Page page, WxUser wxUser);

	/**
	 * 小程序登录
	 * @param wxUserLoginReqDTO
	 * @return
	 */
	WxUser login(WxUserLoginReqDTO wxUserLoginReqDTO);

	/**
	 * 解密手机号
	 * @param wxUserLoginReqDTO
	 * @return
	 */
	WxMaPhoneNumberInfo decryptPhone(WxUserLoginReqDTO wxUserLoginReqDTO);

	/**
	 * 绑定用户id
	 * @param wxUserReqDTO
	 * @return
	 */
	Boolean bindUserId(WxUserReqDTO wxUserReqDTO);

	/**
	 * 解绑用户id
	 * @param wxUserReqDTO
	 * @return
	 */
	Boolean unbindUserId(WxUserReqDTO wxUserReqDTO);

}
