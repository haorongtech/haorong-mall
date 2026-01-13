/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.order.event.listener;

import com.haorong.cloud.order.event.HxOrderCreateBeforeEvent;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

/**
 * @author: haorong
 * @date: 2023/4/24 11:57
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class HxOrderCreateBeforeEventListener {

	/**
	 * TODO 拼团活动订单
	 * @param event
	 */
	@EventListener(HxOrderCreateBeforeEvent.class)
	public void groupEventListener(HxOrderCreateBeforeEvent event) {

	}

	/**
	 * TODO 秒杀活动订单
	 * @param event
	 */
	@EventListener(HxOrderCreateBeforeEvent.class)
	public void seckillEventListener(HxOrderCreateBeforeEvent event) {

	}

}
