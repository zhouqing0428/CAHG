package com.mobset.system.service;

import java.util.HashMap;
import java.util.List;

/**
 * @说明 长安风采service
 * @创建人 陈礼刚
 * @时间 2017年6月26日14:41:41
 */
public interface CahgStyleService {
	/**
	 * @说明 弹窗新闻列表
	 */
	public List<HashMap> indexStyleList(HashMap map);
	
	/**
	 * @说明 弹窗新闻展示
	 */
	public HashMap styleDetailsShow(HashMap map);
	
	/**
	 * @说明
	 */
	public List<HashMap> styleList(HashMap map);
	
	public List<HashMap> styleCateList(HashMap map);
	
	/**
	 * @说明 分页
	 */
	public Integer count(HashMap map);
}
