package com.mobset.system.controller;


import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;






import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;





import com.mobset.system.service.CahgLeaderSpeechService;
import com.mobset.system.util.Page;


/**
 * @说明  领导讲话controller
 * @创建人 陈礼刚
 * @时间 2017年6月29日13:42:04
 */

@Controller
@RequestMapping("/leaderSpeech")
public class CahgLeaderSpeechController {
	
	@Resource(name="cahgLeaderSpeechService")
	private CahgLeaderSpeechService cahgLeaderSpeechService;
	
	/**
	 * @说明 领导讲话详情展示
	 */
	@RequestMapping(value="/leaderSpeechDetailsPage")
	public String leaderSpeechDetailsPage(HttpServletRequest request){
		String leader_speech_id = request.getParameter("leader_speech_id");
		HashMap map = new HashMap();//参数统一map
		if(leader_speech_id==null || "".equals(leader_speech_id)){//ID为空,进入404页面
			return "page/404";
		}
		map.put("leader_speech_id", leader_speech_id);
		HashMap newMap = cahgLeaderSpeechService.leaderSpeechDetailsShow(map);//领导讲话详情
		request.setAttribute("newMap", newMap);
		return "leaderSpeech/leader_speech_details";
	}
	
	
	/**
	 * 领导列表页
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value="/leaderSpeechListPage")
	public String leaderSpeechListPage(HttpServletRequest request) throws UnsupportedEncodingException{
		HashMap map = new HashMap();
		
		String type = request.getParameter("type");
		if(type==null || "".equals(type)){//ID为空,进入404页面
			map.put("type", null);
		}
		if("1".equals(type)){
			map.put("type", "总办领导");
			request.setAttribute("type", 1);
		}
		if("2".equals(type)){
			map.put("type", "本办领导");
			request.setAttribute("type", 2);
		}
		
		
		String title = request.getParameter("title");
		if(title!=null && !"".equals(title)){
			title = URLDecoder.decode(title,"UTF-8");//解码
			request.setAttribute("title", title);
			map.put("title", "%"+title+"%");
		}
		
		Integer count = cahgLeaderSpeechService.count(map);
		Page p =new Page();
		p.setCount(count);
		map.put("page",p.getPage());//从第几个开始
		map.put("rows",p.getPageSize());//每页大小
		request.setAttribute("pageCount", p.getPageCount()); //总页数
		request.setAttribute("count", p.getCount()); //总记录
		request.setAttribute("url", "leaderSpeech/leaderSpeechListPage.do");//左导航判断用
		return "leaderSpeech/leader_speech_list";
	}
	
	/**
	 * @throws UnsupportedEncodingException 
	 * @说明 领导分页数据
	 */
	@RequestMapping(value="/leaderSpeechList")
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
		
		String type = request.getParameter("type");
		if(type==null || "".equals(type)){//ID为空,进入404页面
			map.put("type", null);
		}
		if("1".equals(type)){
			map.put("type", "总办领导");
		}
		if("2".equals(type)){
			map.put("type", "本办领导");
		}
		
		List<HashMap> dayInfoList = cahgLeaderSpeechService.leaderSpeechList(map);//领导讲话list
		Map<String, Object> result = new HashMap<String, Object>();//传值方式
		result.put("list", dayInfoList);
		return result;
	}

	
	@RequestMapping(value="/wordPage")
	public String wordPage(HttpServletRequest request){
		System.out.println("11");
		return "leaderSpeech/word_open";
	}
}