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

import com.mobset.system.service.CahgImptWordService;
import com.mobset.system.util.Page;

/**
 * @说明  重点工作controller
 * @创建人 陈礼刚
 * @时间 2017年7月20日10:18:06
 */

@Controller
@RequestMapping("/cahgImptWork")
public class CahgImptWorkController {
	
	@Resource(name="cahgImptWorkService")
	private CahgImptWordService cahgImptWorkService;
	
	/**
	 * 重点工作详情页
	 */
	@RequestMapping(value="/imptWorkDetailsPage")
	public String officePostDetailsPage(HttpServletRequest request){
		String impt_work_id = request.getParameter("impt_work_id");
		HashMap map = new HashMap();//参数统一map
		if(impt_work_id==null || "".equals(impt_work_id)){//ID为空,进入404页面
			return "page/404";
		}
		map.put("impt_work_id", impt_work_id);
		HashMap newMap = cahgImptWorkService.imptWorkDetailsShow(map);
		request.setAttribute("newMap", newMap);
		return "imptWork/impt_work_details";
	}
	
	/**
	 * 重点工作列表页
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value="/imptWorkListPage")
	public String officePostListPage(HttpServletRequest request) throws UnsupportedEncodingException{
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss"); 
		HashMap map = new HashMap();
		
		String title = request.getParameter("title");
		if(title!=null && !"".equals(title)){
			title = URLDecoder.decode(title,"UTF-8");//解码
			request.setAttribute("title", title);
			map.put("title", "%"+title+"%");
		}
		
		Integer count = cahgImptWorkService.count(map);
		Page p =new Page();
		p.setCount(count);
		map.put("page",p.getPage());//从第几个开始
		map.put("rows",p.getPageSize());//每页大小
		request.setAttribute("pageCount", p.getPageCount()); //总页数
		request.setAttribute("count", p.getCount()); //总记录
		request.setAttribute("url", "cahgImptWork/imptWorkListPage.do");//左导航判断用
		return "imptWork/impt_work_list";
	}
	
	/**
	 * @throws UnsupportedEncodingException 
	 * @说明 重点工作分页数据
	 */
	@RequestMapping(value="/imptWorkList")
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
			request.setAttribute("title", title);
			map.put("title", "%"+title+"%");
		}
		
		List<HashMap> dayInfoList = cahgImptWorkService.imptWorkList(map);
		Map<String, Object> result = new HashMap<String, Object>();//传值方式
		result.put("list", dayInfoList);
		return result;
	}
}
