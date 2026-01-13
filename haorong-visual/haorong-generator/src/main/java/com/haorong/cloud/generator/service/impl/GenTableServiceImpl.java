package com.haorong.cloud.generator.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.io.IoUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.dynamic.datasource.toolkit.DynamicDataSourceContextHolder;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.haorong.cloud.common.core.constant.CommonConstants;
import com.haorong.cloud.common.datasource.config.DynamicDataSourceExecutor;
import com.haorong.cloud.common.security.util.SecurityUtils;
import com.haorong.cloud.generator.constant.GenConstants;
import com.haorong.cloud.generator.entity.GenTable;
import com.haorong.cloud.generator.entity.GenTableColumn;
import com.haorong.cloud.generator.mapper.GenTableColumnMapper;
import com.haorong.cloud.generator.mapper.GenTableMapper;
import com.haorong.cloud.generator.service.IGenTableService;
import com.haorong.cloud.generator.utils.GenUtils;
import com.haorong.cloud.generator.utils.VelocityInitializer;
import com.haorong.cloud.generator.utils.VelocityUtils;
import lombok.RequiredArgsConstructor;
import org.anyline.metadata.Column;
import org.anyline.metadata.Table;
import org.anyline.proxy.ServiceProxy;
import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.Velocity;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.StringWriter;
import java.util.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

@Service
@RequiredArgsConstructor
public class GenTableServiceImpl extends ServiceImpl<GenTableMapper, GenTable> implements IGenTableService {

	private final GenTableColumnMapper genTableColumnMapper;

	@Override
	public IPage<Table> getPage(Page page, GenTable genTable) {
		DynamicDataSourceContextHolder.push(genTable.getDsName());
		List<Table> tableList = ServiceProxy.metadata().tables().values().stream().filter(s -> {
			if (!StringUtils.hasText(genTable.getTableName())) {
				return true;
			}
			return StrUtil.containsIgnoreCase(s.getName(), genTable.getTableName())
					|| StrUtil.containsIgnoreCase(s.getComment(), genTable.getTableName());
		}).toList();
		page.setRecords(CollUtil.page((int) page.getCurrent() - 1, (int) page.getSize(), tableList));
		page.setTotal(tableList.size());
		DynamicDataSourceContextHolder.clear();
		return page;
	}

	@Override
	public byte[] generatorCode(String tableName) {
		ByteArrayOutputStream outputStream = new ByteArrayOutputStream();

		ZipOutputStream zip = new ZipOutputStream(outputStream);

		// 查询表信息
		GenTable table = baseMapper.selectOne(Wrappers.<GenTable>lambdaQuery().eq(GenTable::getTableName, tableName));
		table.setColumns(genTableColumnMapper
			.selectList(Wrappers.<GenTableColumn>lambdaQuery().eq(GenTableColumn::getTableId, table.getTableId())));
		// 设置主键列信息
		setPkColumn(table);

		VelocityInitializer.initVelocity();

		VelocityContext context = VelocityUtils.prepareContext(table);

		// 获取模板列表
		List<String> templates = VelocityUtils.getTemplateList(table.getTplCategory());
		for (String template : templates) {
			// 渲染模板
			StringWriter sw = new StringWriter();
			Template tpl = Velocity.getTemplate(template, CommonConstants.UTF8);
			tpl.merge(context, sw);
			try {
				// 添加到zip
				zip.putNextEntry(new ZipEntry(VelocityUtils.getFileName(template, table)));
				IoUtil.write(zip, false, sw.toString().getBytes(CommonConstants.UTF8)); // 写入并自动关闭输入流
				IoUtil.close(sw);
				zip.flush();
				zip.closeEntry();
			}
			catch (IOException e) {
				throw new IllegalArgumentException("渲染模板失败，表名：" + table.getTableName());
			}
		}
		try {
			zip.finish();
		}
		catch (IOException e) {
			throw new IllegalArgumentException("压缩包生成失败，表名：" + table.getTableName());
		}
		IoUtil.close(zip);
		return outputStream.toByteArray();
	}

	@Override
	public GenTable genTabledDetail(String dsName, String tableName) {
		GenTable genTable = baseMapper.selectOne(
				Wrappers.<GenTable>lambdaQuery().eq(GenTable::getTableName, tableName).eq(GenTable::getDsName, dsName));
		if (Objects.isNull(genTable)) {
			// 执行保存逻辑并返回
			genTable = this.buildTable(dsName, tableName);
			baseMapper.insert(genTable);
			genTableColumnMapper.insertOrUpdate(genTable.getColumns());
			return genTable;
		}
		genTable.setColumns(genTableColumnMapper
			.selectList(Wrappers.<GenTableColumn>lambdaQuery().eq(GenTableColumn::getTableId, genTable.getTableId())));
		return genTable;
	}

	@Override
	public boolean updateGenTableById(GenTable genTable) {
		baseMapper.updateById(genTable);
		genTableColumnMapper.insertOrUpdate(genTable.getColumns());
		return true;
	}

	private GenTable buildTable(String dsName, String tableName) {
		// 切数据库
		return DynamicDataSourceExecutor.call(dsName, () -> {
			Table table = ServiceProxy.metadata().table(tableName);
			GenTable genTable = new GenTable();
			genTable.setTableComment(table.getComment());
			genTable.setTableName(tableName);
			genTable.setDsName(dsName);
			genTable.setTableId(IdUtil.getSnowflakeNextIdStr());
			GenUtils.initTable(genTable, SecurityUtils.getUser().getUsername());
			LinkedHashMap<String, Column> columnLinkedHashMap = table.getColumns();
			List<GenTableColumn> genTableColumnList = new ArrayList<>();

			for (Map.Entry<String, Column> entry : columnLinkedHashMap.entrySet()) {
				Column column = entry.getValue();
				GenTableColumn genTableColumn = new GenTableColumn();
				genTableColumn.setColumnComment(column.getComment());
				genTableColumn.setColumnName(column.getName());
				genTableColumn.setColumnType(column.getOriginType());
				genTableColumn.setIsPk(String.valueOf(column.isPrimaryKey()));
				genTableColumn.setTableId(genTable.getTableId());
				GenUtils.initColumnField(genTableColumn, genTable);

				genTableColumnList.add(genTableColumn);
			}
			genTable.setColumns(genTableColumnList);
			return genTable;
		});
	}

	/**
	 * 获取代码生成地址
	 * @param table 业务表信息
	 * @param template 模板文件路径
	 * @return 生成地址
	 */
	public static String getGenPath(GenTable table, String template) {
		String genPath = table.getGenPath();
		if (StrUtil.equals(genPath, "/")) {
			return System.getProperty("user.dir") + File.separator + "src" + File.separator
					+ VelocityUtils.getFileName(template, table);
		}
		return genPath + File.separator + VelocityUtils.getFileName(template, table);
	}

	/**
	 * 设置主键列信息
	 * @param table 业务表信息
	 */
	public void setPkColumn(GenTable table) {
		for (GenTableColumn column : table.getColumns()) {
			if (column.isPk()) {
				table.setPkColumn(column);
				break;
			}
		}
		if (Objects.isNull(table.getPkColumn())) {
			table.setPkColumn(table.getColumns().get(0));
		}
		if (GenConstants.TPL_SUB.equals(table.getTplCategory())) {
			for (GenTableColumn column : table.getSubTable().getColumns()) {
				if (column.isPk()) {
					table.getSubTable().setPkColumn(column);
					break;
				}
			}
			if (Objects.isNull(table.getSubTable().getPkColumn())) {
				table.getSubTable().setPkColumn(table.getSubTable().getColumns().get(0));
			}
		}
	}

}
