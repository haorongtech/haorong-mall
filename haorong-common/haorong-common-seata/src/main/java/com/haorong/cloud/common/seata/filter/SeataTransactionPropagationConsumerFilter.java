/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.common.seata.filter;

import org.apache.dubbo.common.extension.Activate;
import org.apache.dubbo.rpc.*;
import org.apache.seata.core.constants.DubboConstants;
import org.apache.seata.core.context.RootContext;
import org.apache.seata.core.model.BranchType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * The type Transaction propagation consumer filter.
 * 重写dubbo-filter-seata,后续等dubbo-filter-seata修复了bug 可以删除
 *
 * @author https://github.com/apache/incubator-seata/issues/6815
 */
@Activate(group = DubboConstants.CONSUMER)
public class SeataTransactionPropagationConsumerFilter implements Filter {

	private static final Logger LOGGER = LoggerFactory.getLogger(SeataTransactionPropagationConsumerFilter.class);

	@Override
	public Result invoke(Invoker<?> invoker, Invocation invocation) throws RpcException {
		if (RootContext.inGlobalTransaction()) {
			String xid = RootContext.getXID();
			BranchType branchType = RootContext.getBranchType();

			if (LOGGER.isDebugEnabled()) {
				LOGGER.debug(String.format("Client side xid in RootContext[%s]", xid));
			}
			if (xid != null) {
				invocation.setAttachment(RootContext.KEY_XID, xid);
				if (branchType != null) {
					invocation.setAttachment(RootContext.KEY_BRANCH_TYPE, branchType.name());
				}
			}
		}
		return invoker.invoke(invocation);
	}

}
