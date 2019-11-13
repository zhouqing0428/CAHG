package com.mobset.system.service;

import java.util.HashMap;
import java.util.List;

/**
 * @说明  重点工作serivce
 * @创建人 陈礼刚
 * @时间 2017年7月20日9:52:06
 */

public interface CahgImptWordService {

	/**
	 * @说明 首页重点工作列表
	 */
	public List<HashMap> indexImptWorkList(HashMap map);
	
	/**
	 * @说明 重点工作内容展示
	 */
	public HashMap imptWorkDetailsShow(HashMap map);
	
	/**
	 * @说明 重点工作列表 
	 */
	public List<HashMap> imptWorkList(HashMap map);
	
	/**
	 * @说明 分页
	 */
	public Integer count(HashMap map);
	
}
