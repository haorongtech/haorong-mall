/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.common.myabtis.config;

import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.BlockAttackInnerInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.OptimisticLockerInnerInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.PaginationInnerInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.TenantLineInnerInterceptor;
import com.haorong.cloud.common.myabtis.handler.MyMetaObjectHandler;
import com.haorong.cloud.common.myabtis.tenant.HxTenantLineHandler;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * mybatis plus 统一配置
 *
 * @author haorong
 * @since 2022/2/15 15:48
 */
@Configuration
public class MybatisPlusConfig {

	@Bean
	public HxTenantLineHandler hxTenantLineHandler() {
		return new HxTenantLineHandler();
	}

	/**
	 * 自动填充
	 * @return MyMetaObjectHandler
	 */
	@Bean
	public MyMetaObjectHandler metaObjectHandler() {
		return new MyMetaObjectHandler();
	}

	/**
	 * 使用多个功能需要注意顺序关系,建议使用如下顺序
	 *
	 * <p>
	 * 多租户,动态表名 分页,乐观锁 sql 性能规范,防止全表更新与删除 总结: 对 sql 进行单次改造的优先放入,不对 sql 进行改造的最后放入
	 *
	 * @author haorong
	 * @since 2022/2/16 15:24
	 */
	@Bean
	public MybatisPlusInterceptor mybatisPlusInterceptor() {
		MybatisPlusInterceptor interceptor = new MybatisPlusInterceptor();
		// 多租户插件
		TenantLineInnerInterceptor tenantLineInnerInterceptor = new TenantLineInnerInterceptor();
		tenantLineInnerInterceptor.setTenantLineHandler(hxTenantLineHandler());
		interceptor.addInnerInterceptor(tenantLineInnerInterceptor);
		// 分页插件
		interceptor.addInnerInterceptor(new PaginationInnerInterceptor(DbType.MYSQL));
		// 乐观锁
		interceptor.addInnerInterceptor(new OptimisticLockerInnerInterceptor());
		// 防止全表更新与删除
		interceptor.addInnerInterceptor(new BlockAttackInnerInterceptor());

		return interceptor;
	}

}
