package com.mobset.system.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mobset.system.dao.CahgFloatNewsDao;
import com.mobset.system.service.CahgFloatNewsService;
/**
 * @说明  图片新闻service
 * @创建人 陈礼刚
 * @时间 2017年6月26日14:41:41
 */
@Service("cahgFloatNewsService")
public class CahgFloatNewsServiceImpl implements CahgFloatNewsService{
	
	@Resource
	private CahgFloatNewsDao dao;
	
	/**
	 * @说明 首页图片新闻列表
	 */
	@Override
	public List<HashMap> indexFloatNewsList(HashMap map) {
		// TODO Auto-generated method stub
		return dao.indexFloatNewsList(map);
	}

	/**
	 * @说明 图片新闻展示
	 */
	@Override
	public HashMap floatNewDetailsShow(HashMap map) {
		// TODO Auto-generated method stub
		return dao.floatNewDetailsShow(map);
	}

	/**
	 * @说明 图片新闻列表
	 */
	@Override
	public List<HashMap> floatNewsList(HashMap map) {
		// TODO Auto-generated method stub
		return dao.floatNewsList(map);
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
