
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

<style type="text/css">
#roll {
  width:100px;
  height:100px;
  background-color:green;
  color:#fff;
  position:absolute;
  font-size:12px;
  text-align:center;
  line-height:100px;
}
.scrollPic{
	overflow:hidden;
	width:1000px;
	height:60px;
	margin:20px auto;
}
.scrollName{
	float:left;
	width:90px;
	height:60px;
	line-height:30px;
	padding:0 5px;
	text-align:center;
	overflow:hidden;
	font-size:30px;
	font-weight:bold;
	color:#ff6000;
}
#scrollBox{
	position: relative;
	width: 900px;
	height: 60px;
	overflow: hidden;
	float:left;
}
#scrollBox ul{
	position: absolute;
	left: 0;
}
#scrollBox ul li{
	list-style: none;
	width: 130px;
	height: 60px;
	float: left;
	margin-right:20px;
}
#scrollBox ul li img{
	width: 100%;
	height: 100%;
}


	  #new_title{  
		display: block;
		width: 350px; /* li 的宽度 这个控制显示多少字后显示...设的宽度大于字数时， 是不会显示...的 */
		overflow: hidden;  /*溢出隐藏*/
	    text-overflow: ellipsis; /*以省略号...显示*/
	    white-space: nowrap;  /*强制不换行*/
	    float:left;
	  }
	   #leaderSpeechList{  
		display: block;
		width: 200px; /* li 的宽度 这个控制显示多少字后显示...设的宽度大于字数时， 是不会显示...的 */
		overflow: hidden;  /*溢出隐藏*/
	    text-overflow: ellipsis; /*以省略号...显示*/
	    white-space: nowrap;  /*强制不换行*/
	    float:left;
	  } 
	  #officePostList{
	  display: block;
		width: 480px; /* li 的宽度 这个控制显示多少字后显示...设的宽度大于字数时， 是不会显示...的 */
		overflow: hidden;  /*溢出隐藏*/
	    text-overflow: ellipsis; /*以省略号...显示*/
	    white-space: nowrap;  /*强制不换行*/
	    float:left;
	  }
	   #meeting{  
		display: block;
		width: 235px; /* li 的宽度 这个控制显示多少字后显示...设的宽度大于字数时， 是不会显示...的 */
		overflow: hidden;  /*溢出隐藏*/
	    text-overflow: ellipsis; /*以省略号...显示*/
	    white-space: nowrap;  /*强制不换行*/
	    float:left;
	  } 
	  
	  #afficheList{
	 	 display: block;
		width: 190px; /* li 的宽度 这个控制显示多少字后显示...设的宽度大于字数时， 是不会显示...的 */
		overflow: hidden;  /*溢出隐藏*/
	    text-overflow: ellipsis; /*以省略号...显示*/
	    white-space: nowrap;  /*强制不换行*/
	    float:left;
	  }
	  #imptWorkList{
	  	display: block;
		width: 390px; /* li 的宽度 这个控制显示多少字后显示...设的宽度大于字数时， 是不会显示...的 */
		overflow: hidden;  /*溢出隐藏*/
	    text-overflow: ellipsis; /*以省略号...显示*/
	    white-space: nowrap;  /*强制不换行*/
	    float:left;
	  }
	  
	   #imptWorkList2{
	  	display: block;
		width: 350px; /* li 的宽度 这个控制显示多少字后显示...设的宽度大于字数时， 是不会显示...的 */
		overflow: hidden;  /*溢出隐藏*/
	    text-overflow: ellipsis; /*以省略号...显示*/
	    white-space: nowrap;  /*强制不换行*/
	    float:left;
	  }
	 #imgTitle{
		width: 150px; /* li 的宽度 这个控制显示多少字后显示...设的宽度大于字数时， 是不会显示...的 */
		display:block;
		white-space:nowrap; 
		overflow:hidden; 
		text-overflow:ellipsis;
		float:left;
	  }
	#indexJobList{
		display: block;
		width: 350px; /* li 的宽度 这个控制显示多少字后显示...设的宽度大于字数时， 是不会显示...的 */
		overflow: hidden;  /*溢出隐藏*/
	    text-overflow: ellipsis; /*以省略号...显示*/
	    white-space: nowrap;  /*强制不换行*/
	    float:left;
	}
	
	#indexJobList2{
		display: block;
		width: 380px; /* li 的宽度 这个控制显示多少字后显示...设的宽度大于字数时， 是不会显示...的 */
		overflow: hidden;  /*溢出隐藏*/
	    text-overflow: ellipsis; /*以省略号...显示*/
	    white-space: nowrap;  /*强制不换行*/
	    float:left;
	}
	
	.btnw:hover{
		background-color:#4985C6;
	}
