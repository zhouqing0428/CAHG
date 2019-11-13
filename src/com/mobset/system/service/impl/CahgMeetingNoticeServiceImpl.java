package com.mobset.system.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mobset.system.dao.CahgMeetingNoticeDao;
import com.mobset.system.service.CahgMeetingNoticeService;

/**
 * @说明  会议通知ServiceImpl
 * @创建人 陈礼刚
 * @时间 2017年7月6日14:56:51
 */
@Service("cahgMeetingNoticeSerivce")
public class CahgMeetingNoticeServiceImpl implements CahgMeetingNoticeService{
	
	@Resource
	private CahgMeetingNoticeDao dao;
	
	/**
	 * @说明 首页会议通知列表
	 */
	@Override
	public List<HashMap> indexMeetingNoticeList(HashMap map) {
		// TODO Auto-generated method stub
		return dao.indexMeetingNoticeList(map);
	}

	/**
	 * @说明 会议通知内容展示
	 */
	@Override
	public HashMap meetingNoticeDetailsShow(HashMap map) {
		// TODO Auto-generated method stub
		return dao.meetingNoticeDetailsShow(map);
	}

	/**
	 * @说明 会议通知列表
	 */
	@Override
	public List<HashMap> meetingNoticeList(HashMap map) {
		// TODO Auto-generated method stub
		return dao.meetingNoticeList(map);
	}

	@Override
	public Integer count(HashMap map) {
		// TODO Auto-generated method stub
		return dao.count(map);
	}

	@Override
	public List<HashMap> selectRoom(HashMap map) {
		// TODO Auto-generated method stub
		return dao.selectRoom(map);
	}

	@Override
	public List<HashMap> selectHis(HashMap map) {
		// TODO Auto-generated method stub
		return dao.selectHis(map);
	}

}
