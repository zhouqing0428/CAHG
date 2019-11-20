package com.mobset.system.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @说明  字典表dao
 * @创建人 陈礼刚
 * @时间 2017年6月28日13:49:13
 */
public interface SysDictionaryDao {
		
	/**
	 * @说明 新闻类型列表
	 */
	public List<HashMap> newTypeList(HashMap map);
	
	/**
	 * @说明 科室列表
	 */
	public List<Map<String, Object>> deptList(Map<String, Object> map);
	
	/**
	 * @说明 科室查询
	 */
	public HashMap deptSelect(HashMap map);
	
	/**
	 * @说明 常用表格
	 */
	public List<HashMap> selectFormList(HashMap map);
	public Integer formCount(HashMap map);
	public HashMap wishSelect(HashMap map);
	public HashMap selectpicture();
}
