package com.mobset.system.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mobset.system.dao.CahgImptWorkDao;
import com.mobset.system.service.CahgImptWordService;


/**
 * @说明  重点工作serivceImpl
 * @创建人 陈礼刚
 * @时间 2017年7月20日9:52:06
 */
@Service("cahgImptWorkService")
public class CahgImptWorkServiceImpl implements CahgImptWordService {
	
	@Resource
	private CahgImptWorkDao dao;

	@Override
	public List<HashMap> indexImptWorkList(HashMap map) {
		// TODO Auto-generated method stub
		return dao.indexImptWorkList(map);
	}

	@Override
	public HashMap imptWorkDetailsShow(HashMap map) {
		// TODO Auto-generated method stub
		return dao.imptWorkDetailsShow(map);
	}

	@Override
	public List<HashMap> imptWorkList(HashMap map) {
		// TODO Auto-generated method stub
		return dao.imptWorkList(map);
	}

	@Override
	public Integer count(HashMap map) {
		// TODO Auto-generated method stub
		return dao.count(map);
	}

}
