package com.mobset.system.service.impl;

import java.util.HashMap;
import java.util.List;

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
		// TODO Auto-generated method stub
		return dao.newTypeList(map);
	}
	
	/**
	 * @说明 科室列表
	 */
	@Override
	public List<HashMap> deptList(HashMap map) {
		// TODO Auto-generated method stub
		return dao.deptList(map);
	}
	
	/**
	 * @说明 科室查询
	 */
	@Override
	public HashMap deptSelect(HashMap map) {
		// TODO Auto-generated method stub
		return dao.deptSelect(map);
	}

	@Override
	public List<HashMap> selectFormList(HashMap map) {
		// TODO Auto-generated method stub
		return dao.selectFormList(map);
	}

	@Override
	public Integer formCount(HashMap map) {
		// TODO Auto-generated method stub
		return dao.formCount(map);
	}

	@Override
	public HashMap wishSelect(HashMap map) {
		// TODO Auto-generated method stub
		return dao.wishSelect(map);
	}

	@Override
	public HashMap selectpicture() {
		// TODO Auto-generated method stub
		return dao.selectpicture();
	}

}
