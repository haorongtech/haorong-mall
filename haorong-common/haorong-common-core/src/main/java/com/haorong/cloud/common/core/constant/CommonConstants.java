/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.common.core.constant;

/**
 * 公共常量
 *
 * @author haorong
 * @since 2022/2/10 12:00
 */
public interface CommonConstants {

	int SUCCESS = 0;

	int FAIL = 1;

	/**
	 * 系统状态：0.正常；1.停用
	 */
	String NORMAL_STATUS = "0";

	/**
	 * 顶级ID
	 */
	String PARENT_ID = "0";

	/**
	 * 菜单
	 */
	String MENU_TYPE_0 = "0";

	/**
	 * 按钮
	 */
	String MENU_TYPE_1 = "1";

	/**
	 * 登录状态：0.失败；1.成功；
	 */
	String LOGIN_LOG_STATUS_0 = "0";

	String LOGIN_LOG_STATUS_1 = "1";

	/**
	 * 公共状态：1.是；0.否；
	 */
	String YES = "1";

	String NO = "0";

	/**
	 * 管理员角色编码
	 */
	String ROLE_ADMIN_CODE = "ROLE_ADMIN";

	/**
	 * 管理员角色名称
	 */
	String ROLE_ADMIN_NAME = "系统管理员";

	/**
	 * 请求头租户ID
	 */
	String TENANT_ID = "tenant-id";

	/**
	 * 平台租户ID
	 */
	String PLATFORM_TENANT_ID = "1881232176465358849";

	/**
	 * token key
	 */
	String TOKEN_KEY = "satoken";

	/**
	 * 滑块验证码类型
	 */
	String IMAGE_CODE_TYPE_BP = "blockPuzzle";

	/**
	 * 文字点选验证码类型
	 */
	String IMAGE_CODE_TYPE_CW = "clickWord";

	// 系统主账户
	String USER_TYPE_PRIMARY = "0";

	// 用户名注册类型
	String REGISTER_TYPE_USERNAME = "username";

	// 手机号注册类型
	String REGISTER_TYPE_PHONE = "phone";

	String UTF8 = "UTF-8";

}
