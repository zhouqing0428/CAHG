package com.mobset.system.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mobset.system.dao.CahgLeaderSpeechDao;
import com.mobset.system.service.CahgLeaderSpeechService;

/**
 * @说明  领导讲话ServiceIMpl
 * @创建人 陈礼刚
 * @时间 2017年6月26日14:41:41
 */

@Service("cahgLeaderSpeechService")
public class CahgLeaderSpeechServiceImpl implements CahgLeaderSpeechService{

	@Resource
	private CahgLeaderSpeechDao dao;
	
	/**
	 * @说明 首页领导讲话列表
	 */
	@Override
	public List<HashMap> indexLeaderSpeechList(HashMap map) {
		// TODO Auto-generated method stub
		return dao.indexLeaderSpeechList(map);
	}

	/**
	 * @说明 领导讲话详情展示
	 */
	@Override
	public HashMap leaderSpeechDetailsShow(HashMap map) {
		// TODO Auto-generated method stub
		return dao.leaderSpeechDetailsShow(map);
	}

	/**
	 * @说明 领导讲话列表
	 */
	@Override
	public List<HashMap> leaderSpeechList(HashMap map) {
		// TODO Auto-generated method stub
		return dao.leaderSpeechList(map);
	}

	/**
	 * @说明 分页
	 */
	@Override
	public Integer count(HashMap map) {
		// TODO Auto-generated method stub
		return dao.count(map);
	}

	@Override
	public List<HashMap> indexLeaderBSpeechList(HashMap map) {
		// TODO Auto-generated method stub
		return dao.indexLeaderBSpeechList(map);
	}

}
