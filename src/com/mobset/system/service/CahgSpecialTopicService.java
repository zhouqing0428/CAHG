package com.mobset.system.service;

import java.util.HashMap;
import java.util.List;

public interface CahgSpecialTopicService {
	
	/**
	 * @说明 首页专题专栏类型列表 
	 */
	public List<HashMap> indexSpecialTopicCategoryList(HashMap map);
	
	/**
	 * @说明 详情展示
	 */
	public HashMap specialTopicDetailsShow(HashMap map);
	
	/**
	 * @说明  左导航类型
	 */
	public List<HashMap> specialLeftList(HashMap map);
	
	/**
	 * @说明 列表页
	 */
	public List<HashMap> specialTopicList(HashMap map);

	
	/**
	 * @说明 分页
	 */
	public Integer count(HashMap map);
}
