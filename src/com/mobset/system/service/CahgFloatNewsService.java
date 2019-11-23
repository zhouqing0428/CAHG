package com.mobset.system.service;

import java.util.HashMap;
import java.util.List;

/**
 * @说明  弹窗新闻service
 * @创建人 陈礼刚
 * @时间 2017年6月26日14:41:41
 */
public interface CahgFloatNewsService {
	/**
	 * @说明 弹窗新闻列表
	 */
	public List<HashMap> indexFloatNewsList(HashMap map);
	
	/**
	 * @说明 弹窗新闻展示
	 */
	public HashMap floatNewDetailsShow(HashMap map);
	
	/**
	 * @说明
	 */
	public List<HashMap> floatNewsList(HashMap map);
	
	/**
	 * @说明 分页
	 */
	public Integer count(HashMap map);
}
