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
<title></title>
<link href="static/css/index.css" rel="stylesheet"/>
<link href="static/css/page.css" rel="stylesheet" type="text/css" />
<link href="static/css/common.css" rel="stylesheet" />
<style type="text/css">
#new_title{  
		display: block;
		width: 700px; /* li 的宽度 这个控制显示多少字后显示...设的宽度大于字数时， 是不会显示...的 */
		overflow: hidden;
		white-space: nowrap;
		-o-text-overflow: ellipsis;
		text-overflow: ellipsis;
	  }  
</style>
<script type="text/javascript" src="static/js/jquery.js"></script>
<script language="javascript" type="text/javascript" src="static/js/jquery.page.js"></script>
<script type="text/javascript">	
	$(document).ready(function(){
		$(".con-left a").each(function(){
			if($.trim($(this).text())==$.trim($(".div1").text())){
				$(this).addClass("linow");
			}
		})
	});
	
	
	
</script>
</head>
<body>

<link rel="stylesheet" type="text/css" href="static/css/menu_3.css">
<link href="static/css/index_6.css" rel="stylesheet" type="text/css" />
 <div id="main">
 	<iframe style="margin-top:-4px;"  class="top" frameborder="0" scrolling="no" src="index/head.do" widht="100%" height="180px;"></iframe>
    
    <div class="cen-div color mar-t">
      <div class="con_title_left fl_left">
		        <div class=" font24 padd-b">
		          <div class="list_left_title">
		           本关发文
		          </div>
		        </div>
		        <div class="font2 dgrey"><img  src="static/picture/wz.png" class="padd-r"/>您现在的位置 :  
		<a href='index/page.do'  target="_parent">首页</a>&nbsp;>&nbsp;本关发文列表
		</div>   
      </div>
      <div class="cen-div-1 mar-t">
        <iframe class="con-left fl" frameborder="0" scrolling="no" src="index/new_left.do?url=${url}" widht="100%"></iframe>
        <div class="con-right fr mar-l-2">
 			<div id="list">
 			</div>
 			<div class="page"  style="width:100%; margin-top:50px;"></div> 
        </div>
      </div>		
    </div>
        <iframe class="bot"  frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes" src="index/bottom.do" widht="100%" ></iframe>
    
  </div> 
   
<script>
	var pageCount = '${pageCount}';
	var count = '${count}';
	var title = '${title}';
	$('.page').createPage(function(curPage){
		$.ajax({
		    url:"cahgOfficePost/officePostList.do",
		    dataType : "json", 
		    method:"post",
		    async: true,  
		    data: {curPage:curPage,title:encodeURI(title, "UTF-8")},
		    success:function(data){
		    	var html = "";
		     	for(var i=0;i<data.list.length;i++){
		    		html += "<div class='list_div mar-top2 '>" +
		    				"<a href='cahgOfficePost/officePostDetailsPage.do?office_post_id="+data.list[i].office_post_id+"' target='_blank'  >"+
		    				"<div class='list-right_title fon_1'><b id='new_title'>"+data.list[i].title+"</b></div>" +
		    				"<table width='98%' border='0' align='center' cellpadding='0' cellspacing='0' style='margin-top:10px; color:#9E9E9E;'>" +
		    				"<td width='50%' align='left'><b>发布时间："+data.list[i].create_date+"</b></td>" +
		    				"<td width='50%' align='right' ><span class='column-name'><b>发布人："+data.list[i].author+"</b></span></td>"+
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