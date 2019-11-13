package com.mobset.system.dao;

import java.util.HashMap;
import java.util.List;

public interface CahgMeetingNoticeDao {
	
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
