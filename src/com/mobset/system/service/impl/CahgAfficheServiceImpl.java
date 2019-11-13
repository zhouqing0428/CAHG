package com.mobset.system.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mobset.system.dao.CahgAfficheDao;
import com.mobset.system.service.CahgAfficheService;
/**
 * @说明  公示公告serviceImpl
 * @创建人 陈礼刚
 * @时间 2017年7月6日16:09:13
 */

@Service("cahgAfficheService")
public class CahgAfficheServiceImpl implements CahgAfficheService {
	@Resource
	private CahgAfficheDao dao;


	/**
	 * @说明 首页公示公告
	 */
	@Override
	public List<HashMap> indexAfficheList(HashMap map) {
		// TODO Auto-generated method stub
		return dao.indexAfficheList(map);
	}

	/**
	 * @说明 公示公告详情显示
	 */
	@Override
	public HashMap afficheDetailsShow(HashMap map) {
		// TODO Auto-generated method stub
		return dao.afficheDetailsShow(map);
	}

	/**
	 * @说明 公示公告列表
	 */
	@Override
	public List<HashMap> afficheList(HashMap map) {
		// TODO Auto-generated method stub
		return dao.afficheList(map);
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
