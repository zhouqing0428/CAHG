package com.mobset.system.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mobset.system.dao.CahgWorkTableDao;
import com.mobset.system.service.CahgWorkTableService;

@Service("cahgWorkTableService")
public class CahgWorkTableServiceImpl implements CahgWorkTableService {

	@Resource
	private CahgWorkTableDao dao;
	
	@Override
	public List<HashMap> selectTableCategory(HashMap map) {
		// TODO Auto-generated method stub
		return dao.selectTableCategory(map);
	}

	@Override
	public List<HashMap> selectWorkTable(HashMap map) {
		// TODO Auto-generated method stub
		return dao.selectWorkTable(map);
	}

	@Override
	public List<HashMap> workTableList(HashMap map) {
		// TODO Auto-generated method stub
		return dao.workTableList(map);
	}

	@Override
	public Integer count(HashMap map) {
		// TODO Auto-generated method stub
		return dao.count(map);
	}

	@Override
	public List<HashMap> selectType(HashMap map) {
		// TODO Auto-generated method stub
		return dao.selectType(map);
	}

}