/* 	.zhuanti{background: url('static/images/test4.jpg') no-repeat center;}  */
/* 	.zhuanti{background-color: red} */
</style>
			
<!-- <iframe class="top" id="topif" name="topif" frameborder="0" scrolling="no" src="index/head.do" widht="100%" height="280px;"></iframe> -->
  <div class="top"></div>
  <div class="index-main clearfix">
	<!--图片新闻-->
    <div class="focusBox fl">
			  <ul class="pic">
				<c:forEach items="${imgNewsList}" var="ele">
			   			<li><a target="_blank" href="cahgImgNews/imgNewsDetailsPage.do?img_new_id=${ele.img_new_id }"  title="${ele.img_new_title }"><img src="http://10.56.65.100/file/upImg/imgNews/${ele.img_url }" /></a></li>
			   	</c:forEach>
			</ul>
			<div class="txt-bg"></div>
			<div class="txt">
				<ul>
					<c:forEach items="${imgNewsList}" var="ele">
			   			<li><a target="_blank" id="imgTitle" href="cahgImgNews/imgNewsDetailsPage.do?img_new_id=${ele.img_new_id }"  title="${ele.img_new_title }">
			   			<c:if test="${ele.img_news_stick eq 1 }">
			   			<img src="static/images/fire.png" width="20px" height="20px" style="margin-top:-5px;margin-right:-5px;"/>
			   			</c:if>
			   			${ele.img_new_title }
			   			</a></li>
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
        	<a href="cahgDayInfo/dayInfoListPage.do" target="_blank" class="fr fm1">更多>></a>
            <ul><li>每日信息</li></ul>
        </div>
        <div class="bd">
            <ul class="newsList">
            	<c:forEach items="${dayInfoList}" var="ele"><!--每日信息  -->
	              <li>
	                <fmt:parseDate var="systemDate" value="${sysDate}" pattern="yyyy-MM-dd HH:mm:ss" /><!-- 把java取来的系统当前时间格式化 -->
	                <fmt:parseDate var="create_date" value="${ele.create_date}" pattern="yyyy-MM-dd HH:mm:ss" /><!-- 把数据对应的时间格式化 -->
	                <c:set var="timeMis" value="${systemDate.time - create_date.time}"/><!-- 比较当前时间和数据时间的时差  毫秒 -->
					<c:set var="imgShow"><fmt:formatNumber value="${timeMis/1000/3600}" pattern="#0.0"/></c:set><!-- 转化为天数保存在imgShow -->               
	                <a href="cahgDayInfo/dayInfoDetailsPage.do?day_id=${ele.day_id}" target="_blank" title='${ele.day_title}'>
	                <span id="new_title">
	                <c:if test="${ele.day_stick eq 1 }">
			   			<img src="static/images/fire.png" width="20px" height="20px" style="margin-top:-7px;margin-right:-5px;"/>
		   			</c:if>
	                ${ele.day_title}
	                </span>
	                <c:if test="${imgShow <= 24.0 }"><!-- 判断是否显示 -->
						<img style="margin-top:-19px; float:right;" src="static/images/new.gif">
	              	</c:if>
	                </a>
	              </li>
				</c:forEach>
            </ul>
        </div>
	</div>
    <!--领导讲话-->
    <div class="yqg border fr slideTxtBox" style="border:1px solid #CCC">
		<div class="hd">
			<a href="leaderSpeech/leaderSpeechListPage.do?type=2" target="_blank" class="fm1 fr">更多>></a>
		    <ul><li style="cursor:pointer; ">总关领导讲话</li><li style="cursor:pointer; ">本关领导讲话</li></ul>
		</div>
		<div class="bd">
			<ul class="newsList">
			 <c:forEach items="${leaderSpeechList }" var="ele">
				<li >
					<a  href="leaderSpeech/leaderSpeechDetailsPage.do?leader_speech_id=${ele.leader_speech_id}" title='${ele.title }' target="_blank">
						<span id="leaderSpeechList">${ele.title }</span>
						<!--  <span style="color:#999;float:right;height:28px;line-height:28px;font-size:12px;">[${ele.create_date_show }]</span>-->
					</a>
				</li>
			</c:forEach>
			</ul>
			<ul class="newsList">
			    <c:forEach items="${indexLeaderBSpeechList }" var="ele">
				<li>
					<a href="leaderSpeech/leaderSpeechDetailsPage.do?leader_speech_id=${ele.leader_speech_id}" title='${ele.title }' target="_blank">
						<span id="leaderSpeechList">${ele.title }</span>
						<!--  <span style="color:#999;float:right;height:28px;line-height:28px;font-size:12px;">[${ele.create_date_show }]</span>-->
					</a>
				</li>
			</c:forEach>
			</ul>
		</div>
    </div>    
        <!--入园企业-->
     <!--会议通知-->
    	<div class="slideTxtBox zhengce fl mt10" style="border:1px solid #CCC">
        <div class="hd">
     	   <a href="cahgMeetingNotice/meetingNoticeListPage.do" target="_blank" target="_blank" class="fr fm1">更多>></a>
            <ul><li>会议通知</li></ul>
        </div>
        <div class="bd" style="height:218px;overflow:hidden;">
            <ul class="newsList">
            <c:forEach items="${meetingNoticeList }" var="ele">
          			<li style="line-height:20px;">
          			<fmt:parseDate var="systemDate" value="${sysDate}" pattern="yyyy-MM-dd HH:mm:ss" /><!-- 把java取来的系统当前时间格式化 -->
		                 <fmt:parseDate var="create_date" value="${ele.create_date}" pattern="yyyy-MM-dd HH:mm:ss" /><!-- 把数据对应的时间格式化 -->
		                 <c:set var="timeMis" value="${systemDate.time - create_date.time}"/><!-- 比较当前时间和数据时间的时差  毫秒 -->
						 <c:set var="imgShow"><fmt:formatNumber value="${timeMis/1000/3600}" pattern="#0.0"/></c:set><!-- 转化为天数保存在imgShow -->
	               	 	<a href="cahgMeetingNotice/meetingNoticeDetailsPage.do?meeting_notice_id=${ele.meeting_notice_id }" target="_blank" title='${ele.title }'>
		               	 	<span  id="meeting">
		               	 		${ele.title }
		               	 		<c:if test="${imgShow <= 24.0 }"><!-- 判断是否显示 -->
									<img style="margin-top:-12px;" src="static/images/new.gif">
				               	</c:if>
		               	 	</span>
	               	 	<%-- <span style="color:#999;float:right;margin-top:-18px;">[${ele.create_date_show }]</span> --%>
	               	 	
	               	 	</a>
	            	</li>
          		</c:forEach>
            </ul>
        </div>
        <a href="javascript:void(0)" onclick="meetingRoom()" style="float:right;" class="easyui-linkbutton" data-options="iconCls:'icon-search'" style="width:100px">会议申请</a>
    </div>
    
    <!--本办发文-->
    <div class="slideTxtBox  fl ml8 mt10" style="height:290px;border:1px solid #CCC">
        <div class="hd">
        	<a href="cahgOfficePost/officePostListPage.do" target="_blank" class="fr fm1">更多>></a>
            <ul><li>本关发文</li></ul>
        </div>
        <div class="bd">
            <ul class="newsList">
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
    <div class="slideTxtBox xgxz fr mt10" style="border:1px solid #CCC">
        <div class="hd">
        	<a href="cahgAffiche/afficheListPage.do" target="_blank" class="fr fm1">更多>></a>
            <ul><li>公示公告</li></ul>
        </div>
        <div class="bd">
            <ul class="newsList">
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
			<a href="cahgImptWork/imptWorkListPage.do" target="_blank" class="fr fm1">更多>></a>
		    <ul><li>重点工作</li></ul>
		</div>
		<div class="bd" >
		    <ul style="list-style:none;">
			<c:forEach items="${workTableType }" var="ele" >
				<%-- <li   style="background-image:url(static/images/worktable.jpg);background-size:cover;height:30px; width:220px; border:1px solid #CCC;margin:8px;" >
				      <a    style="font-size:15px;height:100%;width:100%;;line-height:30px; "  href="cahgWorkTable/workTableListPage.do?work_table_category_id=${ele.work_table_category_id }"  target="_blank">${ele.name }</a>
				</li> --%>
				<li style="background:#f6d05a url(static/images/${ele.img }) 10px center no-repeat;background-size:auto 22px;height:30px;line-height:30px;width:246px;padding-left:40px;margin-bottom:8px;border-radius:20px;" >
					<a style="color:#fff;" href="cahgWorkTable/workTableListPage.do?work_table_category_id=${ele.work_table_category_id }">${ele.name }</a>
				</li>
			</c:forEach>
	        </ul>
	    </div>
	</div>
    
    <!--工作督办-->
        <div class="slideTxtBox qy-news fl ml8 mt10" style="border:1px solid #CCC">
            <div class="hd">
            	<a href="cahgJob/jobListPage.do" target="_blank" class="fr fm1">更多>></a>
                <ul><li>工作督办</li></ul>
            </div>
            <div class="bd">
                <ul class="newsList">
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
            	<a href="javascript:void(0)" target="_blank" class="fr fm1">更多>></a>
                <ul><li>违纪曝光</li></ul>
            </div>
			<div class="bd">
				<ul class="newsList">
					<li><a href="javascript:void(0)">测试数据</a></li>
					<li><a href="javascript:void(0)">测试数据</a></li>
					<li><a href="javascript:void(0)">测试数据</a></li>
					<li><a href="javascript:void(0)">测试数据</a></li>
					<li><a href="javascript:void(0)">测试数据</a></li>
					<li><a href="javascript:void(0)">测试数据</a></li>
				</ul>
               <!--  <ul style="padding:5px 15px;" >
				    <li style="background:#f6d05a url(static/images/bg1.png) 10px center no-repeat;background-size:auto 22px;height:28px;line-height:28px;width:220px;padding-left:40px;margin-bottom:5px;border-radius:20px;" >
						<a style="color:#fff;" href="dept/dept_left.do">制度建设</a>
					</li>
					<li style="background:#f6d05a url(static/images/bg3.png) 10px center no-repeat;background-size:auto 22px;height:28px;line-height:28px;width:220px;padding-left:40px;margin-bottom:5px;border-radius:20px;" >
						<a style="color:#fff;" href="cahgDutySchedule/dutyDetailsShow.do?type=1">值班安排</a>
					</li>
					<li style="background:#f6d05a url(static/images/bg4.png) 10px center no-repeat;background-size:auto 22px;height:28px;line-height:28px;width:220px;padding-left:40px;margin-bottom:5px;border-radius:20px;" >
						<a style="color:#fff;" href="http://10.56.65.252/baozhang/index.aspx">技术报障</a>
					</li>
					<li style="background:#f6d05a url(static/images/bg5.png) 10px center no-repeat;background-size:auto 22px;height:28px;line-height:28px;width:220px;padding-left:40px;margin-bottom:5px;border-radius:20px;" >
						<a style="color:#fff;" href="http://10.56.65.71/assetmaintain/">物业报障</a>
					</li>
					<li style="background:#f6d05a url(static/images/bg6.png) 10px center no-repeat;background-size:auto 22px;height:28px;line-height:28px;width:220px;padding-left:40px;margin-bottom:5px;border-radius:20px;" >
						<a style="color:#fff;" href="http://10.56.2.241/jsp/changan_index.jsp">后勤保障</a>
					</li>
					<li style="background:#f6d05a url(static/images/bg2.png) 10px center no-repeat;background-size:auto 22px;height:28px;line-height:28px;width:220px;padding-left:40px;margin-bottom:5px;border-radius:20px;" >
						<a style="color:#fff;" href="commomForm/commomFormsListPage.do?type=0">常用表格下载</a>
					</li>
                </ul> -->
            </div>
        </div>
    <div class="slideTxtBox zhengce fl mt10" style="height:280px;border:1px solid #CCC">
        <div class="hd">
        	<a href="cahgActivityNotice/activityNoticeListPage.do" target="_blank" class="fr fm1">更多>></a>
            <ul>
            	<li>活动通知</li>
            </ul>
        </div>
        <div class="bd">
       		<ul class="newsList">
        		<c:forEach items="${noticeList }" var="ele" varStatus="index">
	        		<li><a id="indexNoticeList" href="cahgActivityNotice/activityNoticeInfo.do?id=${ele.id}" title="${ele.title }" target="_blank"><span id="meeting">${ele.title }</span></a></li>
	            </c:forEach>
           	</ul>
        </div>
    </div>
     <div class="slideTxtBox qy-news fl ml8 mt10" style="height:280px;border:1px solid #CCC">
            <div class="hd">
            	<a href="cahgCustomNews/customNewsListPage.do" target="_blank" class="fr fm1">更多>></a>
                <ul><li>海关新闻</li></ul>
            </div>
            <div class="bd">
                <ul class="newsList">
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
        	<a href="" class="fr fm1">更多>></a> 
            <ul><li>长安风采</li></ul>
        </div>
        <div class="bd">
                <ul class="newsList">
					<li><a href="javascript:void(0)">测试数据</a></li>
					<li><a href="javascript:void(0)">测试数据</a></li>
					<li><a href="javascript:void(0)">测试数据</a></li>
				</ul>
        </div>
      </div>
    </div>
    <div id="roll">
    	<c:if test="${not empty floatNews}">
    	<a target="_blank" href="cahgFloatNews/floatNewsDetailsPage.do?float_new_id=${floatNews.float_new_id }"  title="${ele.img_new_title }">
    		<img src="/file/upFloat/floatNews/${floatNews.float_url }" height="50" width="100" />
    	</a>
    	</c:if>
    </div>
	<div class="scrollPic">
		<div class="scrollName">专题专栏</div>
		<div id="scrollBox">
			<ul>
				<c:forEach items="${cahgSpecialTopicList }" var="ele" varStatus="index">
        		<li><a href="cahgSpecialTopic/specialTopicListPage.do?url=${ele.special_topic_category_id }" title="${ele.name }" target="_blank"><img src="file/upImg/topiCategory/${ele.img_name }"></a></li>
	            </c:forEach>
			</ul>
		</div>
	</div>
