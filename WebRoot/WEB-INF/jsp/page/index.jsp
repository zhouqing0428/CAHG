<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<base href="<%=basePath%>">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge; IE=8; IE=9" >
<title>中华人民共和国东莞长安海关</title>

<link rel="stylesheet" type="text/css" href="static/js/easyui/themes/default/easyui.css">
<script type="text/javascript" src="static/js/easyui/jquery.min.js"></script>
<script type="text/javascript" src="static/js/easyui/jquery.easyui.min.js"></script>
<link rel="stylesheet" type="text/css" href="static/js/easyui/themes/icon.css">

<link href="static/css/master.css" type="text/css" rel="stylesheet" />
<link href="static/css/base.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="static/js/jquery.js"></script>
<script type="text/javascript" src="static/js/SuperSlide.js?v2.1"></script>
<script type="text/javascript" src="static/js/jquery.jclock.js"></script>
<script type="text/javascript" src="static/js/jquery.slideBox.js"></script>
<link rel="stylesheet" type="text/css" href="static/css/jquery.slideBox.css">
</head>
<body bgcolor="#F1F1F1" onload="wish()" style="letter-spacing:1.5px;">
<!--头部--> 
<script type="text/javascript" src="static/js/dropdown.class.demo.js"></script>
<link rel="stylesheet" type="text/css" href="static/css/menu.css">
<link rel="stylesheet" type="text/css" href="static/css/boot.css">
<link href="static/css/index_1.css" rel="stylesheet" type="text/css" />

<style type="text/css">
	  #new_title{  
		display: block;
		width: 320px; /* li 的宽度 这个控制显示多少字后显示...设的宽度大于字数时， 是不会显示...的 */
		word-break: break-all;word-wrap: break-word;
		line-height:18px; margin-top:10px;
	  }  
	   #leaderSpeechList{  
		display: block;
		width: 210px; /* li 的宽度 这个控制显示多少字后显示...设的宽度大于字数时， 是不会显示...的 */
		word-break: break-all;word-wrap: break-word;
		line-height:14px; margin-top:8px;
	  } 
	  #officePostList{
	  display: block;
		width: 360px; /* li 的宽度 这个控制显示多少字后显示...设的宽度大于字数时， 是不会显示...的 */
		word-break: break-all;word-wrap: break-word;
		line-height:15px; margin-top:8px;
	  }
	   #meeting{  
		display: block;
		width: 240px; /* li 的宽度 这个控制显示多少字后显示...设的宽度大于字数时， 是不会显示...的 */
		word-break: break-all;word-wrap: break-word;
		line-height:15px; margin-top:8px;
	  } 
	  
	  #afficheList{
	 	 display: block;
		width: 220px; /* li 的宽度 这个控制显示多少字后显示...设的宽度大于字数时， 是不会显示...的 */
		word-break: break-all;word-wrap: break-word;
		line-height:15px; margin-top:8px;
	  }
	  #imptWorkList{
	  	display: block;
		width: 360px; /* li 的宽度 这个控制显示多少字后显示...设的宽度大于字数时， 是不会显示...的 */
		word-break: break-all;word-wrap: break-word;
		line-height:15px; margin-top:8px;
	  }
	 #imgTitle{
		width: 210px; /* li 的宽度 这个控制显示多少字后显示...设的宽度大于字数时， 是不会显示...的 */
		display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;
	  }
	#indexJobList{
		display: block;
		width: 360px; /* li 的宽度 这个控制显示多少字后显示...设的宽度大于字数时， 是不会显示...的 */
		word-break: break-all;word-wrap: break-word;
		line-height:18px; margin-top:10px;
	}
