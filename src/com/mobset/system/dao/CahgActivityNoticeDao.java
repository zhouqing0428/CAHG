package com.mobset.system.dao;

import java.util.List;
import java.util.Map;

public interface CahgActivityNoticeDao {

	/**
	 * 首页活动通知展示
	 * @param map
	 * @return
	 */
	public List<Map<String, Object>> queryIndexList(Map<String, Object> map);
	
	/**
	 * 查询活动通知列表
	 * @param map
	 * @return
	 */
	public List<Map<String, Object>> queryList(Map<String, Object> map);
	
	/**
	 * 查询活动通知条数
	 * @param map
	 * @return
	 */
	public int queryCount(Map<String, Object> map);
	
	/**
	 * 查询活动通知信息
	 * @param map
	 * @return
	 */
	public Map<String, Object> queryObject(Map<String, Object> map);
}
