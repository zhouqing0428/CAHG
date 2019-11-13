package com.mobset.system.service;

import java.util.HashMap;
import java.util.List;

/**
 * @说明  公示公告service
 * @创建人 陈礼刚
 * @时间 2017年7月6日16:09:13
 */
public interface CahgAfficheService {
	
	/**
	 * @说明 首页公示公告
	 */
	public List<HashMap> indexAfficheList(HashMap map);
	
	/**
	 * @说明 公示公告详情显示
	 */
	public HashMap afficheDetailsShow(HashMap map);
	
	/**
	 * @说明 公示公告列表
	 */
	public List<HashMap> afficheList(HashMap map);
	
	/**
	 * @说明 分页
	 */
	public Integer count(HashMap map);

}
