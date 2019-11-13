package com.mobset.system.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mobset.system.dao.CahgLetterDao;
import com.mobset.system.service.CahgLetterService;

@Service("cahgLetterService")
public class CahgLetterServiceImpl implements CahgLetterService {

	@Resource
	private CahgLetterDao dao;
	
	@Override
	public List<HashMap> letterInfo(HashMap map) {
		// TODO Auto-generated method stub
		return dao.letterInfo(map);
	}

	@Override
	public List<HashMap> letterList(HashMap map) {
		// TODO Auto-generated method stub
		return dao.letterList(map);
	}

	@Override
	public Integer count(HashMap map) {
		// TODO Auto-generated method stub
		return dao.count(map);
	}

	@Override
	public List<HashMap> reply(HashMap map) {
		// TODO Auto-generated method stub
		return dao.reply(map);
	}

	@Override
	public void addLetter(HashMap map) {
		// TODO Auto-generated method stub
		dao.addLetter(map);
	}

	@Override
	public HashMap selectUserNameRemark(HashMap map) {
		// TODO Auto-generated method stub
		return dao.selectUserNameRemark(map);
	}

	@Override
	public HashMap selectLetterConter(HashMap map) {
		// TODO Auto-generated method stub
		return dao.selectLetterConter(map);
	}

	@Override
	public HashMap selectAttentive(HashMap map) {
		// TODO Auto-generated method stub
		return dao.selectAttentive(map);
	}

}
