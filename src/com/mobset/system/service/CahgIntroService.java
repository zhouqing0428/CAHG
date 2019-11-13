package com.mobset.system.service;

import java.util.HashMap;
import java.util.List;

public interface CahgIntroService {
	HashMap selectIntro(HashMap map);
	
	HashMap selectIntro2(HashMap map);
	
	List<HashMap> introFile(HashMap map);
	
	Integer count(HashMap map);
	
}
