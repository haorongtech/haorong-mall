package com.haorong.cloud.generator.service.impl;

import com.baomidou.dynamic.datasource.DynamicRoutingDataSource;
import com.baomidou.dynamic.datasource.creator.DataSourceProperty;
import com.baomidou.dynamic.datasource.creator.druid.DruidDataSourceCreator;
import com.baomidou.dynamic.datasource.toolkit.CryptoUtils;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.haorong.cloud.common.core.util.SpringUtils;
import com.haorong.cloud.generator.entity.GenDataSource;
import com.haorong.cloud.generator.mapper.GenDataSourceMapper;
import com.haorong.cloud.generator.service.IGenDataSourceService;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.sql.DriverManager;

@Service
@RequiredArgsConstructor
public class GenDataSourceServiceImpl extends ServiceImpl<GenDataSourceMapper, GenDataSource>
		implements IGenDataSourceService {

	private final static String MYSQL_JDBC = "jdbc:mysql://%s:%s/%s?characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=false&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=GMT%%2B8&allowMultiQueries=true&allowPublicKeyRetrieval=true";

	private final DruidDataSourceCreator dataSourceCreator;

	@SneakyThrows
	@Override
	public boolean saveDataSource(GenDataSource genDataSource) {
		genDataSource.setUrl(
				String.format(MYSQL_JDBC, genDataSource.getHost(), genDataSource.getPort(), genDataSource.getDbName()));
		try {
			DriverManager.getConnection(genDataSource.getUrl(), genDataSource.getUsername(),
					genDataSource.getPassword());
		}
		catch (Exception e) {
			throw new RuntimeException("数据源连接错误");
		}
		DynamicRoutingDataSource ds = SpringUtils.getBean(DynamicRoutingDataSource.class);
		if (!ds.getDataSources().containsKey(genDataSource.getDbName())) {
			// 1. 构建属性
			DataSourceProperty prop = new DataSourceProperty();
			prop.setUrl(genDataSource.getUrl());
			prop.setUsername(genDataSource.getUsername());
			prop.setPassword(genDataSource.getPassword());
			// 2. 使用 DataSourceCreator 创建 DataSource 对象
			DataSource newDs = dataSourceCreator.createDataSource(prop);
			// 3. 动态注册到路由中
			ds.addDataSource(genDataSource.getDbName(), newDs);
		}
		genDataSource.setPassword(CryptoUtils.encrypt(genDataSource.getPassword()));
		return baseMapper.insert(genDataSource) > 0;
	}

	@SneakyThrows
	@Override
	public boolean updateDataSourceById(GenDataSource genDataSource) {
		genDataSource.setUrl(
				String.format(MYSQL_JDBC, genDataSource.getHost(), genDataSource.getPort(), genDataSource.getDbName()));
		try {
			DriverManager.getConnection(genDataSource.getUrl(), genDataSource.getUsername(),
					genDataSource.getPassword());
		}
		catch (Exception e) {
			throw new RuntimeException("数据源连接错误");
		}
		DynamicRoutingDataSource ds = SpringUtils.getBean(DynamicRoutingDataSource.class);
		ds.removeDataSource(genDataSource.getDbName());
		if (!ds.getDataSources().containsKey(genDataSource.getDbName())) {
			// 1. 构建属性
			DataSourceProperty prop = new DataSourceProperty();
			prop.setUrl(genDataSource.getUrl());
			prop.setUsername(genDataSource.getUsername());
			prop.setPassword(genDataSource.getPassword());
			// 2. 使用 DataSourceCreator 创建 DataSource 对象
			DataSource newDs = dataSourceCreator.createDataSource(prop);
			// 3. 动态注册到路由中
			ds.addDataSource(genDataSource.getDbName(), newDs);
		}
		genDataSource.setPassword(CryptoUtils.encrypt(genDataSource.getPassword()));
		return baseMapper.updateById(genDataSource) > 0;
	}

}
