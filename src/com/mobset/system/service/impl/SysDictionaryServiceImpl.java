package com.mobset.system.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mobset.system.dao.SysDictionaryDao;
import com.mobset.system.service.SysDictionaryService;
/**
 * @说明  字典表ServiceImpl
 * @创建人 陈礼刚
 * @时间 2017年6月28日13:49:13
 */
@Service("sysDictionaryService")
public class SysDictionaryServiceImpl implements SysDictionaryService {

	@Resource
	private SysDictionaryDao dao;
	/**
	 * @说明 新闻类型列表
	 */
	@Override
	public List<HashMap> newTypeList(HashMap map) {
		return dao.newTypeList(map);
	}
	
	/**
	 * @说明 科室列表
	 */
	@Override
	public List<Map<String, Object>> deptList(Map<String, Object> map) {
		return dao.deptList(map);
	}
	
	/**
	 * @说明 科室查询
	 */
	@Override
	public HashMap deptSelect(HashMap map) {
		return dao.deptSelect(map);
	}

	@Override
	public List<HashMap> selectFormList(HashMap map) {
		return dao.selectFormList(map);
	}

	@Override
	public Integer formCount(HashMap map) {
		return dao.formCount(map);
	}

	@Override
	public HashMap wishSelect(HashMap map) {
		return dao.wishSelect(map);
	}

	@Override
	public HashMap selectpicture() {
		return dao.selectpicture();
	}

}
