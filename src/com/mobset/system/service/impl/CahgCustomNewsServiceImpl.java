package com.mobset.system.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mobset.system.dao.CahgCustomNewsDao;
import com.mobset.system.service.CahgCustomNewsService;


/**
 * @说明  海关新闻serviceImpl
 * @创建人 陈礼刚
 * @时间 2017年7月5日10:37:46
 */

@Service("cahgCustomNewsService")
public class CahgCustomNewsServiceImpl implements CahgCustomNewsService {
	
	@Resource
	private CahgCustomNewsDao dao;

	/**
	 * @说明 首页海关新闻列表
	 */
	@Override
	public List<HashMap> indexCustomNewsList(HashMap map) {
		// TODO Auto-generated method stub
		return dao.indexCustomNewsList(map);
	}

	/**
	 * @说明 海关新闻详情显示
	 */
	@Override
	public HashMap customNewsDetailsShow(HashMap map) {
		// TODO Auto-generated method stub
		return dao.customNewsDetailsShow(map);
	}

	/**
	 * @说明 海关新闻列表
	 */
	@Override
	public List<HashMap> customNewsList(HashMap map) {
		// TODO Auto-generated method stub
		return dao.customNewsList(map);
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
