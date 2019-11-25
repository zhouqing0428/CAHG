package com.mobset.system.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @说明  工作督办service
 * @创建人 陈礼刚
 * @时间 2017年7月16日13:36:50
 */
public interface CahgJobService {
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
	
	/**
	 * 保存工作督办完成情况记录
	 * @param map
	 * @return
	 */
	public int saveJobResult(Map<String,Object> map);
	
	/**
	 * 获取工作督办完成情况
	 * @param map
	 * @return
	 */
	List<Map<String, Object>> queryJobResult(Map<String, Object> map);
	
	/**
	 * 修改工作督办状态
	 * @param map
	 * @return
	 */
	int updateJobStatus(Map<String, Object> map);
}
