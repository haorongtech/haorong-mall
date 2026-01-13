/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.order.controller.app;

import cn.hutool.json.JSONUtil;
import com.haorong.cloud.common.core.util.Result;
import com.haorong.cloud.common.myabtis.tenant.HxTenantContextHolder;
import com.haorong.cloud.order.api.entity.OrderDelivery;
import com.haorong.cloud.order.service.IOrderDeliveryService;
import com.kuaidi100.sdk.response.SubscribePushParamResp;
import com.kuaidi100.sdk.response.SubscribeResp;
import com.kuaidi100.sdk.utils.SignUtils;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.Objects;

/**
 * 发货单
 *
 * @author haorong
 * @since 2024/12/06 23:08
 */
@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/app/delivery")
@Tag(description = "app-delivery", name = "发货单-API")
public class AppOrderDeliveryController {

	private final IOrderDeliveryService orderDeliveryService;

	@Operation(summary = "通过订单ID获取发货单信息")
	@GetMapping("/{orderId}")
	public Result<OrderDelivery> getDeliveryByOrderId(@PathVariable("orderId") String orderId) {
		return Result.success(orderDeliveryService.getByOrderId(orderId));
	}

	/**
	 * 订阅推送处理(参照) 订阅成功后，如果该快递单号有轨迹（包括已经签收的单），快递100将会在15分钟-4个小时推送；后面将会4个小时跟踪一次，跟踪到有轨迹变化则推送；
	 * 如果订阅成功后，3天查无结果（录错单/快递公司错了/揽收比较晚），快递100将会推送3天查无结果，可以继续重新订阅。
	 *
	 * <p>
	 * 回调接口支持自定义参数,比如订阅时回调地址填写的是 http://www.xxx.com?orderId=1233333 可以通过下面这种方式获取到orderId：
	 * String orderId = request.getParameter("orderId");
	 *
	 * <p>
	 * 返回值必须是下面这样的格式，否则快递100将认为该推送失败，快递100将会重试3次该推送，时间间隔35分钟； 成功结果返回例子：
	 * {"result":true,"returnCode":"200","message":"提交成功"}
	 * @param request
	 * @return: com.kuaidi100.sdk.response.SubscribeResp
	 * @author: haorong
	 * @time: 2022/6/11
	 */
	@Operation(summary = "物流信息回调")
	@PostMapping("/logistics")
	public SubscribeResp logisticsOrder(HttpServletRequest request) {
		String deliveryId = request.getParameter("deliveryId");
		String tenantId = request.getParameter("tenantId");
		String sign = request.getParameter("sign");
		String param = request.getParameter("param");
		SubscribePushParamResp subscribePushParamResp = JSONUtil.toBean(param, SubscribePushParamResp.class);
		log.info("物流回调:{}", subscribePushParamResp);
		HxTenantContextHolder.setTenantId(tenantId);
		SubscribeResp subscribeResp = new SubscribeResp();
		try {
			OrderDelivery orderDelivery = orderDeliveryService.getById(deliveryId);
			if (Objects.isNull(orderDelivery)) {
				throw new RuntimeException("订单不存在");
			}
			String ourSign = SignUtils.sign(param + orderDelivery.getDeliveryNo());
			// 加密如果相等，属于快递100推送；否则可以忽略掉当前请求
			if (ourSign.equals(sign)) {
				// 业务处理
				orderDeliveryService.notifyLogistics(orderDelivery, subscribePushParamResp);
				subscribeResp.setResult(Boolean.TRUE);
				subscribeResp.setReturnCode("200");
				subscribeResp.setMessage("成功");
				return subscribeResp;
			}
			return null;
		}
		catch (Exception e) {
			subscribeResp.setResult(Boolean.FALSE);
			subscribeResp.setReturnCode("500");
			subscribeResp.setMessage(e.getMessage());
		}

		return subscribeResp;
	}

}
