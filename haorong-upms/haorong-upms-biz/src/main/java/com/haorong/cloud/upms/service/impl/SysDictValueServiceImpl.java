/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.upms.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.haorong.cloud.common.core.constant.CacheConstants;
import com.haorong.cloud.upms.api.entity.SysDict;
import com.haorong.cloud.upms.api.entity.SysDictValue;
import com.haorong.cloud.upms.mapper.SysDictMapper;
import com.haorong.cloud.upms.mapper.SysDictValueMapper;
import com.haorong.cloud.upms.service.ISysDictValueService;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Service;

import java.util.Objects;

/**
 * 字典键值
 *
 * @author haorong
 * @date 2022/10/21
 */
@Service
@RequiredArgsConstructor
public class SysDictValueServiceImpl extends ServiceImpl<SysDictValueMapper, SysDictValue>
		implements ISysDictValueService {

	private final SysDictMapper sysDictMapper;

	@Override
	@CacheEvict(value = CacheConstants.DICT_CACHE, allEntries = true)
	public boolean saveDictValue(SysDictValue sysDictValue) {
		SysDict sysDict = sysDictMapper.selectById(sysDictValue.getDictId());
		if (Objects.isNull(sysDict)) {
			throw new IllegalArgumentException("字典不存在");
		}
		sysDictValue.setDictType(sysDict.getType());
		return this.save(sysDictValue);
	}

}
