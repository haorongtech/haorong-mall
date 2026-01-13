/** 
  * Copyright (c) 2025 沈阳浩荣科技有限公司 
  * All rights reserved. 
  * <p> 
  * 注意： 
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。 
 
  */
package com.haorong.cloud.pay.api.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.haorong.cloud.common.core.annotation.Desensitization;
import com.haorong.cloud.common.core.desensitization.KeyDesensitization;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;

/**
 * 支付配置
 *
 * @author haorong
 * @since 2022/3/18 10:07
 */
@Data
@Schema(description = "支付配置")
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName(value = "pay_config")
public class PayConfig extends Model<PayConfig> {

	@Schema(description = "主键")
	@TableId(type = IdType.ASSIGN_ID)
	private String id;

	@Schema(description = "支付类型：1.微信；2.支付宝；")
	@NotBlank(message = "支付类型不能为空")
	private String type;

	@Schema(description = "应用ID")
	private String appId;

	@Schema(description = "商户号")
	private String mchId;

	@Schema(description = "微信支付商户密钥")
	@Desensitization(KeyDesensitization.class)
	private String mchKey;

	@Schema(description = "apiclient_cert.p12文件的绝对路径，或者如果放在项目中，请以classpath:开头指定.")
	private String keyPath;

	@Schema(description = "证书序列号")
	@Desensitization(KeyDesensitization.class)
	private String certSerialNo;

	@Schema(description = "apiV3秘钥")
	@Desensitization(KeyDesensitization.class)
	private String apiv3Key;

	@Schema(description = "apiv3 商户apiclient_key.pem")
	private String privateKeyPath;

	@Schema(description = "apiv3 商户apiclient_cert.pem")
	private String privateCertPath;

	@TableField(fill = FieldFill.INSERT)
	@Schema(description = "创建人")
	private String createBy;

	@TableField(fill = FieldFill.UPDATE)
	@Schema(description = "修改人")
	private String updateBy;

	@TableField(fill = FieldFill.INSERT)
	@Schema(description = "创建时间")
	private LocalDateTime createTime;

	@TableField(fill = FieldFill.UPDATE)
	@Schema(description = "修改时间")
	private LocalDateTime updateTime;

	@TableLogic
	@TableField(fill = FieldFill.INSERT)
	@Schema(description = "逻辑删除：0.显示；1.隐藏；")
	private String delFlag;

	@Schema(description = "支付端类型：0-小程序，1-App，2-H5，3-PC，4-公众号")
	@NotBlank(message = "支付端类型不能为空")
	private String terminalType;

	@Schema(description = "租户id")
	private String tenantId;

	@Schema(description = "微信支付公钥")
	private String publicKeyPath;

	@Schema(description = "微信支付公钥ID")
	private String publicKeyId;

}
