package com.mobset.system.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mobset.system.dao.CahgSurveyDao;
import com.mobset.system.service.CahgSurveyService;

@Service("cahgSurveyService")
public class CahgSurveyServiceImpl implements CahgSurveyService {
	
	@Resource
	private CahgSurveyDao dao;
	

	@Override
	public HashMap selectSurver(HashMap map) {
		// TODO Auto-generated method stub
		return dao.selectSurver(map);
	}


	@Override
	public List<HashMap> selectSurverAnswer(String survey_question_id) {
		// TODO Auto-generated method stub
		return dao.selectSurverAnswer(survey_question_id);
	}


	@Override
	public void survey(List<String> cks) {
		// TODO Auto-generated method stub
		dao.survey(cks);
	}

}
