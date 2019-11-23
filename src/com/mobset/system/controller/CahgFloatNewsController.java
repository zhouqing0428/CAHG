package com.mobset.system.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mobset.system.service.CahgFloatNewsService;
import com.mobset.system.service.SysDictionaryService;
import com.mobset.system.util.Page;


/**
 * @说明  首页controller
 * @创建人 陈礼刚
 * @时间 2017年6月26日17:12:30
 */
@Controller
@RequestMapping("/cahgFloatNews")
public class CahgFloatNewsController {
	
	@Resource(name="cahgFloatNewsService")
	private CahgFloatNewsService cahgFloatNewsService;
	
	
	/**
	 *  图片新闻详情页
	 */
	@RequestMapping(value="/floatNewsDetailsPage")
	public String floatNewsDetailsPage(HttpServletRequest request){
		String float_new_id = request.getParameter("float_new_id");
		HashMap map = new HashMap();//参数统一map
		if(float_new_id==null || "".equals(float_new_id)){//ID为空,进入404页面
			return "page/404";
		}
		map.put("float_new_id", float_new_id);
		HashMap newMap = cahgFloatNewsService.floatNewDetailsShow(map);//图片新闻详情
		request.setAttribute("newMap", newMap);
		return "floatNews/float_new_details";
	}
	
	/**
	 * 图片新闻列表页
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value="/floatNewsListPage")
	public String floatNewsListPage(HttpServletRequest request) throws UnsupportedEncodingException{
		HashMap map = new HashMap();//参数统一map
		
		String title = request.getParameter("title");
		if(title!=null && !"".equals(title)){
			title = URLDecoder.decode(title,"UTF-8");//解码
			request.setAttribute("title", title);
			map.put("title", "%"+title+"%");
		}
		
		Integer count = cahgFloatNewsService.count(map);//总记录数
		Page p =new Page();
		p.setCount(count);
		map.put("page",p.getPage());//从第几个开始
		map.put("rows",p.getPageSize());//每页大小
		request.setAttribute("pageCount", p.getPageCount()); //总页数
		request.setAttribute("count", p.getCount()); //总记录
		request.setAttribute("url", "cahgFloatNews/floatNewsListPage.do");//左导航判断用
		return "floatNews/float_new_list";
	}
	
	/**
	 * 图片新闻列表数据
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value="/floatNewsList")
	@ResponseBody
	public Map<String, Object> floatNewsList(HttpServletRequest request) throws UnsupportedEncodingException{
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
		
		List<HashMap> floatNewsList = cahgFloatNewsService.floatNewsList(map);//图片新闻list
		Map<String, Object> result = new HashMap<String, Object>();//传值方式
		result.put("list", floatNewsList);
		return result;
	}
}
