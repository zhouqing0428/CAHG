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

import com.mobset.system.service.CahgOfficePostService;
import com.mobset.system.util.Page;

/**
 * @说明  本办发文controller
 * @创建人 陈礼刚
 * @时间 2017年7月17日9:29:06
 */
@Controller
@RequestMapping("/cahgOfficePost")
public class CahgOfficePostController {

	@Resource(name="cahgOfficePostService")
	private CahgOfficePostService cahgOfficePostService;
	
	/**
	 * 本办发文详情页
	 */
	@RequestMapping(value="/officePostDetailsPage")
	public String officePostDetailsPage(HttpServletRequest request){
		
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
					} else {
						request.setAttribute("ip", "1");
					}
				}

			}
		}
		String office_post_id = request.getParameter("office_post_id");
		HashMap map = new HashMap();//参数统一map
		if(office_post_id==null || "".equals(office_post_id)){//ID为空,进入404页面
			return "page/404";
		}
		map.put("office_post_id", office_post_id);
		HashMap newMap = cahgOfficePostService.officePostDetailsShow(map);
		request.setAttribute("newMap", newMap);
		return "officePost/office_post_details";
	
	}
	
	/**
	 * 本办发文列表页
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value="/officePostListPage")
	public String officePostListPage(HttpServletRequest request) throws UnsupportedEncodingException{
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss"); 
		HashMap map = new HashMap();
		
		String title = request.getParameter("title");
		if(title!=null && !"".equals(title)){
			title = URLDecoder.decode(title,"UTF-8");//解码
			request.setAttribute("title", title);
			map.put("title", "%"+title+"%");
		}
		
		Integer count = cahgOfficePostService.count(map);
		Page p =new Page();
		p.setCount(count);
		map.put("page",p.getPage());//从第几个开始
		map.put("rows",p.getPageSize());//每页大小
		request.setAttribute("pageCount", p.getPageCount()); //总页数
		request.setAttribute("count", p.getCount()); //总记录
		request.setAttribute("url", "cahgOfficePost/officePostListPage.do");//左导航判断用
		return "officePost/office_post_list";
	}
	
	/**
	 * @throws UnsupportedEncodingException 
	 * @说明 每日信息分页数据
	 */
	@RequestMapping(value="/officePostList")
	@ResponseBody
	public Map<String, Object> dayInfoList(HttpServletRequest request) throws UnsupportedEncodingException{
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
		
		List<HashMap> dayInfoList = cahgOfficePostService.officePostList(map);
		Map<String, Object> result = new HashMap<String, Object>();//传值方式
		result.put("list", dayInfoList);
		return result;
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
	
	/*public static long getIp2long2(String ip) {
		ip = ip.trim();
		String[] ips = ip.split("\\.");
		long ip1 = Integer.parseInt(ips[0]);
		long ip2 = Integer.parseInt(ips[1]);
		long ip3 = Integer.parseInt(ips[2]);
		long ip4 = Integer.parseInt(ips[3]);
		long ip2long =1L* ip1 * 256 * 256 * 256 + ip2 * 256 * 256 + ip3 * 256 + ip4;
		return ip2long;
		}*/

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
}
