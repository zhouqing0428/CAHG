package com.mobset.system.service;

import java.util.HashMap;
import java.util.List;

public interface CahgLetterService {
	
	public List<HashMap> letterInfo(HashMap map);
	
	public List<HashMap> letterList(HashMap map);
	
	public Integer count(HashMap map);
	
	public List<HashMap> reply(HashMap map);
	
	public void addLetter(HashMap map);

	public HashMap selectUserNameRemark(HashMap map);
	
	public HashMap selectLetterConter(HashMap map);
	
	public HashMap selectAttentive(HashMap map);
}
