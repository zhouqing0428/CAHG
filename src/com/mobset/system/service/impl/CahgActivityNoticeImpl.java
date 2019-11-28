package com.mobset.system.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mobset.system.dao.CahgActivityNoticeDao;
import com.mobset.system.service.CahgActivityNoticeService;

@Service("activityNoticeService")
public class CahgActivityNoticeImpl implements CahgActivityNoticeService {
	
	@Autowired
	private CahgActivityNoticeDao dao;

	@Override
	public List<Map<String, Object>> queryIndexList(Map<String, Object> map) {
		return dao.queryIndexList(map);
	}

	@Override
	public List<Map<String, Object>> queryList(Map<String, Object> map) {
		return dao.queryList(map);
	}

	@Override
	public int queryCount(Map<String, Object> map) {
		return dao.queryCount(map);
	}

	@Override
	public Map<String, Object> queryObject(Map<String, Object> map) {
		return dao.queryObject(map);
	}

}
