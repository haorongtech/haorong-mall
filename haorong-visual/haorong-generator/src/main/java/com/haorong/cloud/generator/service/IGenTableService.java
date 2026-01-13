package com.haorong.cloud.generator.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.haorong.cloud.generator.entity.GenTable;
import org.anyline.metadata.Table;

public interface IGenTableService extends IService<GenTable> {

	IPage<Table> getPage(Page page, GenTable genTable);

	/**
	 * 生成代码（自定义路径）
	 * @param tableName 表名称
	 * @return 数据
	 */
	byte[] generatorCode(String tableName);

	GenTable genTabledDetail(String dsName, String tableName);

	boolean updateGenTableById(GenTable genTable);

}
