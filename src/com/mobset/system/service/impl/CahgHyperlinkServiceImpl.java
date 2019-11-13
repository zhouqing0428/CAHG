package com.mobset.system.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mobset.system.dao.CahgHyperlinkDao;
import com.mobset.system.service.CahgHyperlinkService;


@Service("cahgHyperlinkService")
public class CahgHyperlinkServiceImpl implements CahgHyperlinkService{

	@Resource
	private CahgHyperlinkDao dao;

	@Override
	public List<HashMap> botLink(HashMap map) {
		// TODO Auto-generated method stub
		return dao.botLink(map);
	}

	@Override
	public List<HashMap> qtLink(HashMap map) {
		// TODO Auto-generated method stub
		return dao.qtLink(map);
	}
	
}
