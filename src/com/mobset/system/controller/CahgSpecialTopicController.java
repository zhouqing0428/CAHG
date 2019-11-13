package com.mobset.system.controller;

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

import com.mobset.system.service.CahgSpecialTopicService;
import com.mobset.system.util.Page;

@Controller
@RequestMapping("/cahgSpecialTopic")
public class CahgSpecialTopicController {

	@Resource(name="cahgSpecialTopicService")
	private CahgSpecialTopicService cahgSpecialTopicService;
	
	/**
	 * 专题专栏详情页
	 */
	@RequestMapping(value="/specialTopicDetailsPage")
	public String specialTopicDetailsPage(HttpServletRequest request){
		String special_topic_id = request.getParameter("special_topic_id");
		HashMap map = new HashMap();//参数统一map
		if(special_topic_id==null || "".equals(special_topic_id)){//ID为空,进入404页面
			return "page/404";
		}
		map.put("special_topic_id", special_topic_id);
		HashMap newMap = cahgSpecialTopicService.specialTopicDetailsShow(map);
		request.setAttribute("newMap", newMap);
		return "specialTopic/special_topic_details";
	}
	
	/**
	 * 专题专栏列表页
	 */
	@RequestMapping(value="/specialTopicListPage")
	public String specialTopicListPage(HttpServletRequest request){
		String special_topic_category_id = request.getParameter("url");
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss"); 
		HashMap map = new HashMap();
		map.put("special_topic_category_id", special_topic_category_id);
		Integer count = cahgSpecialTopicService.count(map);
		Page p =new Page();
		p.setCount(count);
		map.put("page",p.getPage());//从第几个开始
		map.put("rows",p.getPageSize());//每页大小
		request.setAttribute("pageCount", p.getPageCount()); //总页数
		request.setAttribute("count", p.getCount()); //总记录
		request.setAttribute("url", special_topic_category_id);//左导航判断用
		return "specialTopic/special_topic_list";
	}
	
	/**
	 * @说明 每日信息分页数据
	 */
	@RequestMapping(value="/specialTopicList")
	@ResponseBody
	public Map<String, Object> specialTopicList(HttpServletRequest request){
		String special_topic_category_id = request.getParameter("url");
		String curPage = request.getParameter("curPage");//当前页
		HashMap map = new HashMap();//参数统一map
		Page p =new Page();
		p.setCurPage(Integer.parseInt(curPage));
		map.put("page",p.getPage());//从第几个开始
		map.put("rows",p.getPageSize());//每页大小
		map.put("special_topic_category_id", special_topic_category_id);
		List<HashMap> dayInfoList = cahgSpecialTopicService.specialTopicList(map);
		Map<String, Object> result = new HashMap<String, Object>();//传值方式
		result.put("list", dayInfoList);
		return result;
	}
	
}
