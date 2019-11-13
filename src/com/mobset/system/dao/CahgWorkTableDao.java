package com.mobset.system.dao;

import java.util.HashMap;
import java.util.List;

public interface CahgWorkTableDao {

	public List<HashMap> selectTableCategory(HashMap map);
	
	public List<HashMap> selectWorkTable(HashMap map);
	
	public List<HashMap> workTableList(HashMap map);
	
	public Integer count(HashMap map);
	
	public List<HashMap> selectType(HashMap map);
}
