/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.order.service.impl;

import cn.binarywang.wx.miniapp.bean.shop.request.shipping.OrderKeyBean;
import cn.binarywang.wx.miniapp.bean.shop.request.shipping.PayerBean;
import cn.binarywang.wx.miniapp.bean.shop.request.shipping.ShippingListBean;
import cn.binarywang.wx.miniapp.bean.shop.request.shipping.WxMaOrderShippingInfoUploadRequest;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.date.DatePattern;
import cn.hutool.core.date.LocalDateTimeUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.haorong.cloud.common.core.constant.CommonConstants;
import com.haorong.cloud.common.core.constant.RocketMqConstants;
import com.haorong.cloud.common.core.entity.CallbackPrefixProperties;
import com.haorong.cloud.common.core.entity.OrderCompleteEvent;
import com.haorong.cloud.common.core.enums.MallErrorCodeEnum;
import com.haorong.cloud.common.core.util.Result;
import com.haorong.cloud.common.core.util.SnowflakeIdUtils;
import com.haorong.cloud.common.logistics.util.Kuaidi100Utils;
import com.haorong.cloud.common.security.handler.HxBusinessException;
import com.haorong.cloud.common.security.util.SecurityUtils;
import com.haorong.cloud.miniapp.api.remote.RemoteSecOrderService;
import com.haorong.cloud.order.api.constant.MallOrderConstants;
import com.haorong.cloud.order.api.dto.*;
import com.haorong.cloud.order.api.entity.*;
import com.haorong.cloud.order.api.enums.*;
import com.haorong.cloud.order.api.vo.OrderStatisticsVO;
import com.haorong.cloud.order.event.HxOrderCreateAfterEvent;
import com.haorong.cloud.order.mapper.OrderDeliveryMapper;
import com.haorong.cloud.order.mapper.OrderInfoMapper;
import com.haorong.cloud.order.mapper.OrderItemMapper;
import com.haorong.cloud.order.mapper.OrderRefundMapper;
import com.haorong.cloud.order.service.*;
import com.haorong.cloud.pay.api.constants.PayConstants;
import com.haorong.cloud.pay.api.dto.CreateOrderReqDTO;
import com.haorong.cloud.pay.api.enums.PayTradeTypeEnum;
import com.haorong.cloud.pay.api.remote.RemotePayService;
import com.haorong.cloud.product.api.constant.ProductConstants;
import com.haorong.cloud.product.api.dto.GoodsSkuStockReqDTO;
import com.haorong.cloud.product.api.entity.GoodsAppraise;
import com.haorong.cloud.product.api.entity.GoodsSku;
import com.haorong.cloud.product.api.entity.GoodsSkuSpecsValue;
import com.haorong.cloud.product.api.entity.GoodsSpu;
import com.haorong.cloud.product.api.remote.RemoteGoodsAppraiseService;
import com.haorong.cloud.product.api.remote.RemoteGoodsSkuService;
import com.haorong.cloud.promotion.api.constant.MallEventConstants;
import com.haorong.cloud.promotion.api.dto.CouponUserReqDTO;
import com.haorong.cloud.promotion.api.entity.CouponGoods;
import com.haorong.cloud.promotion.api.entity.CouponInfo;
import com.haorong.cloud.promotion.api.enums.CouponUserStatusEnum;
import com.haorong.cloud.promotion.api.remote.RemoteCouponUserService;
import com.haorong.cloud.promotion.api.vo.CouponUserRespVO;
import com.haorong.cloud.user.api.entity.UserAddress;
import com.haorong.cloud.user.api.remote.RemoteMallUserService;
import com.haorong.cloud.user.api.remote.RemoteUserAddressService;
import com.haorong.cloud.user.api.vo.UserInfoVO;
import lombok.RequiredArgsConstructor;
import org.apache.dubbo.config.annotation.DubboReference;
import org.apache.rocketmq.spring.core.RocketMQTemplate;
import org.apache.seata.spring.annotation.GlobalTransactional;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.messaging.support.GenericMessage;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDateTime;
import java.time.Month;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.*;
import java.util.concurrent.atomic.AtomicReference;
import java.util.stream.Collectors;

/**
 * 订单
 *
 * @author haorong
 * @since 2022/3/7 14:18
 */
@Service
@RequiredArgsConstructor
public class OrderInfoServiceImpl extends ServiceImpl<OrderInfoMapper, OrderInfo> implements IOrderInfoService {

	private final IOrderConfigService orderConfigService;

	private final Kuaidi100Utils kuaidi100Utils;

	private final OrderItemMapper orderItemMapper;

	@DubboReference
	private final RemoteGoodsSkuService remoteGoodsSkuService;

	@DubboReference
	private final RemoteMallUserService remoteMallUserService;

	private final IOrderItemService orderItemService;

	@DubboReference
	private final RemotePayService remotePayService;

	private final ApplicationEventPublisher applicationEventPublisher;

	@DubboReference
	private final RemoteGoodsAppraiseService remoteGoodsAppraiseService;

	@DubboReference
	private final RemoteCouponUserService remoteCouponUserService;

	private final OrderRefundMapper orderRefundMapper;

	private final IOrderRefundService orderRefundService;

	@DubboReference
	private final RemoteUserAddressService remoteUserAddressService;

	private final OrderDeliveryMapper orderDeliveryMapper;

	private final RocketMQTemplate rocketMQTemplate;

	@DubboReference
	private final RemoteSecOrderService remoteSecOrderService;

	private final CallbackPrefixProperties callbackPrefixProperties;

	@Override
	public IPage<OrderInfo> adminPage(Page page, OrderInfo orderInfo) {
		return baseMapper.selectAdminPage(page, orderInfo);
	}

