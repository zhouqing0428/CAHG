
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transition al.dtd">
<html lang="en">
<base href="<%=basePath%>">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge; IE=8; IE=9" >
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7"/> 
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
<body bgcolor="#F1F1F1" onload="wish()" style="letter-spacing:1.5px;" class="body1">
<!--头部--> 
<script type="text/javascript" src="static/js/dropdown.class.demo.js"></script>
<link rel="stylesheet" type="text/css" href="static/css/menu.css">
<link rel="stylesheet" type="text/css" href="static/css/boot.css">
<link href="static/css/index_1.css" rel="stylesheet" type="text/css" />

<style type="text/css">
	  #new_title{  
		display: block;
		width: 295px; /* li 的宽度 这个控制显示多少字后显示...设的宽度大于字数时， 是不会显示...的 */
		overflow: hidden;  /*溢出隐藏*/
	    text-overflow: ellipsis; /*以省略号...显示*/
	    white-space: nowrap;  /*强制不换行*/
		line-height:18px; margin-top:8px;
	  }
	   #leaderSpeechList{  
		display: block;
		width: 200px; /* li 的宽度 这个控制显示多少字后显示...设的宽度大于字数时， 是不会显示...的 */
		overflow: hidden;  /*溢出隐藏*/
    text-overflow: ellipsis; /*以省略号...显示*/
    white-space: nowrap;  /*强制不换行*/
		line-height:16px; margin-top:8px;
	  } 
	  #officePostList{
	  display: block;
		width: 480px; /* li 的宽度 这个控制显示多少字后显示...设的宽度大于字数时， 是不会显示...的 */
		overflow: hidden;  /*溢出隐藏*/
    text-overflow: ellipsis; /*以省略号...显示*/
    white-space: nowrap;  /*强制不换行*/
		line-height:15px; margin-top:8px;
	  }
	   #meeting{  
		display: block;
		width: 235px; /* li 的宽度 这个控制显示多少字后显示...设的宽度大于字数时， 是不会显示...的 */
		overflow: hidden;  /*溢出隐藏*/
    text-overflow: ellipsis; /*以省略号...显示*/
    white-space: nowrap;  /*强制不换行*/
		line-height:18px; margin-top:10px;
	  } 
	  
	  #afficheList{
	 	 display: block;
		width: 190px; /* li 的宽度 这个控制显示多少字后显示...设的宽度大于字数时， 是不会显示...的 */
		overflow: hidden;  /*溢出隐藏*/
    text-overflow: ellipsis; /*以省略号...显示*/
    white-space: nowrap;  /*强制不换行*/
		line-height:20px; margin-top:8px;
	  }
	  #imptWorkList{
	  	display: block;
		width: 390px; /* li 的宽度 这个控制显示多少字后显示...设的宽度大于字数时， 是不会显示...的 */
		overflow: hidden;  /*溢出隐藏*/
    text-overflow: ellipsis; /*以省略号...显示*/
    white-space: nowrap;  /*强制不换行*/
		line-height:20px; margin-top:9px;
	  }
	  
	   #imptWorkList2{
	  	display: block;
		width: 360px; /* li 的宽度 这个控制显示多少字后显示...设的宽度大于字数时， 是不会显示...的 */
		overflow: hidden;  /*溢出隐藏*/
    text-overflow: ellipsis; /*以省略号...显示*/
    white-space: nowrap;  /*强制不换行*/
		line-height:20px; margin-top:9px;
	  }
	 #imgTitle{
		width: 210px; /* li 的宽度 这个控制显示多少字后显示...设的宽度大于字数时， 是不会显示...的 */
		display:block;
		white-space:nowrap; overflow:hidden; text-overflow:ellipsis;
	  }
	#indexJobList{
		display: block;
		width: 380px; /* li 的宽度 这个控制显示多少字后显示...设的宽度大于字数时， 是不会显示...的 */
		overflow: hidden;  /*溢出隐藏*/
    text-overflow: ellipsis; /*以省略号...显示*/
    white-space: nowrap;  /*强制不换行*/
		line-height:16px; margin-top:4px;
	}
	
	#indexJobList2{
		display: block;
		width: 380px; /* li 的宽度 这个控制显示多少字后显示...设的宽度大于字数时， 是不会显示...的 */
		overflow: hidden;  /*溢出隐藏*/
    text-overflow: ellipsis; /*以省略号...显示*/
    white-space: nowrap;  /*强制不换行*/
		line-height:20px; margin-top:7px;
	}
	
	.btnw:hover{
		background-color:#4985C6;
	}
