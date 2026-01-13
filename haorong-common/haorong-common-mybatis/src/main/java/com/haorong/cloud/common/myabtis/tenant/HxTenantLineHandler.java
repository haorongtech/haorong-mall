/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.common.myabtis.tenant;

import com.baomidou.mybatisplus.extension.plugins.handler.TenantLineHandler;
import com.haorong.cloud.common.myabtis.properties.TenantConfigProperties;
import lombok.extern.slf4j.Slf4j;
import net.sf.jsqlparser.expression.Expression;
import net.sf.jsqlparser.expression.NullValue;
import net.sf.jsqlparser.expression.StringValue;
import org.springframework.beans.factory.annotation.Autowired;

@Slf4j
public class HxTenantLineHandler implements TenantLineHandler {

	@Autowired
	private TenantConfigProperties tenantConfigProperties;

	@Override
	public Expression getTenantId() {
		// 可以通过过滤器从请求中获取对应租户id
		String tenantId = HxTenantContextHolder.getTenantId();
		if (tenantId == null) {
			return new NullValue();
		}
		return new StringValue(tenantId);
	}

	@Override
	public boolean ignoreTable(String tableName) {
		return !tenantConfigProperties.getTables().contains(tableName);
	}

}