</style>
<!-- <iframe class="top" frameborder="0" scrolling="no" src="index/head.do" widht="100%" height="280px;"></iframe> -->
  <div class="index-main clearfix" style="margin-top:-10px;width:1000px;">
	<!--图片新闻-->
    <div class="focusBox fl">
			<ul class="pic">
				<c:forEach items="${imgNewsList}" var="ele">
			   			<li><a target="_blank" href="cahgImgNews/imgNewsDetailsPage.do?img_new_id=${ele.img_new_id }"  title="${ele.img_new_title }"><img width="282" height="237" src="http://10.56.65.100/file/upImg/imgNews/${ele.img_url }" /></a></li>
			   	</c:forEach>
			</ul>
			<div class="txt-bg"></div>
			<div class="txt">
				<ul>
					<c:forEach items="${imgNewsList}" var="ele">
			   			<li><a target="_blank" id="imgTitle" href="cahgImgNews/imgNewsDetailsPage.do?img_new_id=${ele.img_new_id }"  title="${ele.img_new_title }">${ele.img_new_title }</a></li>
			   		</c:forEach>
				</ul>
			</div>
			<ul class="num">
					<c:forEach items="${imgNewsList}" var="ele" varStatus="index">
			   			<li><a target="_blank" onclick="return false;" href="javascript:void(0);">${index.index+1 }</a></li>
			   		</c:forEach>
			   		<a style="color:#fff;" target="_blank"  href="cahgImgNews/imgNewsListPage.do">..</a>
			</ul>	
	</div>
    <!--TAB选项卡-->
    <div class="slideTxtBox fl ml8">
        <div class="hd">
        	<a href="cahgDayInfo/dayInfoListPage.do" class="fr fm1">更多<<</a>
            <ul><li>每日信息</li></ul>
        </div>
        <div class="bd">
            <ul>
            	<c:forEach items="${dayInfoList}" var="ele"><!--每日信息  -->
	              <li style="line-height:20px;">
	              <fmt:parseDate var="systemDate" value="${sysDate}" pattern="yyyy-MM-dd HH:mm:ss" /><!-- 把java取来的系统当前时间格式化 -->
	                <fmt:parseDate var="create_date" value="${ele.create_date}" pattern="yyyy-MM-dd HH:mm:ss" /><!-- 把数据对应的时间格式化 -->
	                <c:set var="timeMis" value="${systemDate.time - create_date.time}"/><!-- 比较当前时间和数据时间的时差  毫秒 -->
					<c:set var="imgShow"><fmt:formatNumber value="${timeMis/1000/3600}" pattern="#0.0"/></c:set><!-- 转化为天数保存在imgShow -->               
	                <a href="cahgDayInfo/dayInfoDetailsPage.do?day_id=${ele.day_id}" target="_blank" id="new_title" title='${ele.day_title}'>${ele.day_title}<span style="color:#999">[${ele.create_date_show }]</span>
	                <c:if test="${imgShow <= 24.0 }"><!-- 判断是否显示 -->
						<img style="margin-top:-5px;" src="static/images/new.gif">
	              	</c:if>
	                </a>
	              </li>
				</c:forEach>
            </ul>
        </div>
		</div>
        <!--领导讲话-->
        <div class="yqg border fr slideTxtBox" >
        <div class="hd">
            <ul><li>总关领导讲话</li><li>本办领导讲话</li></ul>
        </div>
        <div class="bd">
            <ul>
             <c:forEach items="${leaderSpeechList }" var="ele">
	               <li style="line-height:14px; margin-top:8px;"><a id="leaderSpeechList" href="leaderSpeech/leaderSpeechDetailsPage.do?leader_speech_id=${ele.leader_speech_id}" title='${ele.title }' target="_blank">${ele.title }<span style="color:#999">[${ele.create_date_show }]</span></a></li>
             </c:forEach>
            </ul>
            <ul>
                <c:forEach items="${indexLeaderBSpeechList }" var="ele">
	               <li><a id="leaderSpeechList" href="leaderSpeech/leaderSpeechDetailsPage.do?leader_speech_id=${ele.leader_speech_id}" title='${ele.title }' target="_blank">${ele.title }<span style="color:#999">[${ele.create_date_show }]</span></a></li>
             </c:forEach>
            </ul>
        </div>
        </div>
        <!--入园企业-->
     <!--会议通知-->
    	<div class="slideTxtBox zhengce fl mt10" style="height:280px;">
        <div class="hd h30">
     	   <a href="cahgMeetingNotice/meetingNoticeListPage.do" class="fr fm1">更多<<</a>
            <ul><li>会议通知</li></ul>
            
        </div>
        <div class="bd" style="height:218px;overflow:hidden;">
            <ul>
            <c:forEach items="${meetingNoticeList }" var="ele">
          			<li style="line-height:20px;">
          			<fmt:parseDate var="systemDate" value="${sysDate}" pattern="yyyy-MM-dd HH:mm:ss" /><!-- 把java取来的系统当前时间格式化 -->
		                 <fmt:parseDate var="create_date" value="${ele.create_date}" pattern="yyyy-MM-dd HH:mm:ss" /><!-- 把数据对应的时间格式化 -->
		                 <c:set var="timeMis" value="${systemDate.time - create_date.time}"/><!-- 比较当前时间和数据时间的时差  毫秒 -->
						 <c:set var="imgShow"><fmt:formatNumber value="${timeMis/1000/3600}" pattern="#0.0"/></c:set><!-- 转化为天数保存在imgShow -->
	               	 <a id="meeting" href="cahgMeetingNotice/meetingNoticeDetailsPage.do?meeting_notice_id=${ele.meeting_notice_id }" target="_blank" title='${ele.title }'>${ele.title }
	               	 	<span style="color:#999">[${ele.create_date_show }]</span>
	               	 	<c:if test="${imgShow <= 24.0 }"><!-- 判断是否显示 -->
							<img style="margin-top:-5px;" src="static/images/new.gif">
		               	 </c:if>
	               	 </a>
	            	</li>
          		</c:forEach>
            </ul>
        </div>
        <a href="javascript:void(0)" onclick="meetingRoom()" style="float:right;" class="easyui-linkbutton" data-options="iconCls:'icon-search'" style="width:100px">会议申请</a>
    </div>
    
    <!--本办发文-->
    <div class="slideTxtBox  fl ml8 mt10" style="width:410px;height:280px">
        <div class="hd h30">
        	<a href="cahgOfficePost/officePostListPage.do" class="fr fm1">更多<<</a>
            <ul><li>本办发文</li></ul>
        </div>
        <div class="bd">
            <ul>
            	 <c:forEach items="${officePostList }" var="ele">
	         		  <li style="line-height: 20px;">
			              <a id="officePostList" href="cahgOfficePost/officePostDetailsPage.do?office_post_id=${ele.office_post_id }" id="indexJobList" target="_blank" title='${ele.title }'>${ele.title }<span style="color:#999">[${ele.create_date_show }]</span></a>
			          </li>
	         	</c:forEach>
                
            </ul>
        </div>
    </div>
    
    <!--公示公告-->
    <div class="slideTxtBox xgxz fr mt10" style="height:280px;">
        <div class="hd h30">
        	<a href="cahgAffiche/afficheListPage.do" class="fr fm1">更多<<</a>
            <ul><li>公示公告</li></ul>
        </div>
        <div class="bd">
            <ul>
            	<c:forEach items="${afficheList}" var="ele">
	          		 <li>
	          			    <fmt:parseDate var="systemDate" value="${sysDate}" pattern="yyyy-MM-dd HH:mm:ss" /><!-- 把java取来的系统当前时间格式化 -->
			                <fmt:parseDate var="create_date" value="${ele.create_date}" pattern="yyyy-MM-dd HH:mm:ss" /><!-- 把数据对应的时间格式化 -->
			                <c:set var="timeMis" value="${systemDate.time - create_date.time}"/><!-- 比较当前时间和数据时间的时差  毫秒 -->
							<c:set var="imgShow"><fmt:formatNumber value="${timeMis/1000/3600}" pattern="#0.0"/></c:set><!-- 转化为天数保存在imgShow -->
							
	                	<a href="cahgAffiche/afficheDetailsPage.do?affiche_id=${ele.affiche_id }" target="_blank" id="afficheList" title='${ele.title}'>${ele.title}
			              <span style="color:#999">[${ele.create_date_show }]</span>
			              <c:if test="${imgShow <=24.0 }"><!-- 判断是否显示 -->
								<img style="margin-top:-5px;" src="static/images/new.gif">
			              	</c:if>
						</a>
	              	</li>
	          	</c:forEach>
            </ul>
        </div>
    </div>
    
    <!--重点工作-->
        <div class="slideTxtBox ruyuan fl mt10">
            <div class="hd">
            	<a href="cahgImptWork/imptWorkListPage.do" class="fr fm1">更多<<</a>
                <ul><li>重点工作</li></ul>
            </div>
            <div class="bd">
                <ul>
                	<c:forEach items="${workTableType }" var="ele">
		         			  <li>
				              <a style="width: 240px;margin-top:8px;margin-left:5px;;height:40px;background-color: #70B9E4;" class="btn btn-primary btn-lg" href="cahgWorkTable/workTableListPage.do?work_table_category_id=${ele.work_table_category_id }"  target="_blank">${ele.name }</a>
				          </li>
		         	</c:forEach>
		         
				      <!--    <li>  <a style="width: 240px;margin-top:8px;margin-left:5px;;height:40px;background-color: #70B9E4;" class="btn btn-primary btn-lg" href="cahgWorkTable/workTableListPage.do?work_table_category_id=1"  target="_blank">指标</a></li>
				   
				          <li> <a style="width: 240px;margin-top:8px;margin-left:5px;;height:40px;background-color: #70B9E4;" class="btn btn-primary btn-lg" href="cahgWorkTable/workTableListPage.do?work_table_category_id=2"  target="_blank">信息 </a></li>
				  
				          <li> <a style="width: 240px;margin-top:8px;margin-left:5px;;height:40px;background-color: #70B9E4;" class="btn btn-primary btn-lg" href="cahgWorkTable/workTableListPage.do?work_table_category_id=3"  target="_blank">业务量</a></li>
				    
				   
				           <li><a style="width: 240px;margin-top:8px;margin-left:5px;;height:40px;background-color: #70B9E4;" class="btn btn-primary btn-lg" href="cahgWorkTable/workTableListPage.do?work_table_category_id=4"  target="_blank">其他工作 </a></li>
				     -->
                </ul>
            </div>
    </div>
    
    <!--工作督办-->
        <div class="slideTxtBox qy-news fl ml8 mt10" style="width:410px;">
            <div class="hd">
            	<a href="cahgJob/jobListPage.do" class="fr fm1">更多<<</a>
                <ul><li>工作督办</li></ul>
            </div>
            <div class="bd">
                <ul>
                	 <c:forEach items="${indexJobList }" var="ele">
		         		  <li>
		         		  
		         		   <fmt:parseDate var="systemDate" value="${sysDate}" pattern="yyyy-MM-dd HH:mm:ss" /><!-- 把java取来的系统当前时间格式化 -->
			                <fmt:parseDate var="end_time" value="${ele.end_time}" pattern="yyyy-MM-dd HH:mm:ss" /><!-- 把数据对应的时间格式化 -->
			                <c:set var="mis" value="${systemDate.time - end_time.time}"/><!-- 比较当前时间和数据时间的时差  毫秒 -->
							<c:set var="titleShow"><fmt:formatNumber value="${mis/1000/3600/24}" pattern="#0.0"/></c:set><!-- 转化为天数保存在imgShow -->
							<c:if test="${titleShow > 1.0}"><!-- 判断是否显示 -->
								 <a style="color: red;" href="cahgJob/jobDetailsShow.do?job_id=${ele.job_id }" target="_blank" id="indexJobList" title='${ele.title }'>${ele.title }<span style="color:#999">[${ele.create_date_show }]</span></a>
			              	</c:if>
			              	<c:if test="${titleShow >= 0.0 and  titleShow<= 1.0}"><!-- 判断是否显示 -->
								 <a style="color:#3424B2;" href="cahgJob/jobDetailsShow.do?job_id=${ele.job_id }" target="_blank" id="indexJobList" title='${ele.title }'>${ele.title }<span style="color:#999">[${ele.create_date_show }]</span></a>
			              	</c:if>
		         		  	<c:if test="${titleShow < 0.0 }"><!-- 判断是否显示 -->
								 <a href="cahgJob/jobDetailsShow.do?job_id=${ele.job_id }" target="_blank" id="indexJobList" title='${ele.title }'>${ele.title }<span style="color:#999">[${ele.create_date_show }]</span></a>
			              	</c:if>
				             
				          </li>
		         	</c:forEach>
                </ul>
            </div>
    </div>
    
    <!--网上办公-->
    <div class="slideTxtBox qywh fr mt10">
            <div class="hd">
                <ul><li>长安风采</li></ul>
            </div>
			<div class="bd" style="margin-left:10px;margin-top:-10px;">
                <ul style="text-align: center;" >
		         	<li align="center" style="background-image:url(static/images/list4.jpg);background-size:cover; margin-top:3px;line-height:33px;width:220px;height:30px;background-color: #70B9E4;">
				          <a href="dept/dept_left.do"  target="_blank">制度建设</a>
				    </li>
				    
				    <li  align="center" style="background-image:url(static/images/list4.jpg);background-size:cover; margin-top:3px;line-height:33px;width:220px;height:30px;background-color: #70B9E4">
				          <a  href="cahgDutySchedule/dutyDetailsShow.do?type=1"  target="_blank">值班安排 </a>
				    </li>
				    
				    <li  align="center" style="background-image:url(static/images/list4.jpg);background-size:cover; margin-top:3px;line-height:33px;width:220px;height:30px;background-color: #70B9E4">
				          <a   href="http://10.56.65.252/baozhang/index.aspx"  target="_blank">技术报障</a>
				    </li>
				    
				     <li  align="center" style="background-image:url(static/images/list4.jpg);background-size:cover; margin-top:3px;line-height:33px;width:220px;height:30px;background-color: #70B9E4">
				          <a href="http://10.56.65.71/assetmaintain/"  target="_blank">物业报障 </a>
				    </li>
				    
				    <li  align="center" style="background-image:url(static/images/list4.jpg);background-size:cover; margin-top:3px;line-height:33px;width:220px;height:30px;background-color: #70B9E4">
				           <a href="http://10.56.2.241/jsp/changan_index.jsp"  target="_blank">后勤保障</a>
				    </li>
				    
				    <li  align="center" style="background-image:url(static/images/list4.jpg);background-size:cover; margin-top:3px;line-height:33px;width:220px;height:30px;background-color: #70B9E4">
				           <a href="commomForm/commomFormsListPage.do?type=0"  target="_blank">常用表格下载</a>
				    </li>
                </ul>
            </div>
        </div>

     
    
    
    <div class="slideTxtBox zhengce fl mt10" style="height:280px">
        <div class="hd h30">
            <ul>
            	<li>专题专栏</li>
            </ul>
        </div>
        <div class="bd">
        	<c:forEach items="${tableCategoryList }" var="category">
        		<ul>
	        		<c:forEach items="${cahgSpecialTopicList }" var="ele" varStatus="index">
		        		<li><a style="width:120px;margin-top:5px;margin-left:5px;;height:45px;background-color: #75AAD6;float: left;" class="btn btn-primary btn-lg" id="indexJobList" href="cahgSpecialTopic/specialTopicListPage.do?url=${ele.special_topic_category_id }" title="${ele.name }" target="_blank"><span style="word-break:normal; width:auto; display:block; white-space:pre-wrap;word-wrap : break-word ;">${ele.name }</span></a></li>
		            </c:forEach>
            	</ul>
        	</c:forEach>
        </div>
    </div>

     <div class="slideTxtBox qy-news fl ml8 mt10" style="width:410px;height:280px;">
            <div class="hd">
            	<a href="cahgCustomNews/customNewsListPage.do" class="fr fm1">更多<<</a>
                <ul><li>海关新闻</li></ul>
            </div>
            <div class="bd">
                <ul>
                	<c:forEach items="${customNewsList }" var="ele">
		         		  <li>
				              <a href="cahgCustomNews/customNewsDetailsShow.do?custom_news_id=${ele.custom_news_id }" id="imptWorkList" target="_blank" title='${ele.title }'>${ele.title }
				              <span style="color:#999">[${ele.create_date_show }]</span></a>
				          </li>
		         	</c:forEach>
                </ul>
            </div>
    </div>  
    
    <div class="slideTxtBox xgxz fr mt10" style="height:280px">
        <div class="hd h30">
        	<!-- <a href="" class="fr fm1">更多<<</a> -->
            <ul><li>长安风采</li></ul>
        </div>
        <div style="margin-top:10px; background-color: #fff;width:340px;height:150px;">
            <table style="width:340px; height:100px;margin-left:10px;" id="survey">
              		<tr>
              			<td style="color:red;font-size: 17px;">${survey.question }<c:if test="${survey.answer_type eq 0 }">(单选)</c:if><c:if test="${survey.answer_type eq 1 }">(多选)</c:if></td>
              		</tr>
              		<c:if test="${survey.answer_type eq 0 }"><!-- 单选 -->
              			<tr>
              					<td id="answer">
              					<c:forEach items="${answerList }" var="ele" varStatus="index">
              						<c:if test="${index.index ne 0 && index.index%3 eq 0}">
              							<br/>
              						</c:if>
              						<input name="surveyAnswer" type="radio" value="${ele.survey_answer_id}" />${ele.choice_text }
              					</c:forEach>
              					 </td>
	              		</tr>
              		</c:if>
              		
              		<c:if test="${survey.answer_type eq 1 }"><!-- 多选 -->
              			<tr>
              					<td id="answer">
              					<c:forEach items="${answerList }" var="ele" varStatus="index">
              						<c:if test="${index.index ne 0 && index.index%3 eq 0}">
              							<br/>
              						</c:if>
              						<input name="surveyAnswer" type="checkbox" value="${ele.survey_answer_id}" />${ele.choice_text }
              					</c:forEach>
              					 </td>
	              		</tr>
              		</c:if>
              		
              		<tr>
              			<td align="center"><input type="button" onclick="survey()" height="20px;" width="30px;" value="确定"></td>
              			<!-- <td align="center"><a href="#" align="right">更多>></a></td> -->
              		</tr>
              	</table>
            </div>
      </div>

    </div>
        

			
	
