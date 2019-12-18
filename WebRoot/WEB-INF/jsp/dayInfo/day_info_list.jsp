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
<title>每日信息</title>
<link rel="stylesheet" type="text/css" href="static/css/menu.css">
<link href="static/css/index_6.css" rel="stylesheet" type="text/css" />
<link href="static/css/page.css" rel="stylesheet" type="text/css" />
<link href="static/css/common.css" rel="stylesheet" />
<link href="static/layui/css/layui.css" rel="stylesheet">
<script src="static/layui/layui.all.js"></script>
<style type="text/css">
#new_title{  
	display: block;
	width: 600px; /* li 的宽度 这个控制显示多少字后显示...设的宽度大于字数时， 是不会显示...的 */
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

 <div id="main">
 	<!-- <iframe class="top" id="topif" name="topif" frameborder="0" scrolling="no" src="index/head.do" widht="100%" height="280px;"></iframe> -->
  	<div class="top"></div>
    <div class="cen-div color mar-t">
      <div class="con_title_left fl_left">
        <div class=" font24 padd-b">
          <div class="list_left_title">
            	每日信息
          </div>
        </div>
        <div class="font2 dgrey"><img  src="static/picture/wz.png" class="padd-r"/>您现在的位置 :  
		<a href='index/page.do'  target="_parent">首页</a>&nbsp;>&nbsp;每日信息列表
		</div>   
      </div>
      
      <div class="cen-div-1 mar-t">
        <%-- <iframe class="con-left fl" frameborder="0" scrolling="no" src="index/new_left.do?url=${url}" widht="100%"></iframe> --%>
        <dl class="con-left fl"></dl>
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

	function delimiterConvert(val){ //格式话数据  
		  return val.replace('-','/').replace('-','/')  
	}
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
	$('.page').createPage(function(curPage){
		$.ajax({
		    url:"cahgDayInfo/dayInfoList.do",
		    dataType : "json", 
		    method:"post",
		    async: true,  
		    contentType: "application/x-www-form-urlencoded; charset=utf-8", 
		    data: {curPage:curPage,title:encodeURI(title, "UTF-8")},
		    success:function(data){
		    	var html = "";
		    
		     	for(var i=0;i<data.list.length;i++){
		     		
		     		var img = "";
		     		var timestamp = Date.parse(new Date());
		     		timestamp = timestamp/1000/3600/24;
		     		
		     		var stringTime = data.list[i].create_date;
		     		var timestamp2 = Date.parse(new Date(delimiterConvert(stringTime)));
		     		timestamp2 = timestamp2/1000/3600/24;
		     		
		     		if(timestamp - timestamp2 < 1) // > one day
		     		{
		     			img = "<img style='float:left;margin-top:14px;' src='static/images/new.gif'>";
		     		} 
		     		
		    		html += "<div class='list_div mar-top2 '>" +
		    				"<a href='cahgDayInfo/dayInfoDetailsPage.do?day_id="+data.list[i].day_id+"' target='_blank'  >"+
		    				"  <div class='list-right_title fon_1'><b style='float:left' id='new_title'>";
		    		if(data.list[i].day_stick == 1){
    					html += "<font color='red' style='font-weight: bold;'><i>采用</i></font>&nbsp;&nbsp;";
    				}
    				html += data.list[i].day_title+"</b>"+img+"</div>" +
		    				" <table width='98%' border='0' align='center' cellpadding='0' cellspacing='0' style='margin-top:10px; color:#9E9E9E;'><tr>" +
		    				" <td width='50%' align='left'><span>发布时间："+data.list[i].create_date+"</span></td>" +
		    				"<td width='50%' align='right' ><span class='column-name'><b>作者："+data.list[i].author+"</b></span></td>"+
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