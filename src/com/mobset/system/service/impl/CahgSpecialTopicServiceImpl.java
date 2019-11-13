package com.mobset.system.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mobset.system.dao.CahgSpecialTopicDao;
import com.mobset.system.service.CahgSpecialTopicService;

@Service("cahgSpecialTopicService")
public class CahgSpecialTopicServiceImpl implements CahgSpecialTopicService{

	@Resource
	private CahgSpecialTopicDao dao;
	
	/**
	 * @说明 首页专题专栏类型列表 
	 */
	@Override
	public List<HashMap> indexSpecialTopicCategoryList(HashMap map) {
		// TODO Auto-generated method stub
		return dao.indexSpecialTopicCategoryList(map);
	}

	/**
	 * @说明 详情展示
	 */
	public HashMap specialTopicDetailsShow(HashMap map){
		return dao.specialTopicDetailsShow(map);
	}
	
	/**
	 * @说明 左导航类型
	 */
	@Override
	public List<HashMap> specialLeftList(HashMap map) {
		// TODO Auto-generated method stub
		return dao.specialLeftList(map);
	}


	/**
	 * @说明 列表
	 */
	@Override
	public List<HashMap> specialTopicList(HashMap map) {
		// TODO Auto-generated method stub
		return dao.specialTopicList(map);
	}

	/**
	 * @说明 分页
	 */
	public Integer count(HashMap map){
		return dao.count(map);
	}
	
}
