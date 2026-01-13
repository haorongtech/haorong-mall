/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.common.core.factory;

import org.springframework.beans.factory.config.YamlPropertiesFactoryBean;
import org.springframework.core.env.PropertiesPropertySource;
import org.springframework.core.env.PropertySource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.EncodedResource;
import org.springframework.core.io.support.PropertySourceFactory;

import java.io.IOException;
import java.util.Objects;
import java.util.Properties;

/**
 * @author haorong
 * @description 读取自定义 YAML 文件
 * @date 2024/11/25
 */

public class YamlPropertySourceFactory implements PropertySourceFactory {

	@Override
	public PropertySource<?> createPropertySource(String name, EncodedResource resource) throws IOException {
		Properties properties = loadYamlIntoProperties(resource.getResource());
		String sourceName = Objects.nonNull(name) ? name : resource.getResource().getFilename();
		return new PropertiesPropertySource(sourceName, properties);
	}

	private Properties loadYamlIntoProperties(Resource resource) throws IOException {
		if (!resource.exists()) {
			throw new IllegalArgumentException("Resource " + resource + " does not exist");
		}

		YamlPropertiesFactoryBean factory = new YamlPropertiesFactoryBean();
		factory.setResources(resource);
		factory.afterPropertiesSet();
		return factory.getObject();
	}

}
