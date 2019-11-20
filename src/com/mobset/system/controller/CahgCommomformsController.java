package com.mobset.system.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mobset.system.service.SysDictionaryService;
import com.mobset.system.util.Page;


@Controller
@RequestMapping("/commomForm")
public class CahgCommomformsController {

	@Resource(name="sysDictionaryService")
	private SysDictionaryService sysDictionaryService;
	
	/**
	 * 常用表格下载列表页
	 */
	@RequestMapping(value="/commomFormsListPage")
	public String commomFormsListPage(HttpServletRequest request){
		String type = request.getParameter("type");
		if(type==null && "".equals(type)){
			return "page/404";
		}
		Date date = new Date();
		HashMap map = new HashMap();
		map.put("type", type);
		Integer count = sysDictionaryService.formCount(map);
		Page p =new Page();
		p.setCount(count);
		map.put("page",p.getPage());//从第几个开始
		map.put("rows",p.getPageSize());//每页大小
		request.setAttribute("type", type);
		request.setAttribute("pageCount", p.getPageCount()); //总页数
		request.setAttribute("count", p.getCount()); //总记录
		return "commomForms/commom_forms_list";
	}
	
	/**
	 * @说明 表格下载分页数据
	 */
	@RequestMapping(value="/commomFormsList")
	@ResponseBody
	public Map<String, Object> commomFormsList(HttpServletRequest request){
		String curPage = request.getParameter("curPage");//当前页
		String type = request.getParameter("type");
		HashMap map = new HashMap();//参数统一map
		map.put("type", type);
		Page p =new Page();
		p.setCurPage(Integer.parseInt(curPage));
		map.put("page",p.getPage());//从第几个开始
		map.put("rows",p.getPageSize());//每页大小
		List<HashMap> dayInfoList = sysDictionaryService.selectFormList(map);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("list", dayInfoList);
		return result;
	}
}
