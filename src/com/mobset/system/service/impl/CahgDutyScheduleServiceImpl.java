package com.mobset.system.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mobset.system.dao.CahgDutyScheduleDao;
import com.mobset.system.service.CahgDutyScheduleService;

@Service("dutyScheduleService")
public class CahgDutyScheduleServiceImpl implements CahgDutyScheduleService {

	@Resource
	private CahgDutyScheduleDao dao;
	
	@Override
	public List<HashMap> selectDutyList(HashMap map) {
		// TODO Auto-generated method stub
		return dao.selectDutyList(map);
	}

	@Override
	public Integer count(HashMap map) {
		// TODO Auto-generated method stub
		return dao.count(map);
	}

	@Override
	public HashMap selectDutyInfo(HashMap map) {
		// TODO Auto-generated method stub
		return dao.selectDutyInfo(map);
	}

}
