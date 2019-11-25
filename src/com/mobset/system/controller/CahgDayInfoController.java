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

import com.mobset.system.service.CahgDayInfoService;
import com.mobset.system.util.Page;

/**
 * @说明  每日说明controller
 * @创建人 陈礼刚
 * @时间 2017年6月28日14:32:34
 */
@Controller
@RequestMapping("/cahgDayInfo")
public class CahgDayInfoController {
	
	@Resource(name="cahgDayInfoService")
	private CahgDayInfoService cahgDayInfoService;
	
	
	/**
	 * 每日说明详情页
	 */
	@RequestMapping(value="/dayInfoDetailsPage")
	public String dayInfoDetailsPage(HttpServletRequest request){
		String day_id = request.getParameter("day_id");
		HashMap map = new HashMap();//参数统一map
		if(day_id==null || "".equals(day_id)){//ID为空,进入404页面
			return "page/404";
		}
		map.put("day_id", day_id);
		HashMap newMap = cahgDayInfoService.dayInfoDetailsShow(map);
		request.setAttribute("newMap", newMap);
		return "dayInfo/day_info_details";
	}
	
	/**
	 * 每日信息列表页
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value="/dayInfoListPage")
	public String dayInfoListPage(HttpServletRequest request) throws UnsupportedEncodingException{
		HashMap map = new HashMap();
		
		String title = request.getParameter("title");
		if(title!=null && !"".equals(title)){
			title = URLDecoder.decode(title,"UTF-8");//解码
			request.setAttribute("title", title);
			map.put("title", "%"+title+"%");
		}
		
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss"); 
		Integer count = cahgDayInfoService.count(map);
		Page p =new Page();
		p.setCount(count);
		map.put("page",p.getPage());//从第几个开始
		map.put("rows",p.getPageSize());//每页大小
		
		request.setAttribute("pageCount", p.getPageCount()); //总页数
		request.setAttribute("count", p.getCount()); //总记录
		request.setAttribute("url", "cahgDayInfo/dayInfoListPage.do");//左导航判断用
		return "dayInfo/day_info_list";
	}
	
	/**
	 * @throws UnsupportedEncodingException 
	 * @说明 每日信息分页数据
	 */
	@RequestMapping(value="/dayInfoList")
	@ResponseBody
	public Map<String, Object> dayInfoList(HttpServletRequest request) throws UnsupportedEncodingException{
		String curPage = request.getParameter("curPage");//当前页
		HashMap map = new HashMap();//参数统一map
		Page p =new Page();
		p.setCurPage(Integer.parseInt(curPage));
		map.put("page",p.getPage());//从第几个开始
		map.put("rows",p.getPageSize());//每页大小
		
		String title = request.getParameter("title");
		if(title!=null && !"".equals(title)){
			title = URLDecoder.decode(title,"UTF-8");//解码
			map.put("title", "%"+title+"%");
		}
		List<HashMap> dayInfoList = cahgDayInfoService.dayInfoList(map);//每日信息新闻list
		Map<String, Object> result = new HashMap<String, Object>();//传值方式
		result.put("list", dayInfoList);
		
		return result;
	}
}
