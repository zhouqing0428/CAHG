package com.mobset.system.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mobset.system.dao.CahgJobDao;
import com.mobset.system.service.CahgJobService;

/**
 * @说明  工作督办serviceImpl
 * @创建人 陈礼刚
 * @时间 2017年7月16日13:36:50
 */

@Service("cahgJobService")
public class CahgJobServiceImpl implements CahgJobService {
	
	@Resource
	private CahgJobDao dao;

	/**
	 * @说明 首页工作督办列表
	 */
	public List<HashMap> indexJobList(HashMap map){
		return dao.indexJobList(map);
		
	}
	
	/**
	 * @说明 工作督办内容展示
	 */
	public HashMap jobDetailsShow(HashMap map){
		return dao.jobDetailsShow(map);
		
	}
	
	/**
	 * @说明 工作督办列表
	 */
	public List<HashMap> jobList(HashMap map){
		return dao.jobList(map);
		
	}
	
	/**
	 *  @说明 分页
	 */
	public Integer count(HashMap map){
		return dao.count(map);
	}

	@Override
	public List<HashMap> detailList(Integer job_id) {
		return dao.detailList(job_id);
	}

	@Override
	public int saveJobResult(Map<String, Object> map) {
		return dao.saveJobResult(map);
	}

	@Override
	public List<Map<String, Object>> queryJobResult(Map<String, Object> map) {
		return dao.queryJobResult(map);
	}

	@Override
	public int updateJobStatus(Map<String, Object> map) {
		return dao.updateJobStatus(map);
	}
	
}
