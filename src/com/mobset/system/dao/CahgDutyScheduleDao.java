package com.mobset.system.dao;

import java.util.HashMap;
import java.util.List;

public interface CahgDutyScheduleDao {
	
	public List<HashMap> selectDutyList(HashMap map);
	
	public Integer count(HashMap map);
	
	public HashMap selectDutyInfo(HashMap map);

}
