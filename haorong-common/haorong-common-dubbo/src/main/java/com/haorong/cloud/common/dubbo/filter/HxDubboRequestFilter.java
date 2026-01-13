/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.common.dubbo.filter;

import com.haorong.cloud.common.myabtis.tenant.HxTenantContextHolder;
import lombok.extern.slf4j.Slf4j;
import org.apache.dubbo.common.constants.CommonConstants;
import org.apache.dubbo.common.extension.Activate;
import org.apache.dubbo.rpc.*;

/**
 * Sa-Token 整合 Dubbo过滤器
 */
@Slf4j
@Activate(group = { CommonConstants.PROVIDER, CommonConstants.CONSUMER }, order = Integer.MAX_VALUE)
public class HxDubboRequestFilter implements Filter {

	@Override
	public Result invoke(Invoker<?> invoker, Invocation invocation) throws RpcException {
		// 判断是消费者 还是 服务提供者
		if (RpcContext.getServiceContext().isConsumerSide()) {
			// 传递租户ID
			invocation.setAttachment("tenantId", HxTenantContextHolder.getTenantId());
		}
		else {
			HxTenantContextHolder.setTenantId(invocation.getAttachment("tenantId"));
		}
		return invoker.invoke(invocation);
	}

}