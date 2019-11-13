package com.mobset.system.service;

import java.util.HashMap;
import java.util.List;

public interface CahgSurveyService {
	
	public HashMap selectSurver(HashMap map);
	
	public List<HashMap> selectSurverAnswer(String survey_question_id);
	
	public void survey(List<String> cks);

}
