<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<base href="<%=basePath%>">
<title>工作督办</title>
<link href="static/layui/css/layui.css" rel="stylesheet">
<script src="static/layui/layui.all.js"></script>
<link rel="stylesheet" type="text/css" href="static/css/menu.css">
<link href="static/css/index_6.css" rel="stylesheet" type="text/css" />
<link href="static/css/page.css" rel="stylesheet" type="text/css" />
<link href="static/css/common.css" rel="stylesheet" />
<script type="text/javascript" src="static/js/jquery.js"></script>
<script language="javascript" type="text/javascript" src="static/js/jquery.page.js"></script>
<style type="text/css">
.itemState{
height:34px;line-height:34px;width:96px;color:#fff;text-align:center;background:#c3c0c0;;display:block;border-radius:4px;
}
.itemState.curr{
	background:#7fb2d2;
}
.divcss{
  white-space:nowrap;
  overflow:hidden;
  text-overflow: ellipsis;
}
</style>
<script type="text/javascript">	
	$(document).ready(function(){
		$(".con-left a").each(function(){
			if($.trim($(this).text())==$.trim($(".div1").text())){
				$(this).addClass("linow");
			}
		})
	});
	
	
	$('.page3').createPage(function(n){
		
	},{
		pageCount:20,//总页码,默认10
		showPrev:false,//是否显示上一页按钮
		showNext:false,//是否显示下一页按钮
		showTurn:false,//是否显示跳转,默认可以
		showNear:4,//显示当前页码前多少页和后多少页，默认2
		showSumNum:false//是否显示总页码
	},{
		"color":"#0f0",//字体颜色
		"borderColor":"#00f",//边线颜色
		"currentColor":"#ed601b"//当前页码的字体颜色
	});
</script>
</head>
<body>
 <div id="main">
 	<!-- <iframe class="top" id="topif" name="topif" frameborder="0" scrolling="no" src="index/head.do" widht="100%" height="280px;"></iframe> -->
  	<div class="top"></div>
    <div class="cen-div color mar-t">
      <div class="con_title_left fl_left">
		        <div class=" font24 padd-b">
		          <div class="list_left_title">
		           工作督办
		          </div>
		        </div>
		        <div class="font2 dgrey"><img  src="static/picture/wz.png" class="padd-r"/>您现在的位置 :  
		<a href='index/page.do'  target="_parent">首页</a>&nbsp;>&nbsp;工作督办列表
		</div>   
      </div>
      <div class="cen-div-1 mar-t">
        <dl class="con-left fl"></dl>
        <!-- <iframe class="con-left fl" frameborder="0" scrolling="no" src="index/new_left.do?url=${url }" widht="100%"></iframe>  -->
        <div class="con-right fr mar-l-2">
        <table style="width:100%;font-size:20px;margin:15px auto"><tr>
        	<td align="center">
	        	<c:if test="${empty status}">
        		<a class="itemState curr" href="cahgJob/jobListPage.do">全部</a>
	        	</c:if>
	        	<c:if test="${not empty status}">
        		<a class="itemState" href="cahgJob/jobListPage.do">全部</a>
	        	</c:if>
        	</td>
        	<td align="center">
        		<c:if test="${not empty status and status eq 0}">
        		<a class="itemState curr" href="cahgJob/jobListPage.do?status=0">未办结</a>
        		</c:if>
        		<c:if test="${empty status or status eq 2}">
        		<a class="itemState" href="cahgJob/jobListPage.do?status=0">未办结</a>
        		</c:if>
        	</td>
        	<td align="center">
        		<c:if test="${not empty status and status eq 2}">
        		<a class="itemState curr" href="cahgJob/jobListPage.do?status=2">已办结</a>
        		</c:if>
        		<c:if test="${empty status or status eq 0}">
        		<a class="itemState" href="cahgJob/jobListPage.do?status=2">已办结</a>
        		</c:if>
        	</td>
        </tr></table>
 			<div id="list">
 				
 			</div>
 			
 			<div class="page"  style="width:100%; margin-top:50px;"></div> 
        </div>
      </div>
    </div>
        <iframe class="bot"  frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes" src="index/bottom.do" widht="100%" ></iframe>
    
  </div> 
  
<script>
getSlideMenu()
	function getSlideMenu(){
		var url = "${url }"
			
		$.ajax({
		    url:"index/new_left.do?url="+url,
		    dataType : "html", 
		    method:"post",
		    async: true,  
		    data: {},
		    contentType: "application/x-www-form-urlencoded; charset=utf-8", 
		    success:function(data){
		    	$(".con-left").html(data);
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
	var pageCount = '${pageCount}';
	var count = '${count}';
	var title = '${title}';
	var status = '${status}';
	$('.page').createPage(function(curPage){
		$.ajax({
		    url:"cahgJob/jobList.do",
		    dataType : "json", 
		    method:"post",
		    async: true,  
		    data: {curPage:curPage,title:encodeURI(title, "UTF-8"),status:status},
		    success:function(data){
		    	var html = "";
		     	for(var i=0;i<data.list.length;i++){
		    		html += "<div class='list_div mar-top2 '>" +
		    				"<a href='cahgJob/jobDetailsShow.do?job_id="+data.list[i].job_id+"' target='_blank'  >"+
		    				" <div class='list-right_title fon_1'><b id='new_title'>"+data.list[i].title+"</b></div>" +
		    				" <table width='98%' border='0' align='center' cellpadding='0' cellspacing='0' style='margin-top:10px; color:#9E9E9E;table-layout: fixed;'>" +
		    				" <td width='70%' align='left' class='divcss'><b>发布时间："+data.list[i].create_date;
    				if(data.list[i].deptName !=undefined && data.list[i].deptName != null){
    					html +="&nbsp;&nbsp;经办科室："+data.list[i].deptName;
    				}
    				html +="</b></td>"+
		    				"<td width='30%' align='right' ><span class='column-name'><b>时限："+data.list[i].end_time+"</b></span></td>"+
		    				"</tr></table></a></div>";
		    	}
		     	$("#list").html(html);
		    }
		 });
		
	},{
		count:count,
		pageCount:pageCount,//总页码,默认10
		showNear:3//显示当前页码前多少页和后多少页，默认2
	});
</script>
  
</body>
</html>