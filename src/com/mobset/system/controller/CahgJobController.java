package com.mobset.system.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mobset.system.service.CahgJobService;
import com.mobset.system.service.deptService;
import com.mobset.system.util.Page;

/**
 * @说明  工作督办controller
 * @创建人 陈礼刚
 * @时间 2017年7月16日13:36:50
 */
@Controller
@RequestMapping("/cahgJob")
public class CahgJobController {

	@Resource(name="cahgJobService")
	private CahgJobService cahgJobService;
	
	@Resource(name="deptService")
	private deptService service;
	
	/**
	 * 工作督办详情页
	 */
	@RequestMapping(value="/jobDetailsShow")
	public String jobDetailsShow(HttpServletRequest request){
		String job_id = request.getParameter("job_id");
		if (job_id == null || "".equals(job_id)) {// ID为空,进入404页面
			return "page/404";
		}
		HashMap map = new HashMap();// 参数统一map
		map.put("job_id", job_id);
		HashMap newMap = cahgJobService.jobDetailsShow(map);
		request.setAttribute("newMap", newMap);
		
		Map<String,Object> params = new HashMap<>();
		params.put("jobId", job_id);
		List<Map<String, Object>> detailList = cahgJobService.queryJobResult(params);
		request.setAttribute("detailList", detailList);
		
		request.setAttribute("jobId", job_id);
		return "job/job_details";
	}	
	
	/**
	 * 工作督办列表页
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value="/jobListPage")
	public String jobListPage(HttpServletRequest request) throws UnsupportedEncodingException{
		HashMap map = new HashMap();
		
		String title = request.getParameter("title");
		if(title!=null && !"".equals(title)){
			title = URLDecoder.decode(title,"UTF-8");//解码
			request.setAttribute("title", title);
			map.put("title", "%"+title+"%");
		}
		
		String status = request.getParameter("status");
		if (status != null && !"".equals(status)) {
			if (Integer.parseInt(status) == 0) {
				map.put("condition", " status in (0,1) ");
			} else {
				map.put("status", status);
			}
			request.setAttribute("status", status);
		}
		
		Integer count = cahgJobService.count(map);
		Page p =new Page();
		p.setCount(count);
		map.put("page",p.getPage());//从第几个开始
		map.put("rows", p.getPageSize());//每页大小
		request.setAttribute("pageCount", p.getPageCount()); //总页数
		request.setAttribute("count", p.getCount()); //总记录
		request.setAttribute("url", "cahgJob/jobListPage.do");//左导航判断用
		return "job/job_list";
	}
	
	/**
	 * @throws UnsupportedEncodingException 
	 * @说明 工作督办分页数据
	 */
	@RequestMapping(value="/jobList")
	@ResponseBody
	public Map<String, Object> jobList(HttpServletRequest request) throws UnsupportedEncodingException{
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
		
		String status = request.getParameter("status");
		if (status != null && !"".equals(status)) {
			if (Integer.parseInt(status) == 0) {
				map.put("condition", " status in (0,1)");
			} else {
				map.put("status", status);
			}
			request.setAttribute("status", status);
		}
		
		List<HashMap> dayInfoList = cahgJobService.jobList(map);//海关新闻list
		Map<String, Object> result = new HashMap<String, Object>();//传值方式
		result.put("list", dayInfoList);
		return result;
	}
	
	/**
	 * 工作督办完成页面
	 */
	@RequestMapping(value="/toResult")
	public String toResult(HttpServletRequest request) {
		String job_id = request.getParameter("jobId");
		if (StringUtils.isEmpty(job_id)) {// ID为空,进入404页面
			return "page/404";
		}
		
		//获取经办科室
		HashMap map = new HashMap();
		map.put("condition", "dept_id != 38 ");
		List<HashMap> deptList = service.deptSelectList(map);
		request.setAttribute("deptList", deptList); // 科室列表
		
		request.setAttribute("jobId", job_id);
		
		return "job/job_result";
	}
	
	/**
	 * 工作完结
	 */
	@RequestMapping(value="/submit")
	@ResponseBody
	public Map<String, Object> submit(HttpServletRequest request) {
		Map<String, Object> params = new HashMap<>();
		params.put("jobId", request.getParameter("jobId"));
		params.put("deptId", request.getParameter("deptId"));
		params.put("userName", request.getParameter("userName"));
		params.put("content", request.getParameter("content"));

		Map<String, Object> result = new HashMap<String, Object>();
		int count = cahgJobService.saveJobResult(params);
		if (count > 0) {
			params.put("status", 1);
			count = cahgJobService.updateJobStatus(params);
			result.put("code", 0);
		} else {
			result.put("code", 1);
		}
		return result;
	}
}
