package com.mobset.system.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mobset.system.service.CahgCustomNewsService;
import com.mobset.system.util.Page;

/**
 * @说明  海关新闻controller
 * @创建人 陈礼刚
 * @时间 2017年7月5日10:37:46
 */
@Controller
@RequestMapping("/cahgCustomNews")
public class CahgCustomNewsController {
	
	@Resource(name="cahgCustomNewsService")
	private CahgCustomNewsService cahgCustomNewsService;
	
	/**
	 * 海关新闻详情页
	 */
	@RequestMapping(value="/customNewsDetailsShow")
	public String customNewsDetailsShow(HttpServletRequest request){
		String custom_news_id = request.getParameter("custom_news_id");
		HashMap map = new HashMap();//参数统一map
		if(custom_news_id==null || "".equals(custom_news_id)){//ID为空,进入404页面
			return "page/404";
		}
		map.put("custom_news_id", custom_news_id);
		HashMap newMap = cahgCustomNewsService.customNewsDetailsShow(map);
		request.setAttribute("newMap", newMap);
		return "customNews/custom_news_details";
	}
	
	
	/**
	 * 领导列表页
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value="/customNewsListPage")
	public String customNewsListPage(HttpServletRequest request) throws UnsupportedEncodingException{
		HashMap map = new HashMap();
		
		String title = request.getParameter("title");
		if(title!=null && !"".equals(title)){
			title = URLDecoder.decode(title,"UTF-8");//解码
			request.setAttribute("title", title);
			map.put("title", "%"+title+"%");
		}
		
		Integer count = cahgCustomNewsService.count(map);
		Page p =new Page();
		p.setCount(count);
		map.put("page",p.getPage());//从第几个开始
		map.put("rows", p.getPageSize());//每页大小
		request.setAttribute("pageCount", p.getPageCount()); //总页数
		request.setAttribute("count", p.getCount()); //总记录
		request.setAttribute("url", "cahgCustomNews/customNewsListPage.do");//左导航判断用
		return "customNews/custom_news_list";
	}
	
	/**
	 * @throws UnsupportedEncodingException 
	 * @说明 领导分页数据
	 */
	@RequestMapping(value="/customNewsList")
	@ResponseBody
	public Map<String, Object> customNewsList(HttpServletRequest request) throws UnsupportedEncodingException{
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
		
		List<HashMap> dayInfoList = cahgCustomNewsService.customNewsList(map);//海关新闻list
		Map<String, Object> result = new HashMap<String, Object>();//传值方式
		result.put("list", dayInfoList);
		return result;
	}
	
}
