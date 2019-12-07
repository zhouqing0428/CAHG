package com.mobset.system.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mobset.system.service.CahgActivityNoticeService;
import com.mobset.system.service.CahgAfficheService;
import com.mobset.system.service.CahgCustomNewsService;
import com.mobset.system.service.CahgDayInfoService;
import com.mobset.system.service.CahgFloatNewsService;
import com.mobset.system.service.CahgStyleService;
import com.mobset.system.service.CahgHyperlinkService;
import com.mobset.system.service.CahgImgNewsService;
import com.mobset.system.service.CahgImptWordService;
import com.mobset.system.service.CahgJobService;
import com.mobset.system.service.CahgLeaderSpeechService;
import com.mobset.system.service.CahgMeetingNoticeService;
import com.mobset.system.service.CahgOfficePostService;
import com.mobset.system.service.CahgSpecialTopicService;
import com.mobset.system.service.CahgSurveyService;
import com.mobset.system.service.CahgViolationService;
import com.mobset.system.service.CahgWorkTableService;
import com.mobset.system.service.SysDictionaryService;
import com.mobset.system.service.deptService;
import com.mobset.system.util.Page;

/**
 * @说明  首页controller
 * @创建人 陈礼刚
 * @时间 2017年6月26日14:55:11
 */

@Controller
@RequestMapping("/index")
public class IndexController {
	
	@Resource(name="cahgImgNewsService")
	private CahgImgNewsService cahgImgNewsService;
	
	@Resource(name="cahgFloatNewsService")
	private CahgFloatNewsService cahgFloatNewsService;
	@Resource(name="cahgStyleService")
	private CahgStyleService cahgStyleService;
	
	@Resource(name="cahgDayInfoService")
	private CahgDayInfoService cahgDayInfoService;
	@Resource(name="sysDictionaryService")
	private SysDictionaryService sysDictionaryService;
	@Resource(name="cahgLeaderSpeechService")
	private CahgLeaderSpeechService cahgLeaderSpeechService;
	@Resource(name="cahgCustomNewsService")
	private CahgCustomNewsService cahgCustomNewsService;
	@Resource(name="cahgMeetingNoticeSerivce")
	private CahgMeetingNoticeService cahgMeetingNoticeService;
	@Resource(name="cahgAfficheService")
	private CahgAfficheService cahgAfficheService;
	@Resource(name="cahgJobService")
	private CahgJobService cahgJobService;
	@Resource(name="cahgOfficePostService")
	private CahgOfficePostService cahgOfficePostService;
	@Resource(name="cahgImptWorkService")
	private CahgImptWordService cahgImptWorkService;
	@Resource(name="cahgSpecialTopicService")
	private CahgSpecialTopicService cahgSpecialTopicService;
	@Resource(name="cahgHyperlinkService")
	private CahgHyperlinkService cahgHyperlinkService;
	@Resource(name="cahgSurveyService")
	private CahgSurveyService cahgSurveyService;
	@Resource(name="cahgWorkTableService")
	private CahgWorkTableService cahgWorkTableService;
	@Resource(name="deptService")
	private deptService deptservice;
	@Resource(name="activityNoticeService")
	private CahgActivityNoticeService activityNoticeService;
	@Resource(name="violationService")
	private CahgViolationService violationService;

	
	/*	@ResponseBody*/
	
	/*
	 * 头部
	 */
	@RequestMapping(value="/head")
	public String head(HttpServletRequest request){
		List<HashMap> newTypeList = sysDictionaryService.newTypeList(null);//新闻类型列表
		request.setAttribute("newTypeList", newTypeList); //新闻类型列表
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); 
		request.setAttribute("sysDate", formatter.format(date));//系统当前时间
		
		//取交通路线附件
		HashMap trafficMap = new HashMap();//参数统一map
		HashMap traffic = new HashMap();
		trafficMap.put("type", 5);
		List<HashMap> trafficList = sysDictionaryService.selectFormList(trafficMap);
		if(trafficList.size() > 0){
			traffic = trafficList.get(0);
		}
		
