package com.mobset.system.dao;

import java.util.HashMap;
import java.util.List;

/**
 * @说明  每日信息dao
 * @创建人 陈礼刚
 * @时间 2017年6月27日13:36:50
 */

public interface CahgDayInfoDao {
	
	/**
	 * @说明 首页每日信息列表
	 */
	public List<HashMap> indexDayInfoList(HashMap map);
	
	/**
	 * @说明 每日信息内容展示
	 */
	public HashMap dayInfoDetailsShow(HashMap map);
	
	/**
	 * @说明 每日信息列表
	 */
	public List<HashMap> dayInfoList(HashMap map);
	
	/**
	 * @说明 分页
	 */
	public Integer count(HashMap map);
}
