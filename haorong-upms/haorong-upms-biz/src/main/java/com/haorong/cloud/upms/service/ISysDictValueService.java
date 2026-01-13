/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.upms.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.haorong.cloud.upms.api.entity.SysDictValue;

/**
 * 字典键值
 *
 * @author haorong
 * @date 2022/10/21
 */
public interface ISysDictValueService extends IService<SysDictValue> {

	/**
	 * 新增字典值
	 * @param sysDictValue
	 * @return
	 */
	boolean saveDictValue(SysDictValue sysDictValue);

}
