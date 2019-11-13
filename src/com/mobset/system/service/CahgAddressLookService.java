package com.mobset.system.service;

import java.util.HashMap;
import java.util.List;

/**
 * @说明  通讯录service
 * @创建人 陈礼刚
 * @时间 2017年7月10日13:45:27
 */
public interface CahgAddressLookService {

	/**
	 * @说明 通讯录列表
	 */
	public List<HashMap> addressLookList(HashMap map);
	
	public HashMap selectDepteAddress(HashMap map);
}