/* 	.zhuanti{background: url('static/images/test4.jpg') no-repeat center;}  */
/* 	.zhuanti{background-color: red} */
</style>
			
<iframe class="top" id="topif" name="topif" frameborder="0" scrolling="no" src="index/head.do" widht="100%" height="280px;"></iframe>
  <div class="index-main clearfix" style="margin-top:-12px;width:1000px;">
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
    <div class="slideTxtBox fl ml8" style="border:1px solid #CCC">
        <div class="hd">
        	<a href="cahgDayInfo/dayInfoListPage.do" style="color: red;border-radius:6px;border:1px solid;line-height:22px;margin-top:7px;" target="_blank" class="fr fm1">更多>></a>
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
	                <a style="width:320px;" href="cahgDayInfo/dayInfoDetailsPage.do?day_id=${ele.day_id}" target="_blank" title='${ele.day_title}'><span id="new_title">${ele.day_title}</span>
	               <%--  <span style="color:#999;float:right;margin-top:-18px; ">[${ele.create_date_show }]</span> --%>
	                 <c:if test="${imgShow <= 24.0 }"><!-- 判断是否显示 -->
						<img style="margin-top:-16px; float:right;" src="static/images/new.gif">
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
            <ul><li style="cursor:pointer; ">总关领导讲话</li><li style="cursor:pointer; ">本关领导讲话</li></ul>
        </div>
        <div class="bd">
            <ul>
             <c:forEach items="${leaderSpeechList }" var="ele">
	               <li ><a  href="leaderSpeech/leaderSpeechDetailsPage.do?leader_speech_id=${ele.leader_speech_id}" title='${ele.title }' target="_blank"><span id="leaderSpeechList">${ele.title }</span>
	              <%--  <span style="color:#999;float:right;margin-top:-18px;">[${ele.create_date_show }]</span> --%>
	               </a></li>
             </c:forEach>
             		<a href="leaderSpeech/leaderSpeechListPage.do?type=1" target="_blank" style="color: red;border-radius:6px;border:1px solid;line-height:22px;margin-top:7px;" class="fm1 fr">更多>></a>
            </ul>
            <ul>
                <c:forEach items="${indexLeaderBSpeechList }" var="ele">
	               <li><a href="leaderSpeech/leaderSpeechDetailsPage.do?leader_speech_id=${ele.leader_speech_id}" title='${ele.title }' target="_blank"><span id="leaderSpeechList">${ele.title }</span>
