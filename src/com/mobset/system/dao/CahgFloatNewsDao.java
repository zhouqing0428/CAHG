package com.mobset.system.dao;

import java.util.HashMap;
import java.util.List;

/**
 * @说明  图片新闻dao
 * @创建人 陈礼刚
 * @时间 2017年6月26日14:39:26
 */

public interface CahgFloatNewsDao {
	/**
	 * @说明 首页图片新闻列表
	 */
	public List<HashMap> indexFloatNewsList(HashMap map);
	
	/**
	 * @说明 图片新闻展示
	 */
	public HashMap floatNewDetailsShow(HashMap map);	
	
	/**
	 * @说明 图片新闻列表
	 */
	public List<HashMap> floatNewsList(HashMap map);
	
	/**
	 * @说明 分页
	 */
	public Integer count(HashMap map);
}
