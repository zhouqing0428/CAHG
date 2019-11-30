package com.mobset.system.service;

import java.util.List;
import java.util.Map;

public interface CahgViolationService {

	/**
	 * 首页违纪曝光展示
	 * @param map
	 * @return
	 */
	public List<Map<String, Object>> queryIndexList(Map<String, Object> map);
	
	/**
	 * 查询违纪曝光列表
	 * @param map
	 * @return
	 */
	public List<Map<String, Object>> queryList(Map<String, Object> map);
	
	/**
	 * 查询违纪曝光条数
	 * @param map
	 * @return
	 */
	public int queryCount(Map<String, Object> map);
	
	/**
	 * 查询违纪曝光信息
	 * @param map
	 * @return
	 */
	public Map<String, Object> queryObject(Map<String, Object> map);
}
