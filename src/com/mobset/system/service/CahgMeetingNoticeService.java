package com.mobset.system.service;

import java.util.HashMap;
import java.util.List;


/**
 * @说明  会议通知Service
 * @创建人 陈礼刚
 * @时间 2017年7月6日14:56:51
 */
public interface CahgMeetingNoticeService {
	
	/**
	 * @说明 首页会议通知列表
	 */
	public List<HashMap> indexMeetingNoticeList(HashMap map);
	
	/**
	 * @说明 会议通知详情显示
	 */
	public HashMap meetingNoticeDetailsShow(HashMap map);

	/**
	 * @说明 会议通知列表
	 */
	public List<HashMap> meetingNoticeList(HashMap map);
	
	/**
	 * @说明 分页
	 */
	public Integer count(HashMap map);

	public List<HashMap> selectRoom(HashMap map);
	
	public List<HashMap> selectHis(HashMap map);
}
