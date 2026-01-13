/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.common.core.util;

import com.haorong.cloud.common.core.constant.CommonConstants;
import lombok.*;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * 响应体
 *
 * @author haorong
 * @date 2022/6/10
 */
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
public class Result<T> implements Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 * 返回标记：成功=0，失败=1
	 */
	@Getter
	@Setter
	private int code;

	/**
	 * 返回信息
	 */
	@Getter
	@Setter
	private String msg;

	/**
	 * 数据
	 */
	@Getter
	@Setter
	private T data;

	public static <T> Result<T> success() {
		return restResult(CommonConstants.SUCCESS, null, null);
	}

	public static <T> Result<T> success(T data) {
		return restResult(CommonConstants.SUCCESS, null, data);
	}

	public static <T> Result<T> success(String msg, T data) {
		return restResult(CommonConstants.SUCCESS, msg, data);
	}

	public static <T> Result<T> fail() {
		return restResult(CommonConstants.FAIL, null, null);
	}

	public static <T> Result<T> fail(String msg) {
		return restResult(CommonConstants.FAIL, msg, null);
	}

	public static <T> Result<T> fail(T data) {
		return restResult(CommonConstants.FAIL, null, data);
	}

	public static <T> Result<T> fail(String msg, T data) {
		return restResult(CommonConstants.FAIL, msg, data);
	}

	public static <T> Result<T> fail(int code, String msg, T data) {
		return restResult(code, msg, data);
	}

	public static <T> Result<T> fail(int code, String msg) {
		return restResult(code, msg, null);
	}

	private static <T> Result<T> restResult(int code, String msg, T data) {
		Result<T> apiResult = new Result<T>();
		apiResult.setCode(code);
		apiResult.setMsg(msg);
		apiResult.setData(data);
		return apiResult;
	}

}
