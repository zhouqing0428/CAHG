package com.mobset.system.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mobset.system.dao.CahgIntroDao;
import com.mobset.system.service.CahgIntroService;
@Service("cahgIntroService")
public class CahgIntroServiceImpl implements CahgIntroService{
	
	@Resource
	private CahgIntroDao dao;

	@Override
	public HashMap selectIntro(HashMap map) {
		// TODO Auto-generated method stub
		return dao.selectIntro(map);
	}

	@Override
	public List<HashMap> introFile(HashMap map) {
		// TODO Auto-generated method stub
		return dao.introFile(map);
	}

	@Override
	public Integer count(HashMap map) {
		// TODO Auto-generated method stub
		return dao.count(map);
	}

	@Override
	public HashMap selectIntro2(HashMap map) {
		// TODO Auto-generated method stub
		return dao.selectIntro2(map);
	}

}
