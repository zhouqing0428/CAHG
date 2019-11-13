package com.mobset.system.service;

import java.util.HashMap;
import java.util.List;

public interface CahgWorkTableService {
	
	public List<HashMap> selectTableCategory(HashMap map);
	
	public List<HashMap> selectWorkTable(HashMap map);
	
	public List<HashMap> workTableList(HashMap map);
	
	public Integer count(HashMap map);
	
	public List<HashMap> selectType(HashMap map);

}
