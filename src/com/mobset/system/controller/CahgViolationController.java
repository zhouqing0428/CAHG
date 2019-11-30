package com.mobset.system.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mobset.system.service.CahgViolationService;
import com.mobset.system.util.Page;

@Controller
@RequestMapping("/cahgViolation")
public class CahgViolationController {
	
	@Resource(name="violationService")
	private CahgViolationService violationService;
	
	@RequestMapping(value="/violationInfo")
	public String violationInfo(HttpServletRequest request) {
		String id = request.getParameter("id");
		if (StringUtils.isEmpty(id)) {
			return "page/404";
		}
		
		Map<String, Object> params = new HashMap<>();
		params.put("id", new Integer(id));
		Map<String, Object> map = violationService.queryObject(params);
		request.setAttribute("info", map);
		return "violation/violation_detail";
	}

	@RequestMapping(value="/violationListPage")
	public String violationListPage(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<>();
		Integer count = violationService.queryCount(null);
		Page p = new Page();
		p.setCount(count);
		map.put("page", p.getPage());// 从第几个开始
		map.put("rows", p.getPageSize());// 每页大小
		request.setAttribute("pageCount", p.getPageCount()); // 总页数
		request.setAttribute("count", p.getCount()); // 总记录
		request.setAttribute("url", "cahgViolation/violationListPage.do");// 左导航判断用
		return "violation/violation_list";
	}
	
	/**
	 * 列表数据
	 */
	@RequestMapping(value="/violationList")
	@ResponseBody
	public Map<String, Object> violationList(HttpServletRequest request) throws UnsupportedEncodingException {
		String curPage = request.getParameter("curPage");// 当前页
		Map<String, Object> map = new HashMap<>();// 参数统一map
		Page p = new Page();
		p.setCurPage(Integer.parseInt(curPage));
		map.put("page", p.getPage());// 从第几个开始
		map.put("rows", p.getPageSize());// 每页大小

		List<Map<String, Object>> list = violationService.queryList(map);// 违法曝光list
		Map<String, Object> result = new HashMap<String, Object>();// 传值方式
		result.put("list", list);
		return result;
	}
}
