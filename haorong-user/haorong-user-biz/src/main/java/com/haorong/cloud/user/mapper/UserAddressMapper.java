/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.user.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.haorong.cloud.user.api.entity.UserAddress;
import org.apache.ibatis.annotations.Mapper;

/**
 * 用户收货地址
 *
 * @author haorong
 * @since 2022/2/26 16:32
 */
@Mapper
public interface UserAddressMapper extends BaseMapper<UserAddress> {

}
