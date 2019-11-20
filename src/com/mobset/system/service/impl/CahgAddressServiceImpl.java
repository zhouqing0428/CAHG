package com.mobset.system.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mobset.system.dao.CahgAddressLookDao;
import com.mobset.system.service.CahgAddressLookService;
/**
 * @说明  通讯录serviceImpl
 * @创建人 陈礼刚
 * @时间 2017年7月10日13:45:27
 */
@Service("cahgAddressLookService")
public class CahgAddressServiceImpl implements CahgAddressLookService {

	@Resource
	private CahgAddressLookDao dao;

	/**
	 * @说明 通讯录列表
	 */
	@Override
	public List<HashMap> addressLookList(HashMap map) {
		return dao.addressLookList(map);
	}

	@Override
	public HashMap selectDepteAddress(HashMap map) {
		return dao.selectDepteAddress(map);
	}
}
