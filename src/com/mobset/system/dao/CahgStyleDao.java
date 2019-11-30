package com.mobset.system.dao;

import java.util.HashMap;
import java.util.List;

/**
 * @说明  长安风采dao
 * @创建人 陈礼刚
 * @时间 2017年6月26日14:39:26
 */

public interface CahgStyleDao {
	/**
	 * @说明 首页长安风采列表
	 */
	public List<HashMap> indexStyleList(HashMap map);
	
	/**
	 * @说明 长安风采展示
	 */
	public HashMap styleDetailsShow(HashMap map);	
	
	/**
	 * @说明 长安风采列表
	 */
	public List<HashMap> styleList(HashMap map);
	
	/**
	 * @说明 分页
	 */
	public Integer count(HashMap map);
}