<%-- 	               <span style="color:#999;float:right;margin-top:-18px;">[${ele.create_date_show }]</span> --%>
	               </a></li>
             </c:forEach>
             	<a href="leaderSpeech/leaderSpeechListPage.do?type=2" target="_blank" style="color: red;border-radius:6px;border:1px solid;line-height:22px;margin-top:7px;" class="fm1 fr">更多>></a>
            </ul>
        </div>
        </div>
        <!--入园企业-->
     <!--会议通知-->
    	<div class="slideTxtBox zhengce fl mt10" style="height:280px;border:1px solid #CCC">
        <div class="hd">
     	   <a href="cahgMeetingNotice/meetingNoticeListPage.do" target="_blank" style="color: red;border-radius:6px;border:1px solid;line-height:22px;margin-top:7px;" target="_blank" class="fr fm1">更多>></a>
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
	               	 <a href="cahgMeetingNotice/meetingNoticeDetailsPage.do?meeting_notice_id=${ele.meeting_notice_id }" target="_blank" title='${ele.title }'><span  id="meeting">${ele.title }</span>
	               	 	<%-- <span style="color:#999;float:right;margin-top:-18px;">[${ele.create_date_show }]</span> --%>
	               	 	<c:if test="${imgShow <= 24.0 }"><!-- 判断是否显示 -->
							<img style="margin-top:-12px;float:right;" src="static/images/new.gif">
		               	 </c:if>
	               	 </a>
	            	</li>
          		</c:forEach>
            </ul>
        </div>
        <a href="javascript:void(0)" onclick="meetingRoom()" style="float:right;" class="easyui-linkbutton" data-options="iconCls:'icon-search'" style="width:100px">会议申请</a>
    </div>
    
    <!--本办发文-->
    <div class="slideTxtBox  fl ml8 mt10" style="width:410px;height:280px;border:1px solid #CCC">
        <div class="hd">
        	<a href="cahgOfficePost/officePostListPage.do" style="color: red;border-radius:6px;border:1px solid;line-height:22px;margin-top:7px;" target="_blank" class="fr fm1">更多>></a>
            <ul><li>本关发文</li></ul>
        </div>
        <div class="bd">
            <ul>
            	 <c:forEach items="${officePostList }" var="ele">
	         		  <li>
			              <a id="officePostList" href="cahgOfficePost/officePostDetailsPage.do?office_post_id=${ele.office_post_id }"  target="_blank" title='${ele.title }'><span id="indexJobList">${ele.title }</span>
			              <%-- <span style="color:#999;float:right;margin-top:-16px;">[${ele.create_date_show }]</span> --%>
			              </a>
			          </li>
	         	</c:forEach>
                
            </ul>
        </div>
    </div>
    
    <!--公示公告-->
    <div class="slideTxtBox xgxz fr mt10" style="height:280px;border:1px solid #CCC">
        <div class="hd">
        	<a href="cahgAffiche/afficheListPage.do" style="color: red;border-radius:6px;border:1px solid;line-height:22px;margin-top:7px;" target="_blank" class="fr fm1">更多>></a>
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
							
	                	<a href="cahgAffiche/afficheDetailsPage.do?affiche_id=${ele.affiche_id }" target="_blank" title='${ele.title}'><span id="afficheList">${ele.title}</span>
			             <%--  <span style="color:#999">[${ele.create_date_show }]</span> --%>
			              <c:if test="${imgShow <=24.0 }"><!-- 判断是否显示 -->
								<img style="margin-top:-14px;float:right" src="static/images/new.gif">
			              	</c:if>
						</a>
	              	</li>
	          	</c:forEach>
            </ul>
        </div>
    </div>
    
    <!--重点工作-->
        <div class="slideTxtBox ruyuan fl mt10" style="border:1px solid #CCC">
            <div class="hd">
            	<a href="cahgImptWork/imptWorkListPage.do" style="color: red;border-radius:6px;border:1px solid;line-height:22px;margin-top:7px;" target="_blank" class="fr fm1" target="_blank" class="fr fm1">更多>></a>
                <ul><li>重点工作</li></ul>
            </div>
            <div class="bd" >
                <ul style="list-style:none;  ">
                	<c:forEach items="${workTableType }" var="ele" >
		         	 <%-- <li   style="background-image:url(static/images/worktable.jpg);background-size:cover;height:30px; width:220px; border:1px solid #CCC;margin:8px;" >
				           <a    style="font-size:15px;height:100%;width:100%;;line-height:30px; "  href="cahgWorkTable/workTableListPage.do?work_table_category_id=${ele.work_table_category_id }"  target="_blank">${ele.name }</a>
				     </li> --%>
				    <a href="cahgWorkTable/workTableListPage.do?work_table_category_id=${ele.work_table_category_id }" style=""> <img src="static/images/${ele.img }" style="float: left;margin-left:25px;height:30px;width:30px;" alt=""/><li style=";margin-left:25px;;font-size:14px;width:220px;text-align:center;text-decoration:none;background:#f6d05a;line-height:30px;margin-bottom:6px;border-radius:6px;">${ele.name }</li></a>
		         	</c:forEach>
                </ul>
            </div>
    </div>
    
    <!--工作督办-->
        <div class="slideTxtBox qy-news fl ml8 mt10" style="width:410px;border:1px solid #CCC">
            <div class="hd">
            	<a href="cahgJob/jobListPage.do" style="color: red;border-radius:6px;border:1px solid;line-height:22px;margin-top:7px;" target="_blank" class="fr fm1" target="_blank" class="fr fm1">更多>></a>
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
							<c:if test="${titleShow > 1.0 and (ele.status ne 2 and ele.status ne 3)}"><!-- 判断是否显示 -->
								 <a style="color: red;" href="cahgJob/jobDetailsShow.do?job_id=${ele.job_id }" target="_blank" title='${ele.title }'><span id="indexJobList2">${ele.title }</span>
								<%--  <span style="color:#999;float:right;margin-top:-18px;">[${ele.create_date_show }]</span> --%>
								 </a>
			              	</c:if>
			              <%-- 	<c:if test="${titleShow > 1.0 and ele.status eq 2}"><!-- 判断是否显示 -->
								 <a  href="cahgJob/jobDetailsShow.do?job_id=${ele.job_id }" target="_blank" title='${ele.title }'><span id="indexJobList2">${ele.title }</span>
								 <span style="color:#999;float:right;margin-top:-18px;">[${ele.create_date_show }]</span>
								 </a>
			              	</c:if> --%>
			              	<c:if test="${titleShow >= 0.0 and  titleShow<= 1.0 and ele.status ne 2 and ele.status ne 3}"><!-- 判断是否显示 -->
								 <a style="color:#3424B2;" href="cahgJob/jobDetailsShow.do?job_id=${ele.job_id }" target="_blank" title='${ele.title }'><span id="indexJobList2">${ele.title }</span><span style="color:#999;float:right;margin-top:-18px;">[${ele.create_date_show }]</span></a>
			              	</c:if>
		         		  	<c:if test="${titleShow < 0.0 }"><!-- 判断是否显示 -->
								 <a href="cahgJob/jobDetailsShow.do?job_id=${ele.job_id }" target="_blank" title='${ele.title }'><span id="indexJobList2">${ele.title }</span>
								 <%-- <span style="color:#999;float:right;margin-top:-18px;">[${ele.create_date_show }]</span> --%>
								 </a>
			              	</c:if>
				          </li>
		         	</c:forEach>
                </ul>
            </div>
    </div>
    <!--网上办公-->
    <div class="slideTxtBox qywh fr mt10" style="border:1px solid #CCC">
            <div class="hd">
                <ul><li>网上办公</li></ul>
            </div>
			<div class="bd" style="margin-left:0px;margin-top:-10px;">
                <ul style="text-align: center;" >
		         	<!-- <li align="center" style="background-image:url(static/images/list3.jpg);background-size:cover; margin-top:3px;line-height:33px;width:220px;height:30px;background-color: #70B9E4;">
				          <a href="dept/dept_left.do"  target="_blank" style="font-size:15px;">制度建设</a>
				    </li>
				    
				    <li  align="center" style="background-image:url(static/images/list3.jpg);background-size:cover; margin-top:3px;line-height:33px;width:220px;height:30px;background-color: #70B9E4">
				          <a  href="cahgDutySchedule/dutyDetailsShow.do?type=1" style="font-size:15px;"  target="_blank">值班安排 </a>
				    </li>
				    
				    <li  align="center" style="background-image:url(static/images/list3.jpg);background-size:cover; margin-top:3px;line-height:33px;width:220px;height:30px;background-color: #70B9E4">
				          <a   href="http://10.56.65.252/baozhang/index.aspx"  style="font-size:15px;" target="_blank">技术报障</a>
				    </li>
				    
				     <li  align="center" style="background-image:url(static/images/list3.jpg);background-size:cover; margin-top:3px;line-height:33px;width:220px;height:28px;background-color: #70B9E4">
				          <a href="http://10.56.65.71/assetmaintain/" style="font-size:15px;" target="_blank">物业报障 </a>
				    </li>
				    
				    <li  align="center" style="background-image:url(static/images/list3.jpg);background-size:cover; margin-top:3px;line-height:33px;width:220px;height:30px;background-color: #70B9E4">
				           <a href="http://10.56.2.241/jsp/changan_index.jsp" style="font-size:15px;"  target="_blank">后勤报障</a>
				    </li>
				    
				    <li  align="center" style="background-image:url(static/images/list3.jpg);background-size:cover; margin-top:3px;line-height:33px;width:220px;height:30px;background-color: #70B9E4">
				           <a href="commomForm/commomFormsListPage.do?type=0" style="font-size:15px;" target="_blank">常用表格下载</a>
				    </li> -->
				    <p align="center" style=" margin-top:3px;line-height:33px;width:220px;height:30px;background-color: #f6d05a;border-radius:16px;">
				           <a href="dept/dept_left.do" style="font-size:15px;" target="_blank"><img style="float: left;margin-left:30px;height:30px;width:35px;" src="static/images/bg1.png"></img><span style="margin-left:-40px;">制度建设</span></a>
				    </p>
				    <p align="center" style=" margin-top:3px;line-height:33px;width:220px;height:30px;background-color: #f6d05a;border-radius:16px;">
				           <a href="cahgDutySchedule/dutyDetailsShow.do?type=1" style="font-size:15px;" target="_blank"><img style="float: left;margin-left:30px;height:30px;width:35px;" src="static/images/bg3.png"></img><span style="margin-left:-45px;">值班安排</span></a>
				    </p>
				    <p align="center" style=" margin-top:3px;line-height:33px;width:220px;height:30px;background-color: #f6d05a;border-radius:16px;">
				           <a href="http://10.56.65.252/baozhang/index.aspx" style="font-size:15px;" target="_blank"><img style="float: left;margin-left:30px;height:30px;width:30px;" src="static/images/bg4.png"></img><span style="margin-left:-40px;">技术报障</span></a>
				    </p>
				    <p align="center" style=" margin-top:3px;line-height:33px;width:220px;height:30px;background-color: #f6d05a;border-radius:16px;">
				           <a href="http://10.56.65.71/assetmaintain/" style="font-size:15px;" target="_blank"><img style="float: left;margin-left:30px;height:30px;width:30px;" src="static/images/bg5.png"></img><span style="margin-left:-40px;">物业报障</span></a>
				    </p>
				    <p align="center" style=" margin-top:3px;line-height:33px;width:220px;height:30px;background-color: #f6d05a;border-radius:16px;">
				           <a href="http://10.56.2.241/jsp/changan_index.jsp" style="font-size:15px;" target="_blank"><img style="float: left;margin-left:30px;height:30px;width:30px;" src="static/images/bg6.png"></img><span style="margin-left:-40px;">后勤保障</span></a>
				    </p>
				    <p align="center" style=" margin-top:3px;line-height:33px;width:220px;height:30px;background-color: #f6d05a;border-radius:16px;">
				           <a href="commomForm/commomFormsListPage.do?type=0" style="font-size:15px;" target="_blank"><img style="float: left;margin-left:30px;height:30px;width:30px;" src="static/images/bg2.png"></img><span style="margin-left:-20px;">常用表格下载</span></a>
				    </p>
                </ul>
            </div>
        </div>
    <div class="slideTxtBox zhengce fl mt10" style="height:280px;border:1px solid #CCC">
        <div class="hd">
            <ul>
            	<li>专题专栏</li>
            </ul>
        </div>
        <div class="bd" style="text-align:center;width:100%;">
        	<c:forEach items="${tableCategoryList }" var="category">
        		<ul>
	        		<c:forEach items="${cahgSpecialTopicList }" var="ele" varStatus="index">
		        		<li  style=" text-align:center;margin:0 auto;"><a  class="zhuanti" style="border-radius:10px;background-color: #f6d05a;width:110px;margin-top:5px;height:30px;margin-left:10px;float: left;" id="indexJobList" href="cahgSpecialTopic/specialTopicListPage.do?url=${ele.special_topic_category_id }" title="${ele.name }" target="_blank"><span style="line-height:28px;font-size:14px;">${ele.name }</span></a></li>
		            </c:forEach>
            	</ul>
        	</c:forEach>
        </div>
    </div>
     <div class="slideTxtBox qy-news fl ml8 mt10" style="width:410px;height:280px;border:1px solid #CCC">
            <div class="hd">
            	<a href="cahgCustomNews/customNewsListPage.do" style="color: red;border-radius:6px;border:1px solid;line-height:22px;margin-top:7px;" target="_blank" class="fr fm1" target="_blank" class="fr fm1">更多>></a>
                <ul><li>海关新闻</li></ul>
            </div>
            <div class="bd">
                <ul>
                	<c:forEach items="${customNewsList }" var="ele">
		         		  <li>
				              <a href="cahgCustomNews/customNewsDetailsShow.do?custom_news_id=${ele.custom_news_id }"  target="_blank" title='${ele.title }'><span id="imptWorkList2">${ele.title }</span></a>
				              <%-- <span style="color:#999;float:right;margin-top:-20px">[${ele.create_date_show }]</span></a> --%>
				          </li>
		         	</c:forEach>
                </ul>
            </div>
    </div>  
    <div class="slideTxtBox xgxz fr mt10" style="height:280px;border:1px solid #CCC">
        <div class="hd">
        	<!-- <a href="" class="fr fm1">更多>></a> -->
            <ul><li>网上调查</li></ul>
        </div>
        <div style="margin-top:10px; background-color: #fff;width:340px;height:150px;">
            <table style="width:340px; height:100px;margin-left:10px;" id="survey">
              		<tr>
              			<td style="background-image:url(static/images/dc.png); background-repeat:no-repeat;text-indent:27px;color:#373737;line-height:28px;font-size: 12px;">${survey.question }<c:if test="${survey.answer_type eq 0 }">(单选)</c:if><c:if test="${survey.answer_type eq 1 }">(多选)</c:if></td>
              		</tr>
              		<c:if test="${survey.answer_type eq 0 }"><!-- 单选 -->
              			<%-- <tr>
              					<td id="answer">
              					<c:forEach items="${answerList }" var="ele" varStatus="index">
              						<c:if test="${index.index ne 0 && index.index%3 eq 0}">
              							<br/>
              						</c:if>
              						<input name="surveyAnswer" type="radio" value="${ele.survey_answer_id}" />${ele.choice_text }
              					</c:forEach>
              					 </td>
	              		</tr> --%>
	              		<c:forEach items="${answerList }" var="ele" varStatus="index">
	              			<tr>
	              				<td style="line-height: 24px;">
	              					<input name="surveyAnswer" type="radio" value="${ele.survey_answer_id}" />${ele.choice_text }
	              				</td>
	              			</tr>
	              		</c:forEach>
              		</c:if>
              		
              		<c:if test="${survey.answer_type eq 1 }"><!-- 多选 -->
              			<%-- <tr>
              					<td id="answer">
              					<c:forEach items="${answerList }" var="ele" varStatus="index">
              						<c:if test="${index.index ne 0 && index.index%3 eq 0}">
              							<br/>
              						</c:if>
              						<input name="surveyAnswer" type="checkbox" value="${ele.survey_answer_id}" />${ele.choice_text }
              					</c:forEach>
              					 </td>
	              		</tr> --%>
	              		<c:forEach items="${answerList }" var="ele" varStatus="index">
	              			<tr>
	              				<td>
	              					<input name="surveyAnswer" type="checkbox" value="${ele.survey_answer_id}" />${ele.choice_text }
	              				</td>
	              			</tr>
	              		</c:forEach>
              		</c:if>
              		
              		<tr>
              			<td align="center"></div>
              				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="survey()" data-options="iconCls:'icon-ok'">确定</a>
              			</td>
              			<!-- <td align="center"><a href="#" align="right">更多>></a></td> -->
              		</tr>
              	</table>
            </div>
      </div>
    </div>
