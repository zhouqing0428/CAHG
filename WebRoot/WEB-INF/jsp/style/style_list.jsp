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

<link rel="stylesheet" type="text/css" href="static/css/menu.css">
<link href="static/css/index_6.css" rel="stylesheet" type="text/css" />
<link href="static/css/page.css" rel="stylesheet" type="text/css" />
<link href="static/css/common.css" rel="stylesheet" />
<link href="static/layui/css/layui.css" rel="stylesheet">
<script src="static/layui/layui.all.js"></script>
<style type="text/css">
#style_list{  
	overflow:hidden;
	padding-top:40px;
} 
#style_list li{
	width:150px;
	height:185px;
	overflow:hidden;
	margin-right:50px;
	margin-bottom:20px;
	float:left;
} 
#style_list li:nth-of-type(4n+4){
	margin-right:0px;
}
#style_list li img{
	width:150px;
	height:150px;
	display:block;
}
#style_list li strong{
	font-weight:normal;
	font-size:14px;
	height:30px;
	line-height:30px;
	text-align:center;
	display:block;
	overflow:hidden;
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
		            长安风采
		          </div>
		        </div>
		        <div class="font2 dgrey"><img  src="static/picture/wz.png" class="padd-r"/>您现在的位置 :  
		<a href='index/page.do'  target="_parent">首页</a>&nbsp;>&nbsp;长安风采列表
		</div>   
      </div>
      
      
      <div class="cen-div-1 mar-t">
        <dl class="con-left fl"></dl>
        <!-- <iframe class="con-left fl" frameborder="0" scrolling="no" src="index/new_left.do?url=${url }" widht="100%"></iframe>  -->
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
		    url:"cahgStyle/styleList.do",
		    dataType : "json", 
		    method:"post",
		    async: true,  
		    data: {curPage:curPage,title:encodeURI(title, "UTF-8")},
		    success:function(data){
		    	var html = "<ul id='style_list'  class='style_list'>";  //data.list[i].style_id   /file/upStyle/style/'+data.list[i].style_url+' data.list[i].create_date  data.list[i].style_title
		     	for(var i=0;i<data.list.length;i++){//src="http://10.56.65.100/file/upStyle/style/'
		    		html += "<li>";
		    		html += '<img onerror="this.src=\'static/images/jiazai.gif\'" alt="'+ data.list[i].style_title +'" layer-pid="'+data.list[i].style_id+'" layer-src="/file/upStyle/style/'+data.list[i].style_url+'" src="/file/upStyle/style/'+data.list[i].style_url+'" />'
		    		html += '<strong>'+ data.list[i].style_title +'</strong>'
		    		html += "</li>";
		     	}
		     	$("#list").html(html);
		     	layui.layer.photos({
	     		  photos: '#style_list'
	     		  ,anim: 5 //0-6的选择，指定弹出图片动画类型，默认随机（请注意，3.0之前的版本用shift参数）
	     		}); 
		    }
		 });
		
	},{
		count:count,
		pageCount:pageCount,//总页码,默认10
		showNear:3//显示当前页码前多少页和后多少页，默认2
	}); 
	
	
	function jump(tarUrl){	    
	    var path = getContextPath();
		var url = path+"/cahgStyle/styleDetailsPage.do?style_id="+tarUrl;
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