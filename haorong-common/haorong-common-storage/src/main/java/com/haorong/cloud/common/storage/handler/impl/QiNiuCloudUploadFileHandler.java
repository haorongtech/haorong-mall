/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.common.storage.handler.impl;

import cn.hutool.json.JSONUtil;
import com.haorong.cloud.common.myabtis.tenant.HxTenantContextHolder;
import com.haorong.cloud.common.storage.entity.StorageConfig;
import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.Region;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.DefaultPutRet;
import com.qiniu.util.Auth;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import java.io.File;
import java.util.UUID;

/**
 * @author haorong
 */
@Component("uploadFile3")
public class QiNiuCloudUploadFileHandler extends AbstractUploadFileHandler {

	@Override
	public String doUploadFile(StorageConfig storageConfig, File file) {
		// 构造一个带指定 Region 对象的配置类
		Configuration cfg = new Configuration(Region.autoRegion());
		// ...其他参数参考类注释
		UploadManager uploadManager = new UploadManager(cfg);
		// ...生成上传凭证，然后准备上传
		String accessKey = storageConfig.getAccessKeyId();
		String secretKey = storageConfig.getAccessKeySecret();
		String bucket = storageConfig.getBucket();
		// 默认不指定key的情况下，以文件内容的hash值作为文件名
		String fileName = file.getName();
		String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
		String dir = storageConfig.getDir();
		String uuidFileName = UUID.randomUUID() + "." + suffix;
		String objectName = HxTenantContextHolder.getTenantId() + (StringUtils.hasText(dir) ? ("/" + dir) : "") + "/"
				+ uuidFileName;
		Auth auth = Auth.create(accessKey, secretKey);
		String upToken = auth.uploadToken(bucket);
		DefaultPutRet putRet = null;
		try {
			Response response = uploadManager.put(file, objectName, upToken);
			putRet = JSONUtil.toBean(response.bodyString(), DefaultPutRet.class);

		}
		catch (QiniuException e) {
			throw new RuntimeException(e);
		}
		return "http://" + storageConfig.getEndpoint() + (putRet.key.startsWith("/") ? putRet.key : "/" + putRet.key);
	}

}
