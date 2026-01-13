package com.haorong.cloud.generator.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

/**
 * 读取代码生成相关配置
 *
 * @author ruoyi
 */
@Data
@Configuration
@ConfigurationProperties(prefix = "gen")
public class GenConfig {

	/** 作者 */
	private String author;

	/** 生成包路径 */
	private String packageName;

	/** 自动去除表前缀 */
	private boolean autoRemovePre;

	/** 表前缀 */
	private String tablePrefix;

	/** 是否允许生成文件覆盖到本地（自定义路径） */
	private Boolean allowOverwrite;

}
