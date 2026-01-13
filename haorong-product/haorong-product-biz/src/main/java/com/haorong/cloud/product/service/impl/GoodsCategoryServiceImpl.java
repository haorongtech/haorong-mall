/**
  * Copyright (c) 2025 沈阳浩荣科技有限公司
  * All rights reserved.
  * <p>
  * 注意：
  * 本项目源代码由沈阳浩荣科技有限公司原创开发，版权所有。

  */
package com.haorong.cloud.product.service.impl;

import cn.hutool.core.lang.tree.Tree;
import cn.hutool.core.lang.tree.TreeNode;
import cn.hutool.core.lang.tree.TreeUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.haorong.cloud.common.core.constant.CommonConstants;
import com.haorong.cloud.product.api.entity.GoodsCategory;
import com.haorong.cloud.product.mapper.GoodsCategoryMapper;
import com.haorong.cloud.product.service.IGoodsCategoryService;
import org.springframework.stereotype.Service;

import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 商品类目
 *
 * @author haorong
 * @since 2022/2/26 16:37
 */
@Service
public class GoodsCategoryServiceImpl extends ServiceImpl<GoodsCategoryMapper, GoodsCategory>
		implements IGoodsCategoryService {

	@Override
	public List<Tree<String>> getGoodsCategoryTreeList() {
		List<GoodsCategory> goodsCategories = baseMapper.selectList(Wrappers.emptyWrapper());
		List<TreeNode<String>> treeNodes = goodsCategories.stream()
			.sorted(Comparator.comparingInt(GoodsCategory::getSort))
			.map(goodsCategory -> {
				TreeNode<String> treeNode = new TreeNode();
				treeNode.setId(goodsCategory.getId());
				treeNode.setParentId(goodsCategory.getParentId());
				treeNode.setName(goodsCategory.getName());
				treeNode.setWeight(goodsCategory.getSort());
				Map<String, Object> extra = new HashMap<>();
				extra.put("categoryPic", goodsCategory.getCategoryPic());
				extra.put("createTime", goodsCategory.getCreateTime());
				extra.put("description", goodsCategory.getDescription());
				extra.put("status", goodsCategory.getStatus());
				extra.put("sort", goodsCategory.getSort());
				treeNode.setExtra(extra);
				return treeNode;
			})
			.collect(Collectors.toList());
		return TreeUtil.build(treeNodes, CommonConstants.PARENT_ID);
	}

}
