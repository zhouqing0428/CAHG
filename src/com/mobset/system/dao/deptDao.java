package com.mobset.system.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface deptDao {

	public List<HashMap> deptSelectList(HashMap map);
	
	public HashMap deptDetails(HashMap map);
	
	public List<HashMap> officeWorkCategory(HashMap map);
	
	public List<HashMap> officeWorkFile(HashMap map);
	
	public Integer count(HashMap map);
	
	public List<HashMap> selectDeptRegime(HashMap map);
	
	public Integer selectDeptRegimeCount(HashMap map);
	
	public List<HashMap> selectWorkStandard(HashMap map);
	
	public Integer selectWorkStandardCount(HashMap map);
	
	public List<Map<String, Object>> queryListByIds(List<String> list);
}
