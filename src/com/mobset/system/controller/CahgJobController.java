package com.mobset.system.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

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
		
		if (newMap.get("dept_id") != null) {
			String deptId = newMap.get("dept_id").toString();
			String[] deptIds = deptId.split(";");
			List<String> idList = new ArrayList<String>();
			for (String id : deptIds) {
				idList.add(id);
			}
			// 根据科室编码批量取出科室信息
			StringBuilder deptName = new StringBuilder();
			List<Map<String, Object>> deptList = service.queryListByIds(idList);
			for (Map<String, Object> deptMap : deptList) {
				deptName.append(deptMap.get("name").toString()).append("、");
			}
			if (deptName.length() > 0) {
				newMap.put("deptName", deptName.substring(0, deptName.length() - 1));
			}
		}

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
		
		List<HashMap> jobList = cahgJobService.jobList(map);
		
		// 封装经办科室名称
		Map<String,String> deptNameMap = mapDeptName(jobList);
		StringBuilder deptName = new StringBuilder();
		String[] deptIds = null;
		Set<String> deptIdSet = new HashSet<>();
		for (HashMap jobMap : jobList) {
			if (jobMap.get("dept_id") == null || StringUtils.isEmpty(jobMap.get("dept_id").toString())) {
				continue;
			}
			deptIds = jobMap.get("dept_id").toString().split(";");
			deptName.setLength(0);
			for (String deptId : deptIds) {
				if (deptNameMap != null && deptNameMap.containsKey(deptId)) {
					deptName.append(deptNameMap.get(deptId)).append("、");
				}
			}
			if (deptName.length() > 0) {
				jobMap.put("deptName", deptName.substring(0, deptName.length() - 1));
			}
		}
		
		Map<String, Object> result = new HashMap<String, Object>();//传值方式
		result.put("list", jobList);
		return result;
	}
	
	/**
	 * 批量取出科室并缓存
	 * @param cahgJobList
	 * @return
	 */
	private Map<String, String> mapDeptName(List<HashMap> jobList) {
		// 封装经办科室ID集合
		String[] deptIds = null;
		Set<String> deptIdSet = new HashSet<>();
		for (HashMap jobMap : jobList) {
			if (jobMap.get("dept_id") == null || StringUtils.isEmpty(jobMap.get("dept_id").toString())) {
				continue;
			}
			deptIds = jobMap.get("dept_id").toString().split(";");
			for (String deptId : deptIds) {
				deptIdSet.add(deptId);
			}
		}
		if (deptIdSet.size() > 0) {
			List<String> idList = new ArrayList<String>();
			for (String id : deptIdSet) {
				idList.add(id);
			}
			// 根据科室编码批量取出科室信息
			List<Map<String, Object>> deptList = service.queryListByIds(idList);
			
			//根据科室ID缓存科室信息
			Map<String, String> deptMap = new HashMap<>();
			for (Map<String, Object> map : deptList) {
				deptMap.put(map.get("dept_id").toString(), map.get("name").toString());
			}

			return deptMap;
		}

		return null;
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
//		map.put("condition", "dept_id != 38 ");
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
