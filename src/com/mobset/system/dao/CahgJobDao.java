package com.mobset.system.dao;

import java.util.HashMap;
import java.util.List;

/**
 * @说明  工作督办dao
 * @创建人 陈礼刚
 * @时间 2017年7月16日13:36:50
 */


public interface CahgJobDao {
	
	/**
	 * @说明 首页工作督办列表
	 */
	public List<HashMap> indexJobList(HashMap map);
	
	/**
	 * @说明 工作督办内容展示
	 */
	public HashMap jobDetailsShow(HashMap map);
	
	/**
	 * @说明 工作督办列表
	 */
	public List<HashMap> jobList(HashMap map);
	
	/**
	 *  @说明 分页
	 */
	public Integer count(HashMap map);
	
	/**
	 * @说明 跟进内容
	 */
	public List<HashMap> detailList(Integer job_id);
}
