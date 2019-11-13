package com.mobset.system.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mobset.system.dao.CahgDayInfoDao;
import com.mobset.system.service.CahgDayInfoService;

/**
 * @说明  每日service
 * @创建人 陈礼刚
 * @时间 2017年6月27日13:38:51
 */
@Service("cahgDayInfoService")
public class CahgDayInfoServiceImpl implements CahgDayInfoService {
	
	@Resource
	private CahgDayInfoDao dao;

	/**
	 * @说明 首页每日信息列表
	 */
	@Override
	public List<HashMap> indexDayInfoList(HashMap map) {
		// TODO Auto-generated method stub
		return dao.indexDayInfoList(map);
	}

	
	/**
	 * @说明 每日内容展示
	 */
	@Override
	public HashMap dayInfoDetailsShow(HashMap map) {
		// TODO Auto-generated method stub
		return dao.dayInfoDetailsShow(map);
	}

	/**
	 * @说明 每日说明列表
	 */
	@Override
	public List<HashMap> dayInfoList(HashMap map) {
		// TODO Auto-generated method stub
		return dao.dayInfoList(map);
	}

	/**
	 * @说明 分页
	 */
	@Override
	public Integer count(HashMap map) {
		// TODO Auto-generated method stub
		return dao.count(map);
	}

}
