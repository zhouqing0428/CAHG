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

import com.mobset.system.service.CahgStyleService;
import com.mobset.system.service.SysDictionaryService;
import com.mobset.system.util.Page;


/**
 * @说明  首页controller
 * @创建人 陈礼刚
 * @时间 2017年6月26日17:12:30
 */
@Controller
@RequestMapping("/cahgStyle")
public class CahgStyleController {
	
	@Resource(name="cahgStyleService")
	private CahgStyleService cahgStyleService;
	
	
	/**
	 *  长安风采详情页
	 */
	@RequestMapping(value="/styleDetailsPage")
	public String styleDetailsPage(HttpServletRequest request){
		String style_id = request.getParameter("style_id");
		HashMap map = new HashMap();//参数统一map
		if(style_id==null || "".equals(style_id)){//ID为空,进入404页面
			return "page/404";
		}
		map.put("style_id", style_id);
		HashMap newMap = cahgStyleService.styleDetailsShow(map);
		request.setAttribute("newMap", newMap);
		return "style/style_details";
	}
	
	/**
	 * 长安风采列表页
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value="/styleListPage")
	public String styleListPage(HttpServletRequest request) throws UnsupportedEncodingException{
		HashMap map = new HashMap();//参数统一map
		
		String title = request.getParameter("title");
		if(title!=null && !"".equals(title)){
			title = URLDecoder.decode(title,"UTF-8");//解码
			request.setAttribute("title", title);
			map.put("title", "%"+title+"%");
		}
		
		String cateId = request.getParameter("cateId");
		if(cateId!=null && !"".equals(cateId)){
			request.setAttribute("cateId", cateId);
			map.put("cateId", "%"+cateId+"%");
		}
		
		
		Integer count = cahgStyleService.count(map);//总记录数
		Page p =new Page();
		p.setCount(count);
		map.put("page",p.getPage());//从第几个开始
		map.put("rows",p.getPageSize());//每页大小
		
		List<HashMap> styleCateList = cahgStyleService.styleCateList(map);
		
		request.setAttribute("styleCateList", styleCateList); //总页数
		request.setAttribute("pageCount", p.getPageCount()); //总页数
		request.setAttribute("count", p.getCount()); //总记录
		request.setAttribute("url", "cahgStyle/styleListPage.do");//左导航判断用
		return "style/style_list";
	}
	
	/**
	 * 长安风采列表数据
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value="/styleList")
	@ResponseBody
	public Map<String, Object> styleList(HttpServletRequest request) throws UnsupportedEncodingException{
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
		
		String cateId = request.getParameter("cateId");
		if(cateId!=null && !"".equals(cateId)){
			request.setAttribute("cateId", cateId);
			map.put("cateId", "%"+cateId+"%");
		}
		
		List<HashMap> styleList = cahgStyleService.styleList(map);//风采图片list
		Map<String, Object> result = new HashMap<String, Object>();//传值方式
		result.put("list", styleList);
		return result;
	}
}
