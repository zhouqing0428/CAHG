package com.mobset.system.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mobset.system.service.deptService;
import com.mobset.system.util.Page;

@Controller
@RequestMapping("/dept")
public class deptController {
	
	@Resource(name="deptService")
	private deptService service;
	
	/**
	 * 科室左导航
	 */
/*	@RequestMapping(value="/dept_left")
	public String dept_left(HttpServletRequest request){
		List<HashMap> deptList = service.deptSelectList(null);
		request.setAttribute("deptList", deptList); //科室列表
		return "page/dept_left";
	}*/

	
	@RequestMapping(value="/dept_left")
	public String dept_left(HttpServletRequest request){
		HashMap paramMap = new HashMap();
		paramMap.put("condition", " status = 0 ");
		List<HashMap> deptList = service.deptSelectList(paramMap);
		request.setAttribute("deptList", deptList); //科室列表
		int count = 0;
		if (deptList != null && deptList.size() > 0) {
			if (deptList.size() % 3 == 0) {
				count = deptList.size() / 3;
			} else {
				count = deptList.size() / 3 + 1;
			}
			request.setAttribute("count", count);
		}
		
		List<HashMap> officeList = service.officeWorkCategory(null);
		int officeCount = 0;
		if (officeList != null && officeList.size() > 0) {
			if (officeList.size() % 4 == 0) {
				officeCount = officeList.size() / 4;
			} else {
				officeCount = officeList.size() / 4 + 1;
			}
			request.setAttribute("officeCount", officeCount);
		}
		request.setAttribute("officeList", officeList);
		
		return "dept/dept_list_deils";
	}
	
	@RequestMapping(value="/deptDetails")
	public String deptDetails(HttpServletRequest request){
		String dept_id = request.getParameter("dept_id");
		HashMap<String, String> map = new HashMap();//参数统一map
		if(dept_id==null || "".equals(dept_id)){//ID为空,进入404页面
			dept_id = "";
		}
		map.put("dept_id", dept_id);
		HashMap newMap = service.deptDetails(map);//其他的内容
		request.setAttribute("newMap", newMap); 
		request.setAttribute("dept_id", dept_id);//左导航判断用
		
		return "dept/dept_list";
	}
	
	@RequestMapping(value="/filePage")
	@ResponseBody
	public  Map<String, Object> filePage(HttpServletRequest request){
		String dept_id = request.getParameter("dept_id");
		String type = request.getParameter("type");
		HashMap<String, String> map = new HashMap();//参数统一map
		if(dept_id==null || "".equals(dept_id)){//ID为空,进入404页面
			dept_id = "";
		}
		map.put("dept_id", dept_id);
		Integer count = 0;
		if(type!=null || !"".equals(type)){
			if(type.equals("dept")){
				 count = service.selectDeptRegimeCount(map);
			}else if(type.equals("work")){
				 count = service.selectWorkStandardCount(map);
			}
		}
		//附件列表
		Page p =new Page();
		p.setCount(count);
		Map<String, Object> result = new HashMap<String, Object>();//传值方式
		result.put("pageCount", p.getPageCount());
		result.put("count",p.getCount());
		return result;
	}
	
	@RequestMapping(value="/deptFileList")
	@ResponseBody
	public Map<String, Object> deptFileList(HttpServletRequest request) throws UnsupportedEncodingException{
		String curPage = request.getParameter("curPage");//当前页
		String dept_id = request.getParameter("dept_id");
		String type = request.getParameter("type");
		HashMap map = new HashMap();//参数统一map
		if(dept_id==null || "".equals(dept_id)){//ID为空,进入404页面
			dept_id = "";
		}
		map.put("dept_id", dept_id);
		Page p =new Page();
		p.setCurPage(Integer.parseInt(curPage));
		map.put("page",p.getPage());//从第几个开始
		map.put("rows",p.getPageSize());//每页大小
		List<HashMap> list = new ArrayList<HashMap>();;
		if(type!=null || !"".equals(type)){
			if(type.equals("dept")){
				list = service.selectDeptRegime(map);
			}else if(type.equals("work")){
				list = service.selectWorkStandard(map);
			}
		}
		Map<String, Object> result = new HashMap<String, Object>();//传值方式
		result.put("list", list);
		return result;
	}
	
	
	@RequestMapping(value="/officeWorkFileListPage")
	public String officeWorkFileListPage(HttpServletRequest request) throws UnsupportedEncodingException{
		String office_work_category_id = request.getParameter("office_work_category_id");
		HashMap map = new HashMap();
		if(office_work_category_id==null || "".equals(office_work_category_id)){//ID为空,进入404页面
			return "page/404";
		}
		map.put("office_work_category_id", office_work_category_id);
		Integer count = service.count(map);
		Page p =new Page();
		p.setCount(count);
		map.put("page",p.getPage());//从第几个开始
		map.put("rows", p.getPageSize());//每页大小
		request.setAttribute("pageCount", p.getPageCount()); //总页数
		request.setAttribute("count", p.getCount()); //总记录
		request.setAttribute("url", office_work_category_id);//左导航判断用
		request.setAttribute("office_work_category_id", office_work_category_id);
		return "dept/office_work_list";
	}
	
	
	@RequestMapping(value="/officeWorkFileList")
	@ResponseBody
	public Map<String, Object> officeWorkFileList(HttpServletRequest request) throws UnsupportedEncodingException{
		String curPage = request.getParameter("curPage");//当前页
		HashMap map = new HashMap();//参数统一map
		Page p =new Page();
		p.setCurPage(Integer.parseInt(curPage));
		map.put("page",p.getPage());//从第几个开始
		map.put("rows",p.getPageSize());//每页大小
		String office_work_category_id = request.getParameter("office_work_category_id");
		if(office_work_category_id==null || "".equals(office_work_category_id)){//ID为空,进入404页面
			office_work_category_id= "-1";//赋值0ID进去表示没有
		}
		map.put("office_work_category_id", office_work_category_id);
		List<HashMap> dayInfoList = service.officeWorkFile(map);
		Map<String, Object> result = new HashMap<String, Object>();//传值方式
		result.put("list", dayInfoList);
		return result;
	}
}
