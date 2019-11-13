package com.mobset.system.service;

import java.util.HashMap;
import java.util.List;

/**
 * @说明  海关新闻service
 * @创建人 陈礼刚
 * @时间 2017年7月5日10:37:46
 */

public interface CahgCustomNewsService {
	
	/**
	 * @说明 首页海关新闻列表
	 */
	public List<HashMap> indexCustomNewsList(HashMap map);
	
	/**
	 * @说明 海关新闻详情显示
	 */
	public HashMap customNewsDetailsShow(HashMap map);
	
	/**
	 * @说明 海鲜新闻列表页
	 */
	public List<HashMap> customNewsList(HashMap map);
	
	/**
	 * @说明 分页
	 */
	public Integer count(HashMap map);

}
