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

import com.mobset.system.service.CahgActivityNoticeService;
import com.mobset.system.util.Page;

@Controller
@RequestMapping("/cahgActivityNotice")
public class CahgActivityNoticeController {
	
	@Resource(name="activityNoticeService")
	private CahgActivityNoticeService activityNoticeService;
	
	@RequestMapping(value="/activityNoticeInfo")
	public String activityNoticeInfo(HttpServletRequest request) {
		String id = request.getParameter("id");
		if (StringUtils.isEmpty(id)) {
			return "page/404";
		}
		
		Map<String, Object> params = new HashMap<>();
		params.put("id", new Integer(id));
		Map<String, Object> map = activityNoticeService.queryObject(params);
		request.setAttribute("info", map);
		return "activityNotice/activity_notice_detail";
	}

	@RequestMapping(value="/activityNoticeListPage")
	public String activityNoticeListPage(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<>();
		Integer count = activityNoticeService.queryCount(null);
		Page p = new Page();
		p.setCount(count);
		map.put("page", p.getPage());// 从第几个开始
		map.put("rows", p.getPageSize());// 每页大小
		request.setAttribute("pageCount", p.getPageCount()); // 总页数
		request.setAttribute("count", p.getCount()); // 总记录
		request.setAttribute("url", "cahgActivityNotice/activityNoticeListPage.do");// 左导航判断用
		return "activityNotice/activity_notice_list";
	}
	
	/**
	 * 列表数据
	 */
	@RequestMapping(value="/activityNoticeList")
	@ResponseBody
	public Map<String, Object> activityNoticeList(HttpServletRequest request) throws UnsupportedEncodingException {
		String curPage = request.getParameter("curPage");// 当前页
		Map<String, Object> map = new HashMap<>();// 参数统一map
		Page p = new Page();
		p.setCurPage(Integer.parseInt(curPage));
		map.put("page", p.getPage());// 从第几个开始
		map.put("rows", p.getPageSize());// 每页大小

		List<Map<String, Object>> list = activityNoticeService.queryList(map);// 图片新闻list
		Map<String, Object> result = new HashMap<String, Object>();// 传值方式
		result.put("list", list);
		return result;
	}
}
