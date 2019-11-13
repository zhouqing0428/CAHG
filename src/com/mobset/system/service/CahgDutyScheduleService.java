package com.mobset.system.service;

import java.util.HashMap;
import java.util.List;

public interface CahgDutyScheduleService {
	
	public List<HashMap> selectDutyList(HashMap map);
	
	public Integer count(HashMap map);
	
	public HashMap selectDutyInfo(HashMap map);

}
