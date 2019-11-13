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

import com.mobset.system.service.CahgLetterService;
import com.mobset.system.util.Page;

@Controller
@RequestMapping("/cahgLetter")
public class CahgLetterController {

	@Resource(name="cahgLetterService")
	private CahgLetterService cahgLetterService;
	

	@RequestMapping(value="/letterShow")
	public String jobDetailsShow(HttpServletRequest request){
		
		List<HashMap> list = cahgLetterService.letterInfo(null);
		request.setAttribute("letterList", list);
		
		HashMap map = new HashMap();
		Integer count = cahgLetterService.count(null);
		Page p =new Page();
		p.setCount(count);
		map.put("page",p.getPage());//从第几个开始
		map.put("rows",p.getPageSize());//每页大小
		
		HashMap attentive = cahgLetterService.selectAttentive(null);
		request.setAttribute("attentive", attentive);
		request.setAttribute("pageCount", p.getPageCount()); //总页数
		request.setAttribute("count", p.getCount()); //总记录
		return "letter/letter_list";
	}
	
	
	@RequestMapping(value="/letterList")
	@ResponseBody
	public Map<String, Object> letterList(HttpServletRequest request) throws UnsupportedEncodingException{
		String curPage = request.getParameter("curPage");//当前页
		HashMap map = new HashMap();//参数统一map
		Page p =new Page();
		p.setCurPage(Integer.parseInt(curPage));
		map.put("page",p.getPage());//从第几个开始
		map.put("rows",p.getPageSize());//每页大小
		
	
		List<HashMap> letterList = cahgLetterService.letterList(map);
		Map<String, Object> result = new HashMap<String, Object>();//传值方式
		result.put("list", letterList);
		return result;
	}
	
	
	@RequestMapping(value="/reply")
	public String reply(HttpServletRequest request){
		String letter_id = request.getParameter("letter_id");
		HashMap map = new HashMap();//参数统一map
		if(letter_id==null || "".equals(letter_id)){//ID为空,进入404页面
			return "page/404";
		}
		map.put("letter_id", letter_id);
		HashMap letterMap = cahgLetterService.selectLetterConter(map);
		List<HashMap> newMap = cahgLetterService.reply(map);
		request.setAttribute("newMap", newMap);
		request.setAttribute("letterMap", letterMap);
		return "letter/letter_details";
	}
	
	@RequestMapping(value="/updatePage")
	public String updatePage(HttpServletRequest request){
		String to_user_id = request.getParameter("to_user_id");
		HashMap map = new HashMap();//参数统一map
		if(to_user_id==null || "".equals(to_user_id)){//ID为空,进入404页面
			return "page/404";
		}
		map.put("user_id", to_user_id);
		HashMap remark = cahgLetterService.selectUserNameRemark(map);
		request.setAttribute("to_user_id", to_user_id);
		request.setAttribute("remark", remark);
		return "letter/letter_update";
	}
	
	@RequestMapping(value="/addLetter")
	@ResponseBody
	public String addLetter(HttpServletRequest request){
		String author = request.getParameter("author");//作者
		String duty_name = request.getParameter("duty_name");//职务
		String dept_name = request.getParameter("dept_name");//科室
		String title = request.getParameter("title");//标题
		String content = request.getParameter("content");//内容
		String to_user_id = request.getParameter("to_user_id");
		HashMap map = new HashMap();
		map.put("author", author);
		map.put("duty_name", duty_name);
		map.put("dept_name", dept_name);
		map.put("title", title);
		map.put("content", content);
		Date date = new Date();
		SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String d = sdf.format(date);
		map.put("create_date", d);
		map.put("to_user_id", to_user_id);
		cahgLetterService.addLetter(map);
		return "1";
	}
}
