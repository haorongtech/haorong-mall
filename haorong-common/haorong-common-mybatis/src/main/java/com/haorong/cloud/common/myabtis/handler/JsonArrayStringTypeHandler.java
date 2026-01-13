/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.common.myabtis.handler;

import cn.hutool.core.convert.Convert;
import cn.hutool.core.util.ArrayUtil;
import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedJdbcTypes;
import org.apache.ibatis.type.MappedTypes;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@MappedTypes(String[].class)
@MappedJdbcTypes({ JdbcType.VARCHAR })
public class JsonArrayStringTypeHandler extends BaseTypeHandler<String[]> {

	@Override
	public void setNonNullParameter(PreparedStatement ps, int i, String[] parameter, JdbcType jdbcType)
			throws SQLException {
		ps.setString(i, ArrayUtil.join(parameter, ","));
	}

	@Override
	public String[] getNullableResult(ResultSet rs, String columnName) throws SQLException {
		return Convert.toStrArray(rs.getString(columnName));
	}

	@Override
	public String[] getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
		return Convert.toStrArray(rs.getString(columnIndex));
	}

	@Override
	public String[] getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
		return Convert.toStrArray(cs.getString(columnIndex));
	}

}
