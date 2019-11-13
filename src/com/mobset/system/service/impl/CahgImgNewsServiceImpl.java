package com.mobset.system.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mobset.system.dao.CahgImgNewsDao;
import com.mobset.system.service.CahgImgNewsService;
/**
 * @说明  图片新闻service
 * @创建人 陈礼刚
 * @时间 2017年6月26日14:41:41
 */
@Service("cahgImgNewsService")
public class CahgImgNewsServiceImpl implements CahgImgNewsService{
	
	@Resource
	private CahgImgNewsDao dao;
	
	/**
	 * @说明 首页图片新闻列表
	 */
	@Override
	public List<HashMap> indexImgNewsList(HashMap map) {
		// TODO Auto-generated method stub
		return dao.indexImgNewsList(map);
	}

	/**
	 * @说明 图片新闻展示
	 */
	@Override
	public HashMap imgNewDetailsShow(HashMap map) {
		// TODO Auto-generated method stub
		return dao.imgNewDetailsShow(map);
	}

	/**
	 * @说明 图片新闻列表
	 */
	@Override
	public List<HashMap> imgNewsList(HashMap map) {
		// TODO Auto-generated method stub
		return dao.imgNewsList(map);
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
