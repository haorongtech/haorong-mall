package com.haorong.cloud.generator;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.apache.dubbo.config.spring.context.annotation.EnableDubbo;

/**
 * 代码生成器
 *
 * @author lijx
 * @since 2025/10/22
 */
@EnableDubbo
@SpringBootApplication
public class HaorongGenApplication {

	public static void main(String[] args) {
		SpringApplication.run(HaorongGenApplication.class, args);
	}

}
