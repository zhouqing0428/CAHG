package com.mobset.system.service;

import java.util.HashMap;
import java.util.List;

public interface deptService {
	
	public List<HashMap> deptSelectList(HashMap map);

	public HashMap deptDetails(HashMap map);
	
	public List<HashMap> officeWorkCategory(HashMap map);
	
	public List<HashMap> officeWorkFile(HashMap map);
	
	public Integer count(HashMap map);
	
	public List<HashMap> selectDeptRegime(HashMap map);
	
	public Integer selectDeptRegimeCount(HashMap map);
	
	public List<HashMap> selectWorkStandard(HashMap map);
	
	public Integer selectWorkStandardCount(HashMap map);
}
