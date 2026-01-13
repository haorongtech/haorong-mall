/**
 * Copyright (c) 2025 沈阳浩荣科技有限公司
 * All rights reserved.
 * <p>
 * 注意：
 * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。
 */
package com.haorong.cloud.common.myabtis.handler;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONArray;
import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedJdbcTypes;
import org.apache.ibatis.type.MappedTypes;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@MappedTypes(JSONArray.class)
@MappedJdbcTypes({ JdbcType.VARCHAR })
public class JsonArrayTypeHandler extends BaseTypeHandler<JSONArray> {

	@Override
	public void setNonNullParameter(PreparedStatement ps, int i, JSONArray parameter, JdbcType jdbcType)
			throws SQLException {
		ps.setString(i, JSON.toJSONString(parameter));

	}

	@Override
	public JSONArray getNullableResult(ResultSet rs, String columnName) throws SQLException {
		return JSONArray.parseArray(rs.getString(columnName));
	}

	@Override
	public JSONArray getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
		return JSONArray.parseArray(rs.getString(columnIndex));
	}

	@Override
	public JSONArray getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
		return JSONArray.parseArray(cs.getString(columnIndex));
	}

}
