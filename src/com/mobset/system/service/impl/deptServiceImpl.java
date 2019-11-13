package com.mobset.system.service.impl;

import java.util.HashMap;
import java.util.List;

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
		// TODO Auto-generated method stub
		return dao.deptSelectList(map);
	}

	@Override
	public HashMap deptDetails(HashMap map) {
		// TODO Auto-generated method stub
		return dao.deptDetails(map);
	}

	@Override
	public List<HashMap> officeWorkCategory(HashMap map) {
		// TODO Auto-generated method stub
		return dao.officeWorkCategory(map);
	}


	@Override
	public List<HashMap> officeWorkFile(HashMap map) {
		// TODO Auto-generated method stub
		return dao.officeWorkFile(map);
	}

	@Override
	public Integer count(HashMap map) {
		// TODO Auto-generated method stub
		return dao.count(map);
	}

	@Override
	public List<HashMap> selectDeptRegime(HashMap map) {
		// TODO Auto-generated method stub
		return dao.selectDeptRegime(map);
	}

	@Override
	public Integer selectDeptRegimeCount(HashMap map) {
		// TODO Auto-generated method stub
		return dao.selectDeptRegimeCount(map);
	}

	@Override
	public List<HashMap> selectWorkStandard(HashMap map) {
		// TODO Auto-generated method stub
		return dao.selectWorkStandard(map);
	}

	@Override
	public Integer selectWorkStandardCount(HashMap map) {
		// TODO Auto-generated method stub
		return dao.selectWorkStandardCount(map);
	}

}
