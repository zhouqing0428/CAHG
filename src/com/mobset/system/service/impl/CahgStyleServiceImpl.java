package com.mobset.system.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mobset.system.dao.CahgStyleDao;
import com.mobset.system.service.CahgStyleService;
/**
 * @说明  长安风采service
 * @创建人 陈礼刚
 * @时间 2017年6月26日14:41:41
 */
@Service("cahgStyleService")
public class CahgStyleServiceImpl implements CahgStyleService{
	
	@Resource
	private CahgStyleDao dao;
	
	/**
	 * @说明 首页长安风采列表
	 */
	@Override
	public List<HashMap> indexStyleList(HashMap map) {
		// TODO Auto-generated method stub
		return dao.indexStyleList(map);
	}

	/**
	 * @说明 长安风采展示
	 */
	@Override
	public HashMap styleDetailsShow(HashMap map) {
		// TODO Auto-generated method stub
		return dao.styleDetailsShow(map);
	}

	/**
	 * @说明 长安风采列表
	 */
	@Override
	public List<HashMap> styleList(HashMap map) {
		// TODO Auto-generated method stub
		return dao.styleList(map);
	}
	
	/**
	 * @说明 长安风采分类列表
	 */
	@Override
	public List<HashMap> styleCateList(HashMap map) {
		// TODO Auto-generated method stub
		return dao.styleCateList(map);
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
