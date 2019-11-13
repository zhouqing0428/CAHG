package com.mobset.system.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mobset.system.dao.CahgOfficePostDao;
import com.mobset.system.service.CahgOfficePostService;

/**
 * @说明  本办发文seriviceImpl
 * @创建人 陈礼刚
 * @时间 2017年6月27日9:29:06
 */

@Service("cahgOfficePostService")
public class CahgOfficePostServiceImpl implements CahgOfficePostService {


	@Resource
	private CahgOfficePostDao dao;
	
	/**
	 * @说明 首页本办发文列表
	 */
	public List<HashMap> indexOfficePostList(HashMap map){
		return dao.indexOfficePostList(map);
	};
	
	/**
	 * @说明 本办发文内容展示
	 */
	public HashMap officePostDetailsShow(HashMap map){
		return dao.officePostDetailsShow(map);
	};
	
	/**
	 * @说明 本办发文列表 
	 */
	public List<HashMap> officePostList(HashMap map){
		return dao.officePostList(map);
	};
	
	/**
	 * @说明 分页
	 */
	public Integer count(HashMap map){
		return dao.count(map);
	}

	@Override
	public HashMap selectIP() {
		// TODO Auto-generated method stub
		return dao.selectIP();
	};
	
}
