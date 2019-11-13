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

import com.mobset.system.service.CahgAfficheService;
import com.mobset.system.util.Page;

/**
 * @说明  公示公告controller
 * @创建人 陈礼刚
 * @时间 2017年7月6日16:09:13
 */
@Controller
@RequestMapping("/cahgAffiche")
public class CahgAfficheController {
	
	@Resource(name="cahgAfficheService")
	private CahgAfficheService cahgAfficheService;
	
	/**
	 * 公示公告详情页
	 */
	@RequestMapping(value="/afficheDetailsPage")
	public String afficheDetailsPage(HttpServletRequest request){
		String affiche_id = request.getParameter("affiche_id");
		HashMap map = new HashMap();//参数统一map
		if(affiche_id==null || "".equals(affiche_id)){//ID为空,进入404页面
			return "page/404";
		}
		map.put("affiche_id", affiche_id);
		HashMap newMap = cahgAfficheService.afficheDetailsShow(map);
		request.setAttribute("newMap", newMap);
		return "affiche/affiche_details";
	}
	
	
	
	/**
	 * 公示公告列表页
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value="/afficheListPage")
	public String afficheListPage(HttpServletRequest request) throws UnsupportedEncodingException{
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss"); 
		HashMap map = new HashMap();
		
		String title = request.getParameter("title");
		if(title!=null && !"".equals(title)){
			title = URLDecoder.decode(title,"UTF-8");//解码
			request.setAttribute("title", title);
			map.put("title", "%"+title+"%");
		}
		
		Integer count = cahgAfficheService.count(map);
		Page p =new Page();
		p.setCount(count);
		map.put("page",p.getPage());//从第几个开始
		map.put("rows",p.getPageSize());//每页大小
		request.setAttribute("pageCount", p.getPageCount()); //总页数
		request.setAttribute("count", p.getCount()); //总记录
		request.setAttribute("url", "cahgAffiche/afficheListPage.do");//左导航判断用
		return "affiche/affiche_list";
	}
	
	/**
	 * @throws UnsupportedEncodingException 
	 * @说明 公示公告分页数据
	 */
	@RequestMapping(value="/afficheList")
	@ResponseBody
	public Map<String, Object> afficheList(HttpServletRequest request) throws UnsupportedEncodingException{
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
		
		List<HashMap> dayInfoList = cahgAfficheService.afficheList(map);//数据
		Map<String, Object> result = new HashMap<String, Object>();//传值方式
		result.put("list", dayInfoList);
		return result;
	}

}
