package com.mobset.system.dao;

import java.util.HashMap;
import java.util.List;

/**
 * @说明  领导讲话dao
 * @创建人 陈礼刚
 * @时间 2017年6月29日13:39:06
 */
public interface CahgLeaderSpeechDao {
	/**
	 * @说明 首页领导讲话列表
	 */
	public List<HashMap> indexLeaderSpeechList(HashMap map);
	
	public List<HashMap> indexLeaderBSpeechList(HashMap map);
	
	/**
	 * @说明 领导讲话详情展示
	 */
	public HashMap leaderSpeechDetailsShow(HashMap map);
	
	/**
	 * @说明 领导讲话列表
	 */
	public List<HashMap> leaderSpeechList(HashMap map);
	
	/**
	 * @说明 分页
	 */
	public Integer count(HashMap map);
}
