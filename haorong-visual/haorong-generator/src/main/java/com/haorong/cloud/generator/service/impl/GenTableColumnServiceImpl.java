package com.haorong.cloud.generator.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.haorong.cloud.generator.entity.GenTableColumn;
import com.haorong.cloud.generator.mapper.GenTableColumnMapper;
import com.haorong.cloud.generator.service.IGenTableColumnService;
import org.springframework.stereotype.Service;

@Service
public class GenTableColumnServiceImpl extends ServiceImpl<GenTableColumnMapper, GenTableColumn>
		implements IGenTableColumnService {

}
