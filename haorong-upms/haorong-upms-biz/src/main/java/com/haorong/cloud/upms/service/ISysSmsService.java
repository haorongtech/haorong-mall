/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.upms.service;

public interface ISysSmsService {

	/**
	 * 发送短信验证码
	 * @param mobile 手机号
	 * @param type 验证码类型 注册、登录、重置密码、修改手机号
	 * @return
	 */
	Boolean sendSmsCode(String mobile, String type);

}