		request.setAttribute("traffic", traffic);//交通路线附件
		return "page/dh";
	}
	
	/**
	 * 进入首页
	 */
	@RequestMapping(value="/page")
	public String index(HttpServletRequest request,HttpSession session){
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss"); 
		
		HashMap map = new HashMap();//参数统一map
		List<HashMap> imgNewsList = cahgImgNewsService.indexImgNewsList(map);//图片新闻列表
		List<HashMap> floatNewsList = cahgFloatNewsService.indexFloatNewsList(map);//弹窗新闻列表
		List<HashMap> styleList = cahgStyleService.indexStyleList(map);//弹窗新闻列表
		List<HashMap> dayInfoList = cahgDayInfoService.indexDayInfoList(map);//每日信息列表
		List<HashMap> leaderSpeechList = cahgLeaderSpeechService.indexLeaderSpeechList(map);//领导讲话列表
		List<HashMap> indexLeaderBSpeechList = cahgLeaderSpeechService.indexLeaderBSpeechList(map);//领导讲话列表
		List<HashMap> customNewsList = cahgCustomNewsService.indexCustomNewsList(map);//海关新闻列表
		List<HashMap> meetingNoticeList = cahgMeetingNoticeService.indexMeetingNoticeList(map);//会议通知列表
		List<HashMap> afficheList = cahgAfficheService.indexAfficheList(map);//公示公告列表
		List<HashMap> indexJobList = cahgJobService.indexJobList(map);//工作督办
		List<HashMap> officePostList = cahgOfficePostService.indexOfficePostList(map);//本办发文
		List<HashMap> imptWorkList = cahgImptWorkService.indexImptWorkList(map);//重点工作
		List<HashMap> cahgSpecialTopicList = cahgSpecialTopicService.indexSpecialTopicCategoryList(map);//专题专栏类别
//		List<HashMap> tableCategoryList = cahgWorkTableService.selectTableCategory(map);//类别
		List<HashMap> workTableList = cahgWorkTableService.selectWorkTable(map);
		List<HashMap> workTableType = cahgWorkTableService.selectType(map);
		List<Map<String, Object>> noticeList = activityNoticeService.queryIndexList(null); //活动通知
		List<Map<String, Object>> violationList = violationService.queryIndexList(null); //违纪曝光
		
		HashMap wish = sysDictionaryService.wishSelect(map);//祝福语
		request.setAttribute("wish", wish);
	
		List<HashMap> qtlinkList = cahgHyperlinkService.qtLink(map);
		request.setAttribute("qtlinkList", qtlinkList);//其他超链接数据
		
		HashMap survey = cahgSurveyService.selectSurver(map);//投票
		request.setAttribute("survey", survey);
		if(survey!=null && !"".equals(survey)){
			List<HashMap> answerList = cahgSurveyService.selectSurverAnswer(survey.get("survey_question_id").toString());
			request.setAttribute("answerList", answerList);
		}
	
		HashMap picture  = sysDictionaryService.selectpicture();
		if(picture!=null){
			if(null!=picture.get("img_state")){
				if(picture.get("img_state").toString().equals("1")){
					request.setAttribute("pictureImg", picture.get("img_name_temp"));
					request.setAttribute("pictureState", picture.get("img_state"));
				}else{
					request.setAttribute("picture", "0");
				}
			}else{
				request.setAttribute("picture", "0");
			}
		}else{
			request.setAttribute("picture", "0");
		}
		
		HashMap floatNews = new HashMap();
		
		if(floatNewsList.size() > 0){
			floatNews = floatNewsList.get(0);
		}
		
		request.setAttribute("sysDate", formatter.format(date));//系统当前时间
		request.setAttribute("imgNewsList", imgNewsList);//图片新闻
		request.setAttribute("floatNews", floatNews);//弹窗新闻
		request.setAttribute("styleList", styleList);//长安风采
		request.setAttribute("dayInfoList", dayInfoList);//每日信息
		request.setAttribute("leaderSpeechList", leaderSpeechList);//领导讲话
		request.setAttribute("indexLeaderBSpeechList", indexLeaderBSpeechList);//领导讲话
		request.setAttribute("customNewsList", customNewsList);//海关新闻
		request.setAttribute("meetingNoticeList", meetingNoticeList);//会议通知
		request.setAttribute("afficheList", afficheList);//公示公告
		request.setAttribute("indexJobList", indexJobList);//工作督办
		request.setAttribute("officePostList", officePostList);//本办发文
		request.setAttribute("imptWorkList", imptWorkList);//重点工作
		request.setAttribute("cahgSpecialTopicList", cahgSpecialTopicList);//专题专栏
//		request.setAttribute("tableCategoryList", tableCategoryList);
		request.setAttribute("workTableList", workTableList);
		request.setAttribute("workTableType", workTableType);
		request.setAttribute("noticeList", noticeList);
		request.setAttribute("violationList", violationList);
		
		return "../../index";
	}
	
	/**
	 * 新闻左导航
	 */
	@RequestMapping(value="/new_left")
	public String new_left(HttpServletRequest request){
		String url = request.getParameter("url");
		List<HashMap> newTypeList = sysDictionaryService.newTypeList(null);//新闻类型列表
		request.setAttribute("newTypeList", newTypeList); //新闻类型列表
		request.setAttribute("url", url);//左导航判断用
		return "page/new_left";
	}
	
	/**
	 * 通讯录左导航(科室列表)
	 */
	@RequestMapping(value="/look_left")
	public String look_left(HttpServletRequest request){
		String dept_id = request.getParameter("dept_id");
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("condition", " dept_id != '38' ");
		List<Map<String, Object>> deptList = sysDictionaryService.deptList(paramMap);// 科室列表
		
		request.setAttribute("deptList", deptList); //科室列表
		request.setAttribute("dept_id", dept_id);//左导航判断用
		return "page/look_left";
	}
	
	/**
	 * 专题专栏左导航
	 */
	@RequestMapping(value="/special_left")
	public String special_left(HttpServletRequest request){
		String special_topic_category_id = request.getParameter("url");
		List<HashMap> specialLeftList = cahgSpecialTopicService.specialLeftList(null);
		request.setAttribute("specialLeftList", specialLeftList); //科室列表
		request.setAttribute("special_topic_category_id", special_topic_category_id);//左导航判断用
		return "page/special_left";
	}
	
	/**
	 * 首页查询
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value="/indexSelect")
	public String indexSelect(HttpServletRequest request) throws UnsupportedEncodingException{
		String type = request.getParameter("type");
		String title = request.getParameter("title");
		if(title!=null && !"".equals(title)){//非空转码
			title = URLEncoder.encode(title,"UTF-8");
		}
		
		if(type!=null && !"".equals(type)){
			if(type.equals("cahg_day_info")){//每日信息
				return "redirect:/cahgDayInfo/dayInfoListPage.do?title="+title;
			}
			else if(type.equals("cahg_img_news")){//图片新闻
				return "redirect:/cahgImgNews/imgNewsListPage.do?title="+title;
			}
			else if(type.equals("cahg_affiche")){//公示公告
				return "redirect:/cahgAffiche/afficheListPage.do?title="+title;
			}
			else if(type.equals("cahg_meeting_notice")){//会议通知
				return "redirect:/cahgMeetingNotice/meetingNoticeListPage.do?title="+title;
			}
			else if(type.equals("cahg_leader_speech")){//领导讲话
				return "redirect:/leaderSpeech/leaderSpeechListPage.do?title="+title;
			}
			else if(type.equals("cahg_job")){//工作督办
				return "redirect:/cahgJob/jobListPage.do?title="+title;
			}
			else if(type.equals("cahg_office_post")){//本办发文
				return "redirect:/cahgOfficePost/officePostListPage.do?title="+title;
			}
			else if(type.equals("cahg_impt_work")){//重点工作
				return "redirect:/cahgImptWork/imptWorkListPage.do?title="+title;
			}
			else if(type.equals("cahg_custom_news")){//海关新闻
				return "redirect:/cahgCustomNews/customNewsListPage.do?title="+title;
			}
		}
		return "page/404";
	}
	
	
	/**
	 * 投票
	 */
	@RequestMapping(value="/survey")
	@ResponseBody
	public String survey(HttpServletRequest request){
		String ck = request.getParameter("ck");
		List<String> cks = Arrays.asList(ck.split(","));
		if(!"".equals(ck)&&ck!=null){
			cahgSurveyService.survey(cks);
			return "0";
		}
		return "1";
	}
	
	/**
	 * 底部
	 */
	@RequestMapping(value="/bottom")
	public String bottom(HttpServletRequest request){
		List<HashMap> linkList = cahgHyperlinkService.botLink(null);
		request.setAttribute("linkList", linkList);//底部超链接数据
		return "page/bottom";
	}
	
	/**
	 * 报表表格
	 */
	@RequestMapping(value="/work_left")
	public String work_left(HttpServletRequest request){
		String work_table_category_id = request.getParameter("url");
		List<HashMap> tableCategoryList = cahgWorkTableService.selectTableCategory(null);
		request.setAttribute("tableCategoryList", tableCategoryList);
		request.setAttribute("work_table_category_id", work_table_category_id);//左导航判断用
		return "page/work_left";
	}
	
	@RequestMapping(value="/office_work_left")
	public String office_work_left(HttpServletRequest request){
		String office_work_category_id = request.getParameter("url");
		List<HashMap> officeWorkCategoryList = deptservice.officeWorkCategory(null);
		request.setAttribute("officeWorkCategoryList", officeWorkCategoryList);
		request.setAttribute("url", office_work_category_id);//左导航判断用
		return "page/office_work_left";
	}
}
