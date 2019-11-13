package com.mobset.system.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mobset.system.service.CahgMeetingNoticeService;
import com.mobset.system.util.Page;


/**
 * @说明  会议通知controller
 * @创建人 陈礼刚
 * @时间 2017年7月6日14:56:51
 */
@Controller
@RequestMapping("/cahgMeetingNotice")
public class CahgMeetingNoticeController {
	
	@Resource(name="cahgMeetingNoticeSerivce")
	private CahgMeetingNoticeService cahgMeetingNoticeService;
	
	/**
	 * 会议通知详情页
	 */
	@RequestMapping(value="/meetingNoticeDetailsPage")
	public String meetingNoticeDetailsPage(HttpServletRequest request){
		String meeting_notice_id = request.getParameter("meeting_notice_id");
		HashMap map = new HashMap();//参数统一map
		if(meeting_notice_id==null || "".equals(meeting_notice_id)){//ID为空,进入404页面
			return "page/404";
		}
		map.put("meeting_notice_id", meeting_notice_id);
		HashMap newMap = cahgMeetingNoticeService.meetingNoticeDetailsShow(map);
		request.setAttribute("newMap", newMap);
		return "meetingNotice/meeting_notice_details";
	}
	
	
	
	/**
	 * 会议通知列表页
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value="/meetingNoticeListPage")
	public String meetingNoticeListPage(HttpServletRequest request) throws UnsupportedEncodingException{
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss"); 
		HashMap map = new HashMap();
		
		String title = request.getParameter("title");
		if(title!=null && !"".equals(title)){
			title = URLDecoder.decode(title,"UTF-8");//解码
			request.setAttribute("title", title);
			map.put("title", "%"+title+"%");
		}
		
		Integer count = cahgMeetingNoticeService.count(map);
		Page p =new Page();
		p.setCount(count);
		map.put("page",p.getPage());//从第几个开始
		map.put("rows",p.getPageSize());//每页大小
		request.setAttribute("pageCount", p.getPageCount()); //总页数
		request.setAttribute("count", p.getCount()); //总记录
		request.setAttribute("url", "cahgMeetingNotice/meetingNoticeListPage.do");//左导航判断用
		return "meetingNotice/meeting_notice_list";
	}
	
	/**
	 * @throws UnsupportedEncodingException 
	 * @说明 每日信息分页数据
	 */
	@RequestMapping(value="/meetingNoticeList")
	@ResponseBody
	public Map<String, Object> meetingNoticeList(HttpServletRequest request) throws UnsupportedEncodingException{
		String curPage = request.getParameter("curPage");//当前页
		HashMap map = new HashMap();//参数统一map
		Page p =new Page();
		p.setCurPage(Integer.parseInt(curPage));
		map.put("page",p.getPage());//从第几个开始
		map.put("rows",p.getPageSize());//每页大小
		
		String title = request.getParameter("title");
		if(title!=null && !"".equals(title)){
			title = URLDecoder.decode(title,"UTF-8");//解码
			request.setAttribute("title", title);
			map.put("title", "%"+title+"%");
		}
		
		List<HashMap> dayInfoList = cahgMeetingNoticeService.meetingNoticeList(map);//数据
		Map<String, Object> result = new HashMap<String, Object>();//传值方式
		result.put("list", dayInfoList);
		return result;
	}
	
	
	/**
	 * 申请会议室
	 */
	@RequestMapping(value="/meetingRoomPage")
	public String meetingRoomPage(HttpServletRequest request){
		List<HashMap> meetingRoomList = cahgMeetingNoticeService.selectHis(null);
		request.setAttribute("meetingRoomList", meetingRoomList);
		return "meetingNotice/meeting_room";
	}
}
