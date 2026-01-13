/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.pay.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.haorong.cloud.pay.api.entity.PayConfig;
import com.haorong.cloud.pay.api.vo.PayConfigVO;

/**
 * 支付配置
 *
 * @author haorong
 * @date 2022/6/16
 */
public interface IPayConfigService extends IService<PayConfig> {

	/**
	 * 通过appid查询支付配置
	 * @param appId
	 * @return
	 */
	PayConfig getByAppId(String appId);

	/**
	 * 通过支付类型查询
	 * @param payType 支付类型
	 * @param terminalType 终端类型
	 * @return
	 */
	PayConfigVO getConfig(String payType, String terminalType);

	boolean saveConfig(PayConfig payConfig);

}
