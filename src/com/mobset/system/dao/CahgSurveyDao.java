package com.mobset.system.dao;

import java.util.HashMap;
import java.util.List;

public interface CahgSurveyDao {
	
	public HashMap selectSurver(HashMap map);
	
	public List<HashMap> selectSurverAnswer(String survey_question_id);
	
	public void survey(List<String> cks);

}
