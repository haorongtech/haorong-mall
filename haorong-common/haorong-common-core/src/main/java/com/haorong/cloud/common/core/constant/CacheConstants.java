/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.common.core.constant;

/**
 * 缓存常量
 *
 * @author haorong
 * @since 2022/2/18 17:00
 */
public interface CacheConstants {

	/** 验证码key */
	String DEFAULT_CODE_KEY = "random_code_";

	/** 短信验证码key */
	String SMS_CODE_KEY = "sms_code_";

	/** 用户信息缓存 */
	String USER_CACHE = "user_cache";

	/** 系统在线用户 */
	String SYS_ONLINE_KEY = "satoken:login:online_user:";

	/** 菜单信息缓存 */
	String MENU_CACHE = "menu_cache";

	/** 字典缓存 */
	String DICT_CACHE = "dict_cache";

	/** 微信应用缓存 */
	String WX_APP_CACHE = "wx_app_cache";

	/** 首页页面设计缓存 */
	String HOME_PAGE_DESIGN_CACHE = "home_page_design_cache:";

	/** 首页页面设计锁key */
	String HOME_PAGE_DESIGN_LOCK_CACHE = HOME_PAGE_DESIGN_CACHE + "lock:";

	String ORDER_CONFIG_CACHE = "order_config_cache:";

}