<iframe class="bot" frameborder="0" scrolling="no" src="index/bottom.do" width="100%" height="100%"></iframe>
 <!--   <button onclick="hf()">换肤</button> -->
   <div id="float_icon"  style="position: absolute; z-index: 99999; top: 1px; left: 1px; visibility: visible;display:none;"> 
	   <input type="button" id="close">
	   <a href="zc.html" target="_blank"><img id="pictureImg" src="" style="width:300px;height:110px"></a>
   </div>
    <script type="text/javascript">
    var dirX =1,dirY =1;var posX =0,posY =0;
    var a1a;
    var on = document.getElementById("float_icon");
    
    var oneButton = document.getElementById("close"); 
    oneButton.setAttribute("value","关闭"); 
    oneButton.style.cssFloat="right";
    window.onload=function(){ 
    	var picture = '${pictureState}';
    	var pictureImg = '${pictureImg}';
    	if(picture==1){
    		$("#float_icon").css("display","");
    		  $("#pictureImg").attr("src","http://10.56.65.100/CAHGAdmin/upImg/file/"+pictureImg);   
    	 	  /* $("#pictureImg").attr("src","http://192.168.1.175:8181/CAHGAdmin/upImg/file/"+pictureImg);  */  
    		 on.style.top =0;document.getElementById("float_icon").style.left =0;
    	        float_icon.style.visibility ="visible";
    	        a1a = setInterval("moveIcon()",50);
    	}
       
       
      
    }
    
    
    
    function moveIcon() {
    	posX +=(2 *dirX);posY +=(2 *dirY);$("#float_icon").css("top",posY);
    	$("#float_icon").css("left",posX);
    	if(posX < 1 ||posX + document.getElementById("float_icon").offsetWidth >$(window).width()){
    		dirX =-dirX;
		}
		if(posY < 1 ||posY + document.getElementById("float_icon").offsetHeight+5 >$(window).height()+200){
		dirY =-dirY;
		} 
		  
	}
    on.onmouseover=function(){ 
    	window.clearInterval(a1a);
	}; 
	
	on.onmouseout=function(){ 
          a1a =setInterval("moveIcon()",50); 
    };
	
    oneButton.onclick=function(){ 
        document.body.removeChild(on); 
    }; 
	
</script>
</body>

<script type="text/javascript">

function hf(){
	/* var doc = document.frames['topif'].document.getElementById('img1').src; */
	var src = document.getElementById('topif').contentWindow.document.getElementById('img1').src;
	var src1 =src.replace('cahg1', 'cahg2');
	document.getElementById('topif').contentWindow.document.getElementById('img1').src = src1;
	document.getElementById('topif').contentWindow.document.getElementById('page-wrap').className='blue1';
	document.body.className='body2';
	document.getElementById('topif').contentWindow.document.getElementById('hx').style="background:#fff;";
}


function getContextPath() {
    var pathName = document.location.pathname;
    var index = pathName.substr(1).indexOf("/");
    var result = pathName.substr(0,index+1);
    return result;
  }
function meetingRoom(){
	var path = getContextPath();
	var url = path+"/cahgMeetingNotice/meetingRoomPage.do";
	window.open(encodeURI(url),'newwindow','height=400,width=800,top=100,left=400%,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
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