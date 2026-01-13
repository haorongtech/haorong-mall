/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.common.core.util;

import cn.hutool.core.util.StrUtil;
import cn.hutool.http.HttpUtil;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import com.haorong.cloud.common.core.entity.GeoLocation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.util.StringUtils;

/**
 * IP工具类
 *
 * @author haorong
 * @date 2022/6/10
 */
@Slf4j
public class IpUtils {

	// ip查询地址
	private static final String IP_URL = "http://whois.pconline.com.cn/ipJson.jsp";

	// 未知地址
	private static final String UNKNOWN = "未知";

	/**
	 * 太平洋通过IP获取地址信息
	 * @param ip
	 * @return
	 */
	public static String getWhoisAddress(String ip) {
		if (isPrivateIpAddress(ip)) {
			return "内网IP";
		}
		try {
			String url = IP_URL + "?ip=" + ip + "&json=true";
			// GET请求
			String returnStr = HttpUtil.createGet(url)
				.header("User-Agent", "Mozilla/4.0 compatible; MSIE 6.0; Windows NT 5.1;DigExt")
				.execute()
				.body();
			if (returnStr != null) {
				JSONObject rs = JSONUtil.parseObj(returnStr);
				String region = rs.getStr("pro");
				String city = rs.getStr("city");
				return String.format("%s %s", region, city);
			}
		}
		catch (Exception e) {
			return UNKNOWN;
		}
		return UNKNOWN;
	}

	/**
	 * 太平洋通过IP获取省市区
	 * @param ip
	 * @return
	 */
	public static GeoLocation getWhoisCity(String ip) {
		if (isPrivateIpAddress(ip)) {
			return null;
		}
		try {
			String url = IP_URL + "?ip=" + ip + "&json=true";
			// GET请求
			String returnStr = HttpUtil.createGet(url)
				.header("User-Agent", "Mozilla/4.0 compatible; MSIE 6.0; Windows NT 5.1;DigExt")
				.execute()
				.body();
			;
			if (StrUtil.isNotEmpty(returnStr)) {
				JSONObject rs = JSONUtil.parseObj(returnStr);
				String province = rs.getStr("pro");
				String city = rs.getStr("city");
				String region = rs.getStr("region");
				return new GeoLocation(province, city, region);
			}
		}
		catch (Exception e) {
			return null;
		}
		return null;
	}

	public static boolean isPrivateIpAddress(String ip) {
		if (!StringUtils.hasText(ip)) {
			return false;
		}
		if (ip.equals("127.0.0.1") || ip.equals("0:0:0:0:0:0:0:1")) {
			return true;
		}
		// Check IPv4 private ranges
		if (ip.startsWith("10.") || ip.startsWith("172.") && isBetween(ip, 16, 31) || ip.startsWith("192.168.")) {
			return true;
		}
		// Check IPv4 link-local range
		if (ip.startsWith("169.254.")) {
			return true;
		}
		// Check for IPv6 unique local addresses
		if (ip.startsWith("fd")) {
			try {
				// Ensure it's a valid fd00::/8 address
				long prefix = Long.parseUnsignedLong(ip.split(":")[0], 16);
				if ((prefix & 0xfff8_0000L) == 0xfd00_0000L) {
					return true;
				}
			}
			catch (NumberFormatException e) {
				// Not a valid fd00::/8 address
			}
		}
		return false;
	}

	private static boolean isBetween(String ipAddress, int lower, int upper) {
		String[] parts = ipAddress.split("\\.");
		if (parts.length != 4) {
			return false;
		}
		try {
			int secondOctet = Integer.parseInt(parts[1]);
			return secondOctet >= lower && secondOctet <= upper;
		}
		catch (NumberFormatException e) {
			return false;
		}
	}

}
