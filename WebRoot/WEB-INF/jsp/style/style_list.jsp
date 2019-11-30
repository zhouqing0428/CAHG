<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		width: 500px; /* li 的宽度 这个控制显示多少字后显示...设的宽度大于字数时， 是不会显示...的 */
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

<link rel="stylesheet" type="text/css" href="static/css/menu_3.css">
<link href="static/css/index_6.css" rel="stylesheet" type="text/css" />
 <div id="main">
 	<iframe style="margin-top:-4px;"  class="top" frameborder="0" scrolling="no" src="index/head.do" widht="100%" height="180px;"></iframe>
    
    <div class="cen-div color mar-t">
      <div class="con_title_left fl_left">
		        <div class=" font24 padd-b">
		          <div class="list_left_title">
		            图片新闻
		          </div>
		        </div>
		        <div class="font2 dgrey"><img  src="static/picture/wz.png" class="padd-r"/>您现在的位置 :  
		<a href='index/page.do'  target="_parent">首页</a>&nbsp;>&nbsp;图片新闻列表
		</div>   
      </div>
      
      
      <div class="cen-div-1 mar-t">
         <iframe class="con-left fl" frameborder="0" scrolling="no" src="index/new_left.do?url=${url }" widht="100%"></iframe>
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
		    url:"cahgImgNews/imgNewsList.do",
		    dataType : "json", 
		    method:"post",
		    async: true,  
		    data: {curPage:curPage,title:encodeURI(title, "UTF-8")},
		    success:function(data){
		    	var html = "";
		     	for(var i=0;i<data.list.length;i++){
		    		html += '<div class="list_div mar-top2" style="display:block;">'+
		    				'<a onClick="jump('+data.list[i].img_new_id+')" href="cahgImgNews/imgNewsDetailsPage.do?img_new_id='+data.list[i].img_new_id+'" target="_blank">'+
		    				'<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">'+
		    				'<tr><td rowspan="2" style="width:150px;"><img style="width:150px;" height="120px;" src="http://10.56.65.100/file/upImg/imgNews/'+data.list[i].img_url+'"></td>'+
		    				'<td colspan="2"> <div class="list-right_title fon_1"><b id="new_title">'+data.list[i].img_new_title+'</b></div></td></tr>'+
		    				'<tr><td >'+
		    				'<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px; color:#9E9E9E;">'+
		    				'<tr><td width="60%" align="left"><b>发布时间：'+data.list[i].create_date+'</b></td>'+
		    				'<td width="40%" align="right" ><span class="column-name"><b>作者：'+data.list[i].author+'</b></span></td></tr>'+
		    				'</table></td></tr></table></a></div>';
		     	}
		     	$("#list").html(html);
		    }
		 });
		
	},{
		count:count,
		pageCount:pageCount,//总页码,默认10
		showNear:3//显示当前页码前多少页和后多少页，默认2
	}); 
	
	
	function jump(tarUrl){	    
	    var path = getContextPath();
		var url = path+"/cahgImgNews/imgNewsDetailsPage.do?img_new_id="+tarUrl;
		window.open(encodeURI(url));
	}
	
	function getContextPath() {
	    var pathName = document.location.pathname;
	    var index = pathName.substr(1).indexOf("/");
	    var result = pathName.substr(0,index+1);
	    return result;
	  }
</script>
  
</body>
</html>