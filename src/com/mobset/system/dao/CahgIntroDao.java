package com.mobset.system.dao;

import java.util.HashMap;
import java.util.List;

public interface CahgIntroDao {
	HashMap selectIntro(HashMap map);
	
	HashMap selectIntro2(HashMap map);
	
	List<HashMap> introFile(HashMap map);
	
	Integer count(HashMap map);
}
