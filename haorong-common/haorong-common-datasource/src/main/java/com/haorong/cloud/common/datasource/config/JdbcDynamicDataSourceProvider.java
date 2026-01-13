/**
 * Copyright (c) 2025 沈阳浩荣科技有限公司
 * All rights reserved.
 * <p>
 * 注意：
 * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。
 * 仅供购买并获得正式授权的客户使用，侵权必究。
 */
package com.haorong.cloud.common.datasource.config;

import com.baomidou.dynamic.datasource.creator.DataSourceProperty;
import com.baomidou.dynamic.datasource.creator.DefaultDataSourceCreator;
import com.baomidou.dynamic.datasource.creator.druid.DruidConfig;
import com.baomidou.dynamic.datasource.provider.AbstractJdbcDataSourceProvider;
import com.baomidou.dynamic.datasource.toolkit.CryptoUtils;
import lombok.SneakyThrows;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

public class JdbcDynamicDataSourceProvider extends AbstractJdbcDataSourceProvider {

	public JdbcDynamicDataSourceProvider(DefaultDataSourceCreator dataSourceCreator,
			HrDataSourceProperties hrDataSourceProperties) {
		super(dataSourceCreator, hrDataSourceProperties.getDriverClassName(), hrDataSourceProperties.getUrl(),
				hrDataSourceProperties.getUsername(), hrDataSourceProperties.getPassword());
	}

	@SneakyThrows
	@Override
	protected Map<String, DataSourceProperty> executeStmt(Statement statement) {
		Map<String, DataSourceProperty> map = new HashMap<>();

		ResultSet rs = statement.executeQuery("select * from gen_data_source where del_flag = '0'");
		while (rs.next()) {
			String name = rs.getString("db_name");
			String username = rs.getString("username");
			String password = rs.getString("password");
			String url = rs.getString("url");
			DataSourceProperty property = new DataSourceProperty();
			property.setUsername(username);
			property.setPassword(CryptoUtils.decrypt(password));
			property.setUrl(url);
			DruidConfig druidConfig = new DruidConfig();
			druidConfig.setValidationQuery("select 1");
			property.setDruid(druidConfig);
			map.put(name, property);
		}
		return map;
	}

}
