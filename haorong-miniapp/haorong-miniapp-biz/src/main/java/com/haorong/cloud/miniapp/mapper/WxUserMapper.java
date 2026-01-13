/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.miniapp.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.haorong.cloud.miniapp.api.entity.WxUser;
import com.haorong.cloud.miniapp.api.vo.WxUserVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * 微信用户
 *
 * @author haorong
 * @since 2022/2/26 16:32
 */
@Mapper
public interface WxUserMapper extends BaseMapper<WxUser> {

	/**
	 * 微信用户列表
	 *
	 * @author haorong
	 * @date 2022/6/1
	 * @param page
	 * @param wxUser
	 * @return: com.baomidou.mybatisplus.core.metadata.IPage<com.haorong.cloud.weixin.common.vo.WxUserVo>
	 */
	IPage<WxUserVo> selectAdminPage(Page page, @Param("query") WxUser wxUser);

}
