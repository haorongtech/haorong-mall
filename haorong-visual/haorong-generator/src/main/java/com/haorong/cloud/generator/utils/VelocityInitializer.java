package com.haorong.cloud.generator.utils;

import java.util.Properties;

import com.haorong.cloud.common.core.constant.CommonConstants;
import org.apache.velocity.app.Velocity;

/**
 * VelocityEngine工厂
 *
 * @author ruoyi
 */
public class VelocityInitializer {

	/**
	 * 初始化vm方法
	 */
	public static void initVelocity() {
		Properties p = new Properties();
		try {
			// 加载classpath目录下的vm文件
			p.setProperty("resource.loader.file.class",
					"org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader");
			// 定义字符集
			p.setProperty(Velocity.INPUT_ENCODING, CommonConstants.UTF8);
			// 初始化Velocity引擎，指定配置Properties
			Velocity.init(p);
		}
		catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

}
