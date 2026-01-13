/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.upms.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.haorong.cloud.upms.api.entity.SysRoleMenu;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 角色管理菜单
 *
 * @author haorong
 * @since 2022/2/26 16:50
 */
@Mapper
public interface SysRoleMenuMapper extends BaseMapper<SysRoleMenu> {

	void saveBatch(@Param("list") List<SysRoleMenu> sysRoleMenus);

}
