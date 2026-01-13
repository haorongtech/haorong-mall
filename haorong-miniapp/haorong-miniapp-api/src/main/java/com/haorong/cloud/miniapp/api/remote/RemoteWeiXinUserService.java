/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.miniapp.api.remote;

import cn.binarywang.wx.miniapp.bean.WxMaPhoneNumberInfo;
import com.haorong.cloud.miniapp.api.dto.WxUserLoginReqDTO;
import com.haorong.cloud.miniapp.api.dto.WxUserReqDTO;
import com.haorong.cloud.miniapp.api.entity.WxUser;

/**
 * 微信用户feign接口
 *
 * @author haorong
 * @date 2022/6/10
 */
public interface RemoteWeiXinUserService {

	/**
	 * 微信静默登录
	 *
	 * @author haorong
	 * @date 2022/6/16
	 * @param wxUserLoginReqDTO
	 * @return: com.haorong.cloud.miniapp.common.entity.WxUser
	 */
	WxUser maLogin(WxUserLoginReqDTO wxUserLoginReqDTO);

	/**
	 * 微信解密手机号
	 *
	 * @author haorong
	 * @date 2022/6/16
	 * @param wxUserLoginReqDTO
	 * @return: cn.binarywang.wx.miniapp.bean.WxMaPhoneNumberInfo
	 */
	WxMaPhoneNumberInfo getPhoneNumberInfo(WxUserLoginReqDTO wxUserLoginReqDTO);

	/**
	 * 绑定商城用户
	 * @param wxUserReqDTO 微信用户入参
	 * @return Boolean
	 */
	boolean bindUserId(WxUserReqDTO wxUserReqDTO);

	/**
	 * 解绑商城用户
	 * @param wxUserReqDTO 微信用户入参
	 * @return Boolean
	 */
	boolean unbindUserId(WxUserReqDTO wxUserReqDTO);

	/**
	 * 根据微信id获取微信用户信息
	 * @param id 微信id
	 * @return WxUser
	 */
	WxUser getInnerById(String id);

}
