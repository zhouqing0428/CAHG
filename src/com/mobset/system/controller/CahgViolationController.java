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

import com.mobset.system.service.CahgOfficePostService;
import com.mobset.system.service.CahgViolationService;
import com.mobset.system.util.Page;

@Controller
@RequestMapping("/cahgViolation")
public class CahgViolationController {
	
	@Resource(name="violationService")
	private CahgViolationService violationService;
	
	@Resource(name="cahgOfficePostService")
	private CahgOfficePostService cahgOfficePostService;
	
	@RequestMapping(value="/violationInfo")
	public String violationInfo(HttpServletRequest request) {
		String id = request.getParameter("id");
		if (StringUtils.isEmpty(id)) {
			return "page/404";
		}
		
		HashMap ipMap = new HashMap();
		ipMap = cahgOfficePostService.selectIP();
		if (ipMap != null) {
			String status = ipMap.get("status").toString();
			String ip_start = "";
			String ip_end = "";
			String ipSection = "0-0";
			if ("1".equals(status)) {// 开启状态
				String ip = getIpAddr(request);// 获取访问IP
				if (ipMap.get("ip_start") != null) {
					ip_start = ipMap.get("ip_start").toString();
				}
				if (ipMap.get("ip_end") != null) {
					ip_end = ipMap.get("ip_end").toString();
				}
				if (ipMap.get("ip_start") != null && ipMap.get("ip_end") != null) {
					ipSection = ip_start + "-" + ip_end;
					boolean exists = ipExistsInRange(ip, ipSection);// 判断访问IP是否在设置号段内
					if (exists == false) {
						request.setAttribute("ip", "0");
						return "violation/violation_detail";
					} else {
						request.setAttribute("ip", "1");
					}
				}

			}
		}
		
		
		Map<String, Object> params = new HashMap<>();
		params.put("id", new Integer(id));
		Map<String, Object> map = violationService.queryObject(params);
		request.setAttribute("info", map);
		return "violation/violation_detail";
	}

	@RequestMapping(value="/violationListPage")
	public String violationListPage(HttpServletRequest request) {
		HashMap ipMap = new HashMap();
		ipMap = cahgOfficePostService.selectIP();
		if (ipMap != null) {
			String status = ipMap.get("status").toString();
			String ip_start = "";
			String ip_end = "";
			String ipSection = "0-0";
			if ("1".equals(status)) {// 开启状态
				String ip = getIpAddr(request);// 获取访问IP
				if (ipMap.get("ip_start") != null) {
					ip_start = ipMap.get("ip_start").toString();
				}
				if (ipMap.get("ip_end") != null) {
					ip_end = ipMap.get("ip_end").toString();
				}
				if (ipMap.get("ip_start") != null && ipMap.get("ip_end") != null) {
					ipSection = ip_start + "-" + ip_end;
					boolean exists = ipExistsInRange(ip, ipSection);// 判断访问IP是否在设置号段内
					if (exists == false) {
						request.setAttribute("ip", "0");
						return "violation/violation_list";
					} else {
						request.setAttribute("ip", "1");
					}
				}

			}
		}
		
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
	
	/**
	 * 获取访问者IP
	 * @param request
	 * @return
	 */
	public String getIpAddr(HttpServletRequest request) {  
	    String ip = request.getHeader("x-forwarded-for");  
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	        ip = request.getHeader("Proxy-Client-IP");  
	    }  
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	        ip = request.getHeader("WL-Proxy-Client-IP");  
	    }  
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	        ip = request.getRemoteAddr();  
	    }  
	    return ip;  
	}  
	
	/**
	 * IP限制
	 */
	public static boolean ipExistsInRange(String ip, String ipSection) {
		//特殊处理本地0:0:0:0:0:1报错问题
		if (ip.indexOf(":") > 0) {
			return false;
		}

		ipSection = ipSection.trim();
		ip = ip.trim();
		int idx = ipSection.indexOf('-');
		String beginIP = ipSection.substring(0, idx);
		String endIP = ipSection.substring(idx + 1);
		
		return getIp2long(beginIP) <= getIp2long(ip) && getIp2long(ip) <= getIp2long(endIP);

	}
	
	public static long getIp2long(String ip) {
		ip = ip.trim();
		String[] ips = ip.split("\\.");
		long ip2long = 0L;
		for (int i = 0; i < 4; ++i) {
			ip2long = ip2long << 8 | Integer.parseInt(ips[i]);
		}
		return ip2long;
	}
}