<iframe class="bot" frameborder="0" scrolling="no" src="index/bottom.do" width="100%" height="100%"></iframe>
</body>

<script type="text/javascript">

function hf(){
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
function getHeader(){
	$.ajax({
	    url:"index/head.do",
	    dataType : "html", 
	    method:"post",
	    async: true,  
	    data: {},
	    contentType: "application/x-www-form-urlencoded; charset=utf-8", 
	    success:function(data){
	    	$(".top").html(data);
	    }
	 });
}
getHeader();
</script>
<script type="text/javascript">
var interval=null;
var ggRoll=null;
function floatAd(){
  ggRoll={
    roll:document.getElementById("roll"),
    speed:20,
    statusX:1,
    statusY:1,
    x:100,
    y:300,
    winW:document.documentElement.clientWidth-document.getElementById("roll").offsetWidth,
    winH:document.documentElement.clientHeight-document.getElementById("roll").offsetHeight,
    Go:function(){
      this.roll.style.left = this.x + 'px';
      this.roll.style.top = this.y + 'px';
      this.x = this.x + (this.statusX ? -1 : 1)
      if(this.x < 0) { this.statusX = 0 }
      if(this.x > this.winW) { this.statusX = 1 }
      this.y=this.y + (this.statusY ? -1 : 1)
      if(this.y < 0) { this.statusY = 0 }
      if (this.y > this.winH) { this.statusY = 1 }
    }
  }
  interval=setInterval(function(){ggRoll.Go()},ggRoll.speed);
  ggRoll.roll.onmouseover=function(){clearInterval(interval)};
  ggRoll.roll.onmouseout=function(){interval=setInterval(function(){ggRoll.Go()},ggRoll.speed)};
}
floatAd();
function startScroll(){
	var oDiv = document.getElementById('scrollBox');
	var oUl = oDiv.getElementsByTagName('ul')[0];
	var aLi = oUl.getElementsByTagName('li');
	var iSpeed = 1;//正左负右
	var timer = null;
	//计算ul的宽为所有li的宽的和;
	oUl.innerHTML += oUl.innerHTML+oUl.innerHTML;
	oUl.style.width = aLi[0].offsetWidth*aLi.length+'px';
	function Slider(){
		if (oUl.offsetLeft<-oUl.offsetWidth/2) {
			oUl.style.left = 0;
		}else if(oUl.offsetLeft>0){
			oUl.style.left =-oUl.offsetWidth/2+'px';
		}
		oUl.style.left = oUl.offsetLeft-iSpeed+'px';//正负为方向
	}
	timer =setInterval(Slider,30);
	oDiv.onmouseover = function(){
		clearInterval(timer);
	}
	oDiv.onmouseout = function(){
		timer =setInterval(Slider,30);
	}
};
startScroll();
</script>
<script src="static/js/all.js" type="text/javascript"></script>
</html>