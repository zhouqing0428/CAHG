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

import com.mobset.system.service.CahgWorkTableService;
import com.mobset.system.util.Page;


@Controller
@RequestMapping("/cahgWorkTable")
public class CahgWorkTableController {

	@Resource(name="cahgWorkTableService")
	private CahgWorkTableService cahgWorkTableService;
	
	/**
	 * 每日信息列表页
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value="/workTableListPage")
	public String dayInfoListPage(HttpServletRequest request) throws UnsupportedEncodingException{
		HashMap map = new HashMap();
		String work_table_category_id = request.getParameter("work_table_category_id");
		String title = request.getParameter("title");
		if(work_table_category_id==null || "".equals(work_table_category_id)){//ID为空,进入404页面
			return "page/404";
		}
		
		map.put("work_table_category_id", work_table_category_id);
		
		Integer count = cahgWorkTableService.count(map);
		Page p =new Page();
		p.setCount(count);
		map.put("page",p.getPage());//从第几个开始
		map.put("rows",p.getPageSize());//每页大小
		request.setAttribute("work_table_category_id", work_table_category_id);
		request.setAttribute("pageCount", p.getPageCount()); //总页数
		request.setAttribute("count", p.getCount()); //总记录
		request.setAttribute("url", "cahgDayInfo/dayInfoListPage.do");//左导航判断用
		
		HashMap paramMap = new HashMap();
		paramMap.put("categoryId", work_table_category_id);
		List<HashMap> tableCategoryList = cahgWorkTableService.selectTableCategory(paramMap);
		if (tableCategoryList != null && tableCategoryList.size() > 0) {
			request.setAttribute("title", tableCategoryList.get(0).get("name"));
		}
		
		return "workTable/work_table_list";
	}
	
	/**
	 * @throws UnsupportedEncodingException 
	 * @说明 每日信息分页数据
	 */
	@RequestMapping(value="/workTableList")
	@ResponseBody
	public Map<String, Object> dayInfoList(HttpServletRequest request) throws UnsupportedEncodingException{
		String curPage = request.getParameter("curPage");//当前页
		String work_table_category_id = request.getParameter("work_table_category_id");
		HashMap map = new HashMap();//参数统一map
		Page p =new Page();
		p.setCurPage(Integer.parseInt(curPage));
		map.put("page",p.getPage());//从第几个开始
		map.put("rows",p.getPageSize());//每页大小
		
		if(work_table_category_id!=null && !"".equals(work_table_category_id)){
			map.put("work_table_category_id", work_table_category_id);
		}
		List<HashMap> dayInfoList = cahgWorkTableService.workTableList(map);
		Map<String, Object> result = new HashMap<String, Object>();//传值方式
		result.put("list", dayInfoList);
		
		return result;
	}
	
}
