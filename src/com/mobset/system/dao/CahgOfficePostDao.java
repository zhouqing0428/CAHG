package com.mobset.system.dao;

import java.util.HashMap;
import java.util.List;

/**
 * @说明  本办发文dao
 * @创建人 陈礼刚
 * @时间 2017年6月27日9:29:06
 */

public interface CahgOfficePostDao {

	/**
	 * @说明 首页本办发文列表
	 */
	public List<HashMap> indexOfficePostList(HashMap map);
	
	/**
	 * @说明 本办发文内容展示
	 */
	public HashMap officePostDetailsShow(HashMap map);
	
	/**
	 * @说明 本办发文列表 
	 */
	public List<HashMap> officePostList(HashMap map);
	
	/**
	 * @说明 分页
	 */
	public Integer count(HashMap map);
	
	public HashMap selectIP();
	
}
