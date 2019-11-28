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
<title>办事处简介</title>

<link href="static/css/index_6.css" rel="stylesheet" type="text/css" />
<link href="static/css/page.css" rel="stylesheet" type="text/css" />
<link href="static/css/common.css" rel="stylesheet" />
<script type="text/javascript" src="static/js/jquery.js"></script>

<link rel="stylesheet" type="text/css" href="static/js/easyui/themes/default/easyui.css">
<script type="text/javascript" src="static/js/easyui/jquery.min.js"></script>
<script type="text/javascript" src="static/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="static/js/easyui/locale/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" type="text/css" href="static/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="static/css/menu.css">
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
         	   基本概况
          </div>
        </div>
        <div class="font2 dgrey">
        	<img  src="static/picture/wz.png" class="padd-r"/>您现在的位置 :  
        	<a href='index/page.do'  target="_parent">首页</a>&nbsp;>&nbsp;基本概况
		</div>   
      </div>
      <div class="cen-div-1 mar-t">
       	<dl class="con-left fl">
       		<dt>简介</dt>
			<dd class="curr">
				<a href="cahgIntro/toIntroPage.do" target="_parent" title='基本概况' >基本概况</a>
			</dd>
			<dd>
				<a href="dept/dept_left.do" target="_parent" title='制度建设'>制度建设</a>
			</dd>
			<dd>
				<a href="cahgIntro/toIntroPage2.do" target="_parent" title='工作亮点' >工作亮点</a>
			</dd>
       	</dl>
        <div class="con-right fr mar-l-2">
        <div class="page" style="width:100%; margin-top:50px;">
			<h2 align="center">基本概况</h2>
			<div style="overflow:hidden;">${introMap.content}</div>
 		</div>
        </div>
      </div>	
    </div>
    <iframe class="bot"  frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes" src="index/bottom.do" widht="100%" ></iframe>
    
  </div> 
   
<script>
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
  
 
  
</body>
</html>