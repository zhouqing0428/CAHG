package com.mobset.system.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mobset.system.dao.deptDao;
import com.mobset.system.service.deptService;

@Service("deptService")
public class deptServiceImpl implements deptService {

	@Resource
	private deptDao dao;
	
	@Override
	public List<HashMap> deptSelectList(HashMap map) {
		return dao.deptSelectList(map);
	}

	@Override
	public HashMap deptDetails(HashMap map) {
		return dao.deptDetails(map);
	}

	@Override
	public List<HashMap> officeWorkCategory(HashMap map) {
		return dao.officeWorkCategory(map);
	}


	@Override
	public List<HashMap> officeWorkFile(HashMap map) {
		return dao.officeWorkFile(map);
	}

	@Override
	public Integer count(HashMap map) {
		return dao.count(map);
	}

	@Override
	public List<HashMap> selectDeptRegime(HashMap map) {
		return dao.selectDeptRegime(map);
	}

	@Override
	public Integer selectDeptRegimeCount(HashMap map) {
		return dao.selectDeptRegimeCount(map);
	}

	@Override
	public List<HashMap> selectWorkStandard(HashMap map) {
		return dao.selectWorkStandard(map);
	}

	@Override
	public Integer selectWorkStandardCount(HashMap map) {
		return dao.selectWorkStandardCount(map);
	}

	@Override
	public List<Map<String, Object>> queryListByIds(List<String> list) {
		return dao.queryListByIds(list);
	}

}
