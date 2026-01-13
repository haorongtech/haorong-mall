/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.upms.service.impl;

import cn.hutool.core.lang.tree.Tree;
import cn.hutool.core.lang.tree.TreeNode;
import cn.hutool.core.lang.tree.TreeUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.haorong.cloud.common.core.constant.CommonConstants;
import com.haorong.cloud.upms.api.entity.SysDept;
import com.haorong.cloud.upms.mapper.SysDeptMapper;
import com.haorong.cloud.upms.service.ISysDeptService;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 部门
 *
 * @author haorong
 * @since 2022/2/26 16:51
 */
@Service
public class SysDeptServiceImpl extends ServiceImpl<SysDeptMapper, SysDept> implements ISysDeptService {

	@Override
	public List<Tree<String>> getTreeList() {
		List<SysDept> sysDepts = baseMapper.selectList(Wrappers.emptyWrapper());
		List<TreeNode<String>> treeNodes = sysDepts.stream().map(dept -> {
			TreeNode<String> treeNode = new TreeNode();
			treeNode.setId(dept.getId());
			treeNode.setParentId(dept.getParentId());
			treeNode.setName(dept.getDeptName());
			Map<String, Object> extra = new HashMap<>();
			extra.put("leader", dept.getLeader());
			extra.put("leaderPhone", dept.getLeaderPhone());
			extra.put("createTime", dept.getCreateTime());
			extra.put("sort", dept.getSort());
			extra.put("status", dept.getStatus());
			treeNode.setExtra(extra);
			return treeNode;
		}).collect(Collectors.toList());
		return TreeUtil.build(treeNodes, CommonConstants.PARENT_ID);
	}

}
