package com.mobset.system.service;

import java.util.HashMap;
import java.util.List;

/**
 * @说明  图片新闻service
 * @创建人 陈礼刚
 * @时间 2017年6月26日14:41:41
 */
public interface CahgImgNewsService {
	/**
	 * @说明 图片新闻列表
	 */
	public List<HashMap> indexImgNewsList(HashMap map);
	
	/**
	 * @说明 图片新闻展示
	 */
	public HashMap imgNewDetailsShow(HashMap map);
	
	/**
	 * @说明
	 */
	public List<HashMap> imgNewsList(HashMap map);
	
	/**
	 * @说明 分页
	 */
	public Integer count(HashMap map);
}
