package com.mobset.system.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mobset.system.service.CahgIntroService;
import com.mobset.system.util.Page;

@Controller
@RequestMapping("/cahgIntro")
public class CahgIntroController {

	@Resource(name="cahgIntroService")
	private CahgIntroService cahgIntroService;
	
	@RequestMapping(value="/toIntroPage")
	public String toIntroPage(HttpServletRequest request){
		HashMap introMap = new HashMap();
		introMap = cahgIntroService.selectIntro(null);
		request.setAttribute("introMap", introMap);
		return "intro/intro";
	}
	
	@RequestMapping(value="/toIntroPage2")
	public String toIntroPage2(HttpServletRequest request){
		HashMap introMap = new HashMap();
		introMap = cahgIntroService.selectIntro2(null);
		request.setAttribute("introMap", introMap);
		return "intro/intro_file";
	}
	
	@RequestMapping(value="/toIntroFilePage")
	public String toIntroFilePage(HttpServletRequest request){
		HashMap map = new HashMap();
		Integer count = cahgIntroService.count(null);
		Page p =new Page();
		p.setCount(count);
		map.put("page",p.getPage());//从第几个开始
		map.put("rows",p.getPageSize());//每页大小
		request.setAttribute("pageCount", p.getPageCount()); //总页数
		request.setAttribute("count", p.getCount()); //总记录
		request.setAttribute("url", "1");//左导航判断用
		return "intro/intro_file";
	}
	
	@RequestMapping(value="/introFileList")
	@ResponseBody
	public Map<String, Object> introFileList(HttpServletRequest request) throws UnsupportedEncodingException{
		String curPage = request.getParameter("curPage");//当前页
		HashMap map = new HashMap();//参数统一map
		Page p =new Page();
		p.setCurPage(Integer.parseInt(curPage));
		map.put("page",p.getPage());//从第几个开始
		map.put("rows",p.getPageSize());//每页大小
		List<HashMap> fileList = cahgIntroService.introFile(map);
		Map<String, Object> result = new HashMap<String, Object>();//传值方式
		result.put("list", fileList);
		
		return result;
	}
	
}