	@Override
	public OrderInfo getOrderById(String id) {
		OrderInfo orderInfo = baseMapper.selectOrderById(id);
		if (Objects.isNull(orderInfo)) {
			return null;
		}
		if (!CollectionUtils.isEmpty(orderInfo.getOrderItemList())) {
			orderInfo.getOrderItemList().forEach(orderItem -> {
				if (!OrderItemStatusEnum.SHIPPED.getCode().equals(orderItem.getStatus())
						&& !OrderItemStatusEnum.PAID.getCode().equals(orderItem.getStatus())) {
					// 查询最近一笔退款单
					orderItem.setOrderRefund(orderRefundMapper.selectByOrderItemId(orderItem.getId()));
				}
			});
		}
		return orderInfo;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public boolean deliverOrder(OrderDeliveryDTO request) {
		OrderConfig orderConfig = orderConfigService.getConfig();
		if (Objects.isNull(orderConfig)) {
			throw new HxBusinessException("订单配置不存在");
		}
		OrderInfo orderInfo = baseMapper.selectById(request.getOrderId());
		if (ObjectUtil.isNull(orderInfo)) {
			throw new HxBusinessException("订单不存在");
		}
		List<OrderItemEntity> orderItemEntityList = orderItemService
			.list(Wrappers.<OrderItemEntity>lambdaQuery().eq(OrderItemEntity::getOrderId, orderInfo.getId()));
		if (CollectionUtils.isEmpty(orderItemEntityList)) {
			throw new HxBusinessException("订单商品不存在");
		}
		orderItemEntityList.forEach(orderItem -> {
			if (!orderItem.getStatus().equals(OrderItemStatusEnum.PAID.getCode())) {
				throw new HxBusinessException("状态错误");
			}
			orderItem.setStatus(OrderItemStatusEnum.SHIPPED.getCode());
		});
		// 创建发货单
		OrderDelivery orderDelivery = new OrderDelivery();
		orderDelivery.setDeliveryNo(IdUtil.getSnowflakeNextIdStr());
		orderDelivery.setDeliverTime(LocalDateTime.now());
		orderDelivery.setOrderId(orderInfo.getId());
		orderDelivery.setDeliveryStatus(OrderLogisticsStateEnum.STATUS_1.getCode());
		orderDelivery.setDeliverTime(LocalDateTime.now());
		orderDelivery.setLogisticsCompanyCode(request.getLogisticsCompanyCode());
		orderDelivery.setLogisticsCompanyName(request.getLogisticsCompanyName());
		orderDelivery.setLogisticsNo(request.getLogisticsNo());
		orderDelivery.setRemark("订单已发货，物流单号：" + request.getLogisticsNo());
		if (orderDeliveryMapper.insert(orderDelivery) <= 0) {
			throw new HxBusinessException("创建发货单失败");
		}
		orderInfo.setStatus(OrderStatusEnum.WAITING_FOR_RECEIPT.getCode());
		orderInfo.setDeliverTime(LocalDateTime.now());
		// 更新订单
		if (baseMapper.updateById(orderInfo) <= 0) {
			throw new HxBusinessException("更新订单状态失败");
		}
		// 更新订单项状态
		if (!orderItemService.updateBatchById(orderItemEntityList)) {
			throw new HxBusinessException("更新订单状态失败");
		}
		String logisticsUrl = String.format(MallOrderConstants.NOTIFY_LOGISTICS_URL,
				callbackPrefixProperties.getLogistics(), orderDelivery.getId(), orderDelivery.getTenantId());

		kuaidi100Utils.poll(orderDelivery.getLogisticsCompanyCode(), orderDelivery.getLogisticsNo(),
				orderInfo.getRecipientProvince() + orderInfo.getRecipientCity() + orderInfo.getRecipientArea(),
				orderConfig.getKuaidi100AppKey(), orderConfig.getNotifyUrl() + logisticsUrl,
				orderInfo.getRecipientPhone(), orderDelivery.getDeliveryNo());
		// todo 小程序订单 对接微信小程序发货 暂时固定对接自提类型
		if (StringUtils.hasText(orderInfo.getTradeType())
				&& orderInfo.getTradeType().equals(PayTradeTypeEnum.WX_JSAPI_PAY.getName())
				&& orderInfo.getPaymentType().equals(PayConstants.PAY_TYPE_1)
				&& orderConfig.getWxDeliveryStatus().equals(CommonConstants.NORMAL_STATUS)) {
			WxMaOrderShippingInfoUploadRequest wxMaOrderShippingInfoUploadRequest = new WxMaOrderShippingInfoUploadRequest();
			OrderKeyBean orderKeyBean = new OrderKeyBean();
			orderKeyBean.setOrderNumberType(2);
			orderKeyBean.setTransactionId(orderInfo.getTransactionId());
			wxMaOrderShippingInfoUploadRequest.setOrderKey(orderKeyBean);
			wxMaOrderShippingInfoUploadRequest.setLogisticsType(4);
			wxMaOrderShippingInfoUploadRequest.setIsAllDelivered(false);
			if (orderInfo.getStatus().equals(OrderStatusEnum.WAITING_FOR_RECEIPT.getCode())) {
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern(DatePattern.UTC_MS_WITH_XXX_OFFSET_PATTERN);
				String uploadTime = ZonedDateTime.now().format(formatter);
				wxMaOrderShippingInfoUploadRequest.setUploadTime(uploadTime);
				List<ShippingListBean> shippingListBeanList = new ArrayList<>();

				ShippingListBean shippingListBean = new ShippingListBean();
				String spuName = Optional.ofNullable(orderItemEntityList.get(0).getSpuName())
					.map(name -> name.length() > 120 ? name.substring(0, 120) : name)
					.orElse("");
				shippingListBean.setItemDesc(spuName);
				shippingListBeanList.add(shippingListBean);

				wxMaOrderShippingInfoUploadRequest.setShippingList(shippingListBeanList);
				wxMaOrderShippingInfoUploadRequest.setPayer(new PayerBean(orderInfo.getOpenId()));

				remoteSecOrderService.uploadShippingInfo(wxMaOrderShippingInfoUploadRequest, orderInfo.getAppId());
			}
		}

		return true;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public String cancelOrder(OrderInfo orderInfo) {
		if (OrderStatusEnum.WAITING_FOR_PAYMENT.getCode().equals(orderInfo.getStatus())) {
			orderInfo.setStatus(OrderStatusEnum.CANCELED.getCode());
			orderInfo.setCancelTime(LocalDateTime.now());
			baseMapper.updateById(orderInfo);

			// 回滚优惠券
			if (StringUtils.hasText(orderInfo.getCouponUserId())) {
				CouponUserReqDTO couponUserReqDTO = new CouponUserReqDTO();
				couponUserReqDTO.setId(orderInfo.getCouponUserId());
				couponUserReqDTO.setCouponUserStatusEnum(CouponUserStatusEnum.STATUS_0);
				remoteCouponUserService.updateCouponUserStatus(couponUserReqDTO);
			}
			List<OrderItemEntity> orderItemEntityList = orderItemMapper
				.selectList(Wrappers.<OrderItemEntity>lambdaQuery().eq(OrderItemEntity::getOrderId, orderInfo.getId()));

			List<GoodsSkuStockReqDTO> goodsSkuStockRqDTOList = orderItemEntityList.stream().map(orderItem -> {
				GoodsSkuStockReqDTO goodsSkuStockRqDTO = new GoodsSkuStockReqDTO();
				goodsSkuStockRqDTO.setStockNum(orderItem.getBuyQuantity());
				goodsSkuStockRqDTO.setSkuId(orderItem.getSkuId());
				goodsSkuStockRqDTO.setSpuId(orderItem.getSpuId());
				return goodsSkuStockRqDTO;
			}).collect(Collectors.toList());
			// 回滚库存
			remoteGoodsSkuService.rollbackStock(goodsSkuStockRqDTOList);

		}
		return orderInfo.getId();
	}

	@Override
	public BigDecimal getPaySumStatistics(OrderInfoDTO orderInfoDTO) {
		return baseMapper.selectPaySumStatistics(orderInfoDTO);
	}

	@Override
	public IPage<OrderInfo> apiPage(Page page, OrderInfo orderInfo) {
		return baseMapper.selectApiPage(page, orderInfo);
	}

	@Override
	@GlobalTransactional
	public OrderInfo createOrder(CreateOrderDTO createOrderDTO) {
		List<OrderInfo> orderInfoList = new ArrayList<>();

		// 查询用户信息
		UserInfoVO userInfo = remoteMallUserService.getUserById(createOrderDTO.getUserId());
		if (Objects.isNull(userInfo)) {
			throw new HxBusinessException(MallErrorCodeEnum.ERROR_50001.getMsg());
		}
		List<String> skuIds = createOrderDTO.getSkuReqList()
			.stream()
			.map(CreateOrderSkuReqDTO::getSkuId)
			.collect(Collectors.toList());
		// 查询购买商品
		List<GoodsSku> goodsSkuList = remoteGoodsSkuService.getBySkuIds(skuIds);
		if (CollectionUtils.isEmpty(goodsSkuList)) {
			throw new HxBusinessException(MallErrorCodeEnum.ERROR_60008.getCode(),
					MallErrorCodeEnum.ERROR_60008.getMsg());
		}

		// 生成订单
		OrderInfo orderInfo = generateOrder(createOrderDTO);
		// 生成订单商品
		List<OrderItemEntity> orderItemEntityList = generateOrderItems(goodsSkuList, createOrderDTO.getSkuReqList());

		// 创建订单前 Before
		computeOrderPrice(orderInfo, orderItemEntityList);
		// 1. 校验库存扣减库存
		orderStockHandler(goodsSkuList, orderItemEntityList);
		// 2. 计算优惠券优惠金额
		orderCouponHandler(orderInfo, orderItemEntityList);

		// 5. 物流运费计算
		if (MallOrderConstants.DELIVERY_WAY_1.equals(orderInfo.getDeliveryWay())) {
			// 查询用户收货地址
			UserAddress userAddress = remoteUserAddressService.getById(createOrderDTO.getUserAddressId());
			if (ObjectUtil.isNull(userAddress)) {
				throw new HxBusinessException(MallErrorCodeEnum.ERROR_50002.getCode(),
						MallErrorCodeEnum.ERROR_50002.getMsg());
			}
			orderInfo.setRecipientName(userAddress.getRecipientName());
			orderInfo.setRecipientPhone(userAddress.getTelephone());
			orderInfo.setRecipientProvince(userAddress.getProvinceName());
			orderInfo.setRecipientCity(userAddress.getCityName());
			orderInfo.setRecipientArea(userAddress.getAreaName());
			orderInfo.setRecipientProvinceCode(userAddress.getProvinceCode());
			orderInfo.setRecipientCityCode(userAddress.getCityCode());
			orderInfo.setRecipientAreaCode(userAddress.getAreaCode());
			orderInfo.setRecipientAddress(userAddress.getDetailAddress());
			// 计算运费
			orderFreightHandler(orderInfo, orderItemEntityList, goodsSkuList);
		}
		// 创建订单
		if (!super.save(orderInfo)) {
			throw new HxBusinessException(MallErrorCodeEnum.ERROR_60007.getCode(),
					MallErrorCodeEnum.ERROR_60007.getMsg());
		}
		orderInfoList.add(orderInfo);
		orderItemEntityList.forEach(orderItem -> orderItem.setOrderId(orderInfo.getId()));
		orderItemService.saveBatch(orderItemEntityList);
		// 创建订单后
		// 1. 清除购物车 2. 发送延迟取消订单mq消息 3. 发送微信小程序模板消息
		applicationEventPublisher.publishEvent(
				new HxOrderCreateAfterEvent(this, orderInfo, orderItemEntityList, createOrderDTO.getCreateWay()));
		return orderInfo;
	}

	private void orderFreightHandler(OrderInfo orderInfo, List<OrderItemEntity> orderItemEntityList,
			List<GoodsSku> goodsSkuList) {
		Map<String, GoodsSku> skuMap = goodsSkuList.stream().collect(Collectors.toMap(GoodsSku::getId, v -> v));

		for (OrderItemEntity orderItemEntity : orderItemEntityList) {
			GoodsSku goodsSku = skuMap.get(orderItemEntity.getSkuId());
			GoodsSpu goodsSpu = goodsSku.getGoodsSpu();
			BigDecimal freightPrice = BigDecimal.ZERO;

			if (ProductConstants.FREIGHT_TYPE_1.equals(goodsSpu.getFreightType())) {
				// 固定运费 * 数量
				freightPrice = goodsSpu.getFixedFreightPrice()
					.multiply(BigDecimal.valueOf(orderItemEntity.getBuyQuantity()));
				orderItemEntity.setFreightPrice(freightPrice);
			}
			computeItemPayPrice(orderItemEntity);

		}
		computeOrderPrice(orderInfo, orderItemEntityList);
	}

	private void orderStockHandler(List<GoodsSku> goodsSkuList, List<OrderItemEntity> orderItemEntityList) {

		List<GoodsSku> skuList = goodsSkuList.stream()
			.filter(goodsSku -> goodsSku.getStock() >= orderItemEntityList.stream()
				.filter(skuReq -> skuReq.getSkuId().equals(goodsSku.getId()))
				.findFirst()
				.get()
				.getBuyQuantity())
			.toList();
		if (CollUtil.isEmpty(skuList) || skuList.size() < orderItemEntityList.size()) {
			throw new HxBusinessException(MallErrorCodeEnum.ERROR_60008.getCode(),
					MallErrorCodeEnum.ERROR_60008.getMsg());
		}
		// 扣减库存
		boolean result = remoteGoodsSkuService.reduceStock(orderItemEntityList.stream().map(v -> {
			GoodsSkuStockReqDTO goodsSkuStockReqDTO = new GoodsSkuStockReqDTO();
			goodsSkuStockReqDTO.setSkuId(v.getSkuId());
			goodsSkuStockReqDTO.setStockNum(v.getBuyQuantity());
			goodsSkuStockReqDTO.setSpuId(v.getSpuId());
			return goodsSkuStockReqDTO;
		}).toList());
		if (!result) {
			throw new HxBusinessException(MallErrorCodeEnum.ERROR_60008.getCode(),
					MallErrorCodeEnum.ERROR_60008.getMsg());
		}

	}

	// 计算订单金额
	private void computeOrderPrice(OrderInfo orderInfo, List<OrderItemEntity> orderItemEntityList) {
		BigDecimal totalPrice = BigDecimal.ZERO;
		BigDecimal paymentPrice = BigDecimal.ZERO;
		BigDecimal freightPrice = BigDecimal.ZERO;
		BigDecimal couponPrice = BigDecimal.ZERO;

		for (OrderItemEntity orderItemEntity : orderItemEntityList) {
			totalPrice = totalPrice.add(orderItemEntity.getTotalPrice());
			freightPrice = freightPrice.add(orderItemEntity.getFreightPrice());
			couponPrice = couponPrice.add(orderItemEntity.getCouponPrice());
			paymentPrice = paymentPrice.add(orderItemEntity.getPaymentPrice());
		}

		orderInfo.setTotalPrice(totalPrice)
			.setPaymentPrice(paymentPrice)
			.setFreightPrice(freightPrice)
			.setCouponPrice(couponPrice);

	}

	// 计算订单商品支付金额
	private void computeItemPayPrice(OrderItemEntity orderItemEntity) {
		BigDecimal itemRealPrice = orderItemEntity.getTotalPrice().subtract(orderItemEntity.getCouponPrice());

		if (itemRealPrice.compareTo(BigDecimal.ZERO) < 0) {
			itemRealPrice = BigDecimal.ZERO;
		}

		orderItemEntity.setPaymentPrice(itemRealPrice.add(orderItemEntity.getFreightPrice()));

	}

	/**
	 * 使用优惠券
	 * @param orderInfo
	 * @param orderItemEntityList
	 */
	private void orderCouponHandler(OrderInfo orderInfo, List<OrderItemEntity> orderItemEntityList) {
		if (!StringUtils.hasText(orderInfo.getCouponUserId())) {
			return;
		}
		// 优惠券优惠金额
		BigDecimal couponTotalAmount = BigDecimal.ZERO;
		// 可使用优惠券的商品总金额
		BigDecimal totalPrice = BigDecimal.ZERO;
		// 优惠券可使用指定商品
		List<OrderItemEntity> listCouponGoods = null;
		// 优惠券可用范围
		String couponUseRange = MallEventConstants.USE_RANGE_1;
		// 校验优惠券
		CouponUserRespVO couponUserRespVO = remoteCouponUserService.getById(orderInfo.getCouponUserId());
		if (Objects.isNull(couponUserRespVO)) {
			throw new HxBusinessException(MallErrorCodeEnum.ERROR_60060.getCode(),
					MallErrorCodeEnum.ERROR_60060.getMsg());
		}
		CouponInfo couponInfo = couponUserRespVO.getCouponInfo();
		couponUseRange = couponInfo.getUseRange();
		// 指定商品
		if (MallEventConstants.USE_RANGE_2.equals(couponInfo.getUseRange())) {
			List<CouponGoods> couponGoodsList = couponUserRespVO.getCouponGoodsList();
			if (CollUtil.isEmpty(couponGoodsList)) {
				throw new HxBusinessException(MallErrorCodeEnum.ERROR_60060.getCode(),
						MallErrorCodeEnum.ERROR_60060.getMsg());
			}
			// 过滤指定商品
			listCouponGoods = orderItemEntityList.stream()
				.map(map -> couponGoodsList.stream()
					.filter(m -> Objects.equals(m.getSpuId(), map.getSpuId()))
					.findFirst()
					.map(m -> {
						return map;
					})
					.orElse(null))
				.filter(Objects::nonNull)
				.collect(Collectors.toList());
			// 验证优惠券 并计算 可使用优惠券的订单总金额
			totalPrice = this.verifyCoupon(listCouponGoods, couponUserRespVO);
		}
		else {
			// 验证优惠券 并计算 可使用优惠券的订单总金额
			totalPrice = this.verifyCoupon(orderItemEntityList, couponUserRespVO);
		}
		// 计算优惠券优惠金额
		couponTotalAmount = this.couponCompute(totalPrice, couponUserRespVO, couponInfo);
		for (OrderItemEntity orderItemEntity : orderItemEntityList) {
			// 计算优惠券
			BigDecimal couponPrice = BigDecimal.ZERO;
			if (couponTotalAmount.compareTo(BigDecimal.ZERO) > 0) {
				boolean isComputeCoupon = true;
				// 指定商品使用 校验本次循环商品是否满足
				if (MallEventConstants.USE_RANGE_2.equals(couponUseRange)) {
					isComputeCoupon = listCouponGoods.stream()
						.anyMatch(a -> a.getSkuId().equals(orderItemEntity.getSkuId()));
				}
				if (isComputeCoupon) {
					// 单个明细金额占比
					BigDecimal oneMoneyScope = orderItemEntity.getTotalPrice()
						.divide(totalPrice, 2, RoundingMode.HALF_EVEN);
					// 分配优惠券金额按比例 优惠金额末位舍0进1
					couponPrice = oneMoneyScope.multiply(couponTotalAmount).setScale(2, RoundingMode.HALF_EVEN);
					// 如果分配比例大于金额 则等于金额
					if (couponPrice.compareTo(orderItemEntity.getTotalPrice()) > 0) {
						couponPrice = orderItemEntity.getTotalPrice();
					}
					// 优惠金额去除本次优惠金额
					couponTotalAmount = couponTotalAmount.subtract(couponPrice);
					// 总金额减去本次商品金额
					totalPrice = totalPrice.subtract(orderItemEntity.getTotalPrice());
				}
			}
			orderItemEntity.setCouponPrice(couponPrice);
			computeItemPayPrice(orderItemEntity);
		}
		computeOrderPrice(orderInfo, orderItemEntityList);
	}

	private BigDecimal verifyCoupon(List<OrderItemEntity> listCouponGoods, CouponUserRespVO couponUserRespVO) {
		List<OrderItemEntity> orderItemEntities = listCouponGoods;
		if (!couponUserRespVO.getStatus().equals(CouponUserStatusEnum.STATUS_0.getCode())) {
			throw new HxBusinessException(MallErrorCodeEnum.ERROR_60061.getCode(),
					MallErrorCodeEnum.ERROR_60061.getMsg());
		}
		if (couponUserRespVO.getValidatTime().isBefore(LocalDateTime.now())) {
			throw new HxBusinessException(MallErrorCodeEnum.ERROR_60060.getCode(),
					MallErrorCodeEnum.ERROR_60060.getMsg());
		}

		AtomicReference<BigDecimal> atomicTotalPrice = new AtomicReference<>(BigDecimal.ZERO);
		orderItemEntities.forEach(orderItem -> {
			Integer quantity = listCouponGoods.stream()
				.filter(tree -> tree.getSkuId().equals(orderItem.getSkuId()))
				.toList()
				.get(0)
				.getBuyQuantity();
			atomicTotalPrice.updateAndGet(
					v -> atomicTotalPrice.get().add(orderItem.getSalesPrice().multiply(BigDecimal.valueOf(quantity))));
		});
		return atomicTotalPrice.get();
	}

	// 计算优惠券
	public BigDecimal couponCompute(BigDecimal totalPrice, CouponUserRespVO couponUser, CouponInfo couponInfo) {

		if (!couponUser.getStatus().equals(CouponUserStatusEnum.STATUS_0.getCode())) {
			throw new HxBusinessException(MallErrorCodeEnum.ERROR_60061.getCode(),
					MallErrorCodeEnum.ERROR_60061.getMsg());
		}
		if (couponUser.getValidatTime().isBefore(LocalDateTime.now())) {
			throw new HxBusinessException(MallErrorCodeEnum.ERROR_60060.getCode(),
					MallErrorCodeEnum.ERROR_60060.getMsg());
		}

		if (couponInfo.getThreshold().compareTo(BigDecimal.ZERO) > 0
				&& totalPrice.compareTo(couponInfo.getThreshold()) < 0) {
			throw new HxBusinessException(MallErrorCodeEnum.ERROR_60060.getCode(),
					MallErrorCodeEnum.ERROR_60060.getMsg());
		}
		couponUser.setStatus(CouponUserStatusEnum.STATUS_3.getCode());

		if (MallEventConstants.COUPON_TYPE_1.equals(couponInfo.getCouponType())) {
			// 满减
			return couponInfo.getAmount();
		}
		else if (MallEventConstants.COUPON_TYPE_2.equals(couponInfo.getCouponType())) {
			// 折扣
			BigDecimal discount = couponInfo.getDiscount().divide(BigDecimal.valueOf(10), 2, RoundingMode.HALF_EVEN);
			// 优惠后金额
			return totalPrice.subtract(totalPrice.multiply(discount));
		}
		else {
			return BigDecimal.ZERO;
		}
	}

	private List<OrderItemEntity> generateOrderItems(List<GoodsSku> goodsSkuList,
			List<CreateOrderSkuReqDTO> skuReqList) {
		return goodsSkuList.stream().map(sku -> {
			BigDecimal salesPrice = sku.getSalesPrice();
			CreateOrderSkuReqDTO placeOrderSku = skuReqList.stream()
				.filter(tree -> tree.getSkuId().equals(sku.getId()))
				.toList()
				.get(0);
			GoodsSpu goodsSpu = sku.getGoodsSpu();
			OrderItemEntity orderItemEntity = new OrderItemEntity();
			orderItemEntity.setBuyQuantity(placeOrderSku.getQuantity());
			orderItemEntity.setSpuName(goodsSpu.getName());
			orderItemEntity.setSpuId(goodsSpu.getId());
			orderItemEntity.setSkuId(sku.getId());
			orderItemEntity.setPicUrl(goodsSpu.getSpuUrls()[0]);
			orderItemEntity.setSalesPrice(salesPrice);
			orderItemEntity.setTotalPrice(
					orderItemEntity.getSalesPrice().multiply(BigDecimal.valueOf(placeOrderSku.getQuantity())));
			orderItemEntity.setFreightPrice(BigDecimal.ZERO);
			orderItemEntity.setCouponPrice(BigDecimal.ZERO);
			orderItemEntity.setPaymentPrice(orderItemEntity.getTotalPrice());
			// TODO 是否改为前端传？？
			List<GoodsSkuSpecsValue> goodsSkuSpecsValues = remoteGoodsSkuService
				.selectGoodsSkuSpecsValueList(sku.getId());
			if (!CollectionUtils.isEmpty(goodsSkuSpecsValues)) {
				orderItemEntity.setSpecsInfo(goodsSkuSpecsValues.stream()
					.map(GoodsSkuSpecsValue::getSpecsValueName)
					.collect(Collectors.joining("；")));
				orderItemEntity.setPicUrl(!StringUtils.hasText(goodsSkuSpecsValues.get(0).getPicUrl())
						? goodsSpu.getSpuUrls()[0] : goodsSkuSpecsValues.get(0).getPicUrl());
			}
			return orderItemEntity;
		}).collect(Collectors.toList());

	}

	private OrderInfo generateOrder(CreateOrderDTO createOrderDTO) {
		OrderInfo orderInfo = new OrderInfo();
		BeanUtil.copyProperties(createOrderDTO, orderInfo);
		orderInfo.setAppraiseStatus(CommonConstants.NO);
		orderInfo.setOrderNo(SnowflakeIdUtils.orderNo());
		orderInfo.setPaymentPrice(BigDecimal.ZERO);
		orderInfo.setStatus(OrderStatusEnum.WAITING_FOR_PAYMENT.getCode());
		orderInfo.setTotalPrice(BigDecimal.ZERO);
		orderInfo.setFreightPrice(BigDecimal.ZERO);
		orderInfo.setCouponPrice(BigDecimal.ZERO);
		orderInfo.setPayStatus(CommonConstants.NO);
		orderInfo.setCouponUserId(createOrderDTO.getCouponUserId());
		orderInfo.setOpenId(createOrderDTO.getOpenId());
		return orderInfo;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public boolean receiveOrder(OrderInfo orderInfo) {
		orderInfo.setReceiverTime(LocalDateTime.now());
		orderInfo.setStatus(OrderStatusEnum.COMPLETED.getCode());
		baseMapper.updateById(orderInfo);
		List<OrderItemEntity> orderItemEntityList = orderItemMapper.selectByOrderId(orderInfo.getId());
		orderItemEntityList.forEach(orderItem -> {
			if (orderItem.getStatus().equals(OrderItemStatusEnum.SHIPPED.getCode())) {
				orderItem.setStatus(OrderItemStatusEnum.COMPLETED.getCode());
			}
		});

		// 订单完成事件
		OrderCompleteEvent orderPaySuccessEvent = new OrderCompleteEvent();
		orderPaySuccessEvent.setOrderId(orderInfo.getId());
		orderPaySuccessEvent.setTenantId(orderInfo.getTenantId());
		orderPaySuccessEvent.setUserId(orderInfo.getUserId());
		orderPaySuccessEvent.setOrderNo(orderInfo.getOrderNo());

		if (StringUtils.hasText(orderInfo.getTradeType())
				&& orderInfo.getTradeType().equals(PayTradeTypeEnum.WX_JSAPI_PAY.getName())
				&& orderInfo.getDeliveryWay().equals(MallOrderConstants.DELIVERY_WAY_2)
				&& orderInfo.getPaymentType().equals(PayConstants.PAY_TYPE_1)) {

			OrderConfig orderConfig = orderConfigService.getConfig();
			if (Objects.nonNull(orderConfig)
					&& orderConfig.getWxDeliveryStatus().equals(CommonConstants.NORMAL_STATUS)) {
				WxMaOrderShippingInfoUploadRequest wxMaOrderShippingInfoUploadRequest = new WxMaOrderShippingInfoUploadRequest();
				OrderKeyBean orderKeyBean = new OrderKeyBean();
				orderKeyBean.setOrderNumberType(2);
				orderKeyBean.setTransactionId(orderInfo.getTransactionId());
				wxMaOrderShippingInfoUploadRequest.setOrderKey(orderKeyBean);
				wxMaOrderShippingInfoUploadRequest.setLogisticsType(4);
				wxMaOrderShippingInfoUploadRequest.setIsAllDelivered(false);
				wxMaOrderShippingInfoUploadRequest.setDeliveryMode(1);
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern(DatePattern.UTC_MS_WITH_XXX_OFFSET_PATTERN);
				String uploadTime = ZonedDateTime.now().format(formatter);
				wxMaOrderShippingInfoUploadRequest.setUploadTime(uploadTime);
				List<ShippingListBean> shippingListBeanList = new ArrayList<>();

				ShippingListBean shippingListBean = new ShippingListBean();
				String spuName = Optional.ofNullable(orderItemEntityList.get(0).getSpuName())
					.map(name -> name.length() > 120 ? name.substring(0, 120) : name)
					.orElse("");
				shippingListBean.setItemDesc(spuName);
				shippingListBeanList.add(shippingListBean);

				wxMaOrderShippingInfoUploadRequest.setShippingList(shippingListBeanList);
				wxMaOrderShippingInfoUploadRequest.setPayer(new PayerBean(orderInfo.getOpenId()));

				remoteSecOrderService.uploadShippingInfo(wxMaOrderShippingInfoUploadRequest, orderInfo.getAppId());
			}

		}
		rocketMQTemplate.syncSend(RocketMqConstants.ORDER_COMPLETE_NOTIFY_TOPIC,
				new GenericMessage<>(orderPaySuccessEvent), RocketMqConstants.TIME_OUT);
		return Boolean.TRUE;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public Result<Object> prepay(PrepayDTO prepayDTO) {
		OrderConfig orderConfig = orderConfigService.getConfig();
		if (Objects.isNull(orderConfig)) {
			throw new HxBusinessException("订单配置不存在");
		}
		String tradeType = prepayDTO.getTradeType();
		String payType = prepayDTO.getPaymentType();
		String returnUrl = prepayDTO.getReturnUrl();
		String quitUrl = prepayDTO.getQuitUrl();
		if (StrUtil.isBlank(tradeType)) {
			return Result.fail(MallErrorCodeEnum.ERROR_60001.getCode(), MallErrorCodeEnum.ERROR_60001.getMsg());
		}
		if (StrUtil.isBlank(payType)) {
			return Result.fail(MallErrorCodeEnum.ERROR_60002.getCode(), MallErrorCodeEnum.ERROR_60002.getMsg());
		}
		if (StrUtil.isBlank(orderConfig.getNotifyUrl())) {
			return Result.fail(MallErrorCodeEnum.ERROR_90001.getCode(), MallErrorCodeEnum.ERROR_90001.getMsg());
		}

		OrderInfo orderInfo = this
			.getOne(Wrappers.<OrderInfo>lambdaQuery().eq(OrderInfo::getOrderNo, prepayDTO.getOrderNo()));
		if (orderInfo == null) {
			return Result.fail(MallErrorCodeEnum.ERROR_60003.getCode(), MallErrorCodeEnum.ERROR_60003.getMsg());
		}
		// 只有未支付的详单能发起支付
		if (CommonConstants.YES.equals(orderInfo.getPayStatus())) {
			return Result.fail(MallErrorCodeEnum.ERROR_60004.getCode(), MallErrorCodeEnum.ERROR_60004.getMsg());
		}
		CreateOrderReqDTO payDTO = new CreateOrderReqDTO();
		if (orderInfo.getPaymentPrice().compareTo(BigDecimal.ZERO) == 0) {
			tradeType = PayTradeTypeEnum.FREE_PAY.getName();
			payType = PayConstants.PAY_TYPE_0;
		}
		else {
			payDTO.setTradeType(prepayDTO.getTradeType());
		}

		String body = "商城购物";
		CreateOrderReqDTO createOrderReqDTO = new CreateOrderReqDTO();
		createOrderReqDTO.setTradeType(tradeType);
		createOrderReqDTO.setSubject(body);
		createOrderReqDTO.setBuyerId(SecurityUtils.getUser().getOpenId());
		createOrderReqDTO.setTotalAmount(String.valueOf(orderInfo.getPaymentPrice()));
		createOrderReqDTO.setNotifyUrl(orderConfig.getNotifyUrl());
		createOrderReqDTO.setOutTradeNo(orderInfo.getOrderNo());
		createOrderReqDTO.setQuitUrl(quitUrl);
		createOrderReqDTO.setReturnUrl(returnUrl);
		JSONObject extraParams = new JSONObject();
		extraParams.put(PayConstants.EXTRA_PARAMS_PAY_TYPE, payType);
		extraParams.put("mqNotifyUrl", RocketMqConstants.PAY_NOTIFY_TOPIC);
		createOrderReqDTO.setExtra(extraParams.toJSONString());
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("orderNo", orderInfo.getOrderNo());
		resultMap.put("payParams", remotePayService.createOrder(createOrderReqDTO));
		return Result.success(resultMap);
	}

	@Override
	public boolean appraiseOrder(String id, List<OrderAppraiseDTO> orderAppraiseList) {

		String userId = SecurityUtils.getUser().getUserId();
		// 查询订单
		OrderInfo orderInfo = this.getById(id);
		if (Objects.isNull(orderInfo)) {
			return false;
		}
		if (!orderInfo.getAppraiseStatus().equals(CommonConstants.NO)) {
			throw new HxBusinessException("订单已评价");
		}
		// 查询用户信息
		UserInfoVO userInfo = remoteMallUserService.getUserById(userId);
		if (Objects.isNull(userInfo)) {
			throw new HxBusinessException(MallErrorCodeEnum.ERROR_50001.getMsg());
		}

		List<GoodsAppraise> goodsAppraiseList = orderAppraiseList.stream().map(v -> {
			GoodsAppraise goodsAppraise = new GoodsAppraise();
			BeanUtil.copyProperties(v, goodsAppraise);
			goodsAppraise.setUserId(userId);
			goodsAppraise.setAvatarUrl(userInfo.getAvatarUrl());
			goodsAppraise.setNickName(userInfo.getNickName());
			return goodsAppraise;
		}).collect(Collectors.toList());

		if (!remoteGoodsAppraiseService.addGoodsAppraise(goodsAppraiseList)) {
			throw new HxBusinessException("订单评价失败");
		}

		// 修改订单评价状态
		orderInfo.setAppraiseStatus(CommonConstants.YES);
		return this.updateById(orderInfo);
	}

	@Override
	public List<Map<String, Object>> statistics() {
		List<Map<String, Object>> reList = new ArrayList<>();
		// 当前时间
		LocalDateTime now = LocalDateTime.now();
		for (int i = 11; i >= 0; i--) {
			LocalDateTime offset = LocalDateTimeUtil.offset(now, -i, ChronoUnit.MONTHS);
			int year = offset.getYear();
			Month month = offset.getMonth();
			LocalDateTime startOfMonth = LocalDateTime.of(year, month, 1, 0, 0, 0);
			LocalDateTime endOfMonth = startOfMonth.withDayOfMonth(month.length(false))
				.withHour(23)
				.withMinute(59)
				.withSecond(59);
			Map<String, Object> rtMap = new HashMap<>();
			OrderInfoDTO orderInfoDTO = new OrderInfoDTO();
			orderInfoDTO.setPayStatus(CommonConstants.YES);
			orderInfoDTO.setPaymentType(MallOrderConstants.PAYMENT_TYPE_1);
			orderInfoDTO.setBeginTime(startOfMonth);
			orderInfoDTO.setEndTime(endOfMonth);
			BigDecimal wxPaySum = baseMapper.selectPaySumStatistics(orderInfoDTO);

			orderInfoDTO.setPaymentType(MallOrderConstants.PAYMENT_TYPE_2);
			BigDecimal aliPaySum = baseMapper.selectPaySumStatistics(orderInfoDTO);
			rtMap.put("wxCount", wxPaySum);
			rtMap.put("aliCount", aliPaySum);
			rtMap.put("date", LocalDateTimeUtil.format(offset, DatePattern.NORM_MONTH_PATTERN));
			reList.add(rtMap);
		}
		return reList;
	}

	@Override
	public OrderInfo settlementOrder(SettlementOrderDTO settlementOrderDTO) {
		// 查询用户信息
		UserInfoVO userInfo = remoteMallUserService.getUserById(settlementOrderDTO.getUserId());
		if (Objects.isNull(userInfo)) {
			throw new HxBusinessException(MallErrorCodeEnum.ERROR_50001.getMsg());
		}
		List<String> skuIds = settlementOrderDTO.getSkuReqList()
			.stream()
			.map(CreateOrderSkuReqDTO::getSkuId)
			.collect(Collectors.toList());
		// 查询购买商品
		List<GoodsSku> goodsSkuList = remoteGoodsSkuService.getBySkuIds(skuIds);
		if (CollectionUtils.isEmpty(goodsSkuList)) {
			throw new HxBusinessException(MallErrorCodeEnum.ERROR_60008.getCode(),
					MallErrorCodeEnum.ERROR_60008.getMsg());
		}

		// 生成订单
		OrderInfo orderInfo = new OrderInfo();
		BeanUtil.copyProperties(settlementOrderDTO, orderInfo);
		orderInfo.setTotalPrice(BigDecimal.ZERO);
		orderInfo.setFreightPrice(BigDecimal.ZERO);
		orderInfo.setCouponPrice(BigDecimal.ZERO);
		orderInfo.setPayStatus(CommonConstants.NO);
		orderInfo.setCouponUserId(settlementOrderDTO.getCouponUserId());

		// 生成订单商品
		List<OrderItemEntity> orderItemEntityList = generateOrderItems(goodsSkuList,
				settlementOrderDTO.getSkuReqList());

		// 1.创建订单前 Before
		computeOrderPrice(orderInfo, orderItemEntityList);
		// 2. 计算优惠券优惠金额
		orderCouponHandler(orderInfo, orderItemEntityList);
		// 5.计算运费
		if (MallOrderConstants.DELIVERY_WAY_1.equals(orderInfo.getDeliveryWay())
				&& StringUtils.hasText(settlementOrderDTO.getUserAddressId())) {
			// 查询用户收货地址
			UserAddress userAddress = remoteUserAddressService.getById(settlementOrderDTO.getUserAddressId());
			if (ObjectUtil.isNull(userAddress)) {
				throw new HxBusinessException(MallErrorCodeEnum.ERROR_50002.getCode(),
						MallErrorCodeEnum.ERROR_50002.getMsg());
			}
			orderInfo.setRecipientName(userAddress.getRecipientName());
			orderInfo.setRecipientPhone(userAddress.getTelephone());
			orderInfo.setRecipientProvince(userAddress.getProvinceName());
			orderInfo.setRecipientCity(userAddress.getCityName());
			orderInfo.setRecipientArea(userAddress.getAreaName());
			orderInfo.setRecipientProvinceCode(userAddress.getProvinceCode());
			orderInfo.setRecipientCityCode(userAddress.getCityCode());
			orderInfo.setRecipientAreaCode(userAddress.getAreaCode());
			orderInfo.setRecipientAddress(userAddress.getDetailAddress());

			orderFreightHandler(orderInfo, orderItemEntityList, goodsSkuList);
		}
		orderInfo.setOrderItemList(orderItemEntityList);
		return orderInfo;
	}

	@Override
	public Map<String, Object> merchantStatistics(OrderStatisticsDTO request) {
		Map<String, Object> rtMap = new HashMap<>();
		// 实收金额
		rtMap.put("orderAmount", baseMapper.selectPayAmount(request));
		// 交易笔数
		rtMap.put("orderCount", baseMapper.selectPayCount(request));
		// 退款金额
		rtMap.put("refundAmount", orderRefundMapper.selectRefundAmount(request));
		// 退款笔数
		rtMap.put("refundCount", orderRefundMapper.selectRefundCount(request));
		return rtMap;
	}

	@Override
	public List<OrderStatisticsVO> payTypeStatistics(OrderStatisticsDTO orderStatisticsDTO) {
		return baseMapper.payTypeStatistics(orderStatisticsDTO);
	}

	@Override
	public List<OrderStatisticsVO> channelTypeStatistics(OrderStatisticsDTO orderStatisticsDTO) {
		return baseMapper.channelTypeStatistics(orderStatisticsDTO);
	}

	@Override
	public boolean autoAppraiseOrder(OrderInfo orderInfo) {
		// 查询订单
		if (Objects.isNull(orderInfo)) {
			return true;
		}
		if (!orderInfo.getAppraiseStatus().equals(CommonConstants.NO)) {
			return true;
		}
		// 查询用户信息
		UserInfoVO userInfo = remoteMallUserService.getUserById(orderInfo.getUserId());
		if (Objects.isNull(userInfo)) {
			throw new HxBusinessException(MallErrorCodeEnum.ERROR_50001.getMsg());
		}
		// 查询订单项
		List<OrderItemEntity> orderItemEntityList = orderItemMapper.selectByOrderId(orderInfo.getId());

		List<GoodsAppraise> goodsAppraiseList = orderItemEntityList.stream().map(v -> {
			GoodsAppraise goodsAppraise = new GoodsAppraise();
			goodsAppraise.setUserId(orderInfo.getUserId());
			goodsAppraise.setAvatarUrl(userInfo.getAvatarUrl());
			goodsAppraise.setNickName(userInfo.getNickName());
			goodsAppraise.setGoodsScore(5);
			goodsAppraise.setOrderId(orderInfo.getId());
			goodsAppraise.setOrderItemId(v.getId());
			goodsAppraise.setContent("系统默认评价");
			return goodsAppraise;
		}).collect(Collectors.toList());

		if (!remoteGoodsAppraiseService.addGoodsAppraise(goodsAppraiseList)) {
			throw new HxBusinessException("订单评价失败");
		}

		// 修改订单评价状态
		orderInfo.setAppraiseStatus(CommonConstants.YES);
		return this.updateById(orderInfo);
	}

}