<iframe class="top" frameborder="0" scrolling="no" src="index/bottom.do" widht="100%" ></iframe>

<!-- 
	<div id="room" class="easyui-window" title="Window Layout" data-options="iconCls:'icon-save'" style="width:500px;height:200px;padding:5px;">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center'" style="padding:10px;">
				<iframe frameborder="0" scrolling="no"></iframe>
			</div>
			<div data-options="region:'south',border:false" style="text-align:right;padding:5px 0 0;">
				<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="javascript:alert('ok')" style="width:80px">Ok</a>
				<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="javascript:alert('cancel')" style="width:80px">Cancel</a>
			</div>
		</div>
</div>
 -->

</body>
<script type="text/javascript">

function getContextPath() {
    var pathName = document.location.pathname;
    var index = pathName.substr(1).indexOf("/");
    var result = pathName.substr(0,index+1);
    return result;
  }
function meetingRoom(){
	var path = getContextPath();
	var url = path+"/cahgMeetingNotice/meetingRoomPage.do";
	window.open(encodeURI(url),'newwindow','height=400,width=500,top=100,left=400%,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
	/* window.open ('cahgMeetingNotice/meetingRoomPage.do','newwindow','height=400,width=500,top=100,left=400%,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no')  */
}


function wish(){
	   var wish = '${wish.wish_center}';
	   if(wish!=''){
		  alert(wish);
	   }
}

function survey(){
	var radios=document.getElementsByName("surveyAnswer");
	var ck = "0";
    for(var i=0;i<radios.length;i++)
    {
        if(radios[i].checked==true)
        {
            ck += ","+radios[i].value;
        }
    }
    if(ck=="" || ck=="0"){
    	alert("请先选择之后再确定提交，谢谢！");
    	return false;
    }
    $.ajax({
	    url:"index/survey.do",
	    dataType : "json", 
	    data: {ck:ck},
	    method:"post",
	    success:function(data){
	    	if(data==0){
	    		alert("选择成功！");
	    	}
	    	if(data==1){
	    		alert("选择失败！");
	    	}
	    }
	 });
}
</script>



<script src="static/js/all.js" type="text/javascript"></script>
</html>