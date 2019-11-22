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
<link href="static/css/index.css" rel="stylesheet"/>
<link href="static/css/page.css" rel="stylesheet" type="text/css" />
<link href="static/css/common.css" rel="stylesheet" />
<script type="text/javascript" src="static/js/jquery.js"></script>

<link rel="stylesheet" type="text/css" href="static/js/easyui/themes/default/easyui.css">
<script type="text/javascript" src="static/js/easyui/jquery.min.js"></script>
<script type="text/javascript" src="static/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="static/js/easyui/locale/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" type="text/css" href="static/js/easyui/themes/icon.css">
<script language="javascript" type="text/javascript" src="static/js/jquery.page.js"></script>
<style type="text/css">
li a{
corlor:#333;
line-height:33px;
border-bottom:1px solid #b5b5b5;
border-top:1px solid #b5b5b5;
border-right:1px solid #b5b5b5;
border-left:1px solid #b5b5b5;
background: url('static/images/tubiao1.png') 10px 8px no-repeat;
padding-right:10px;
padding-left:10px;
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

<link rel="stylesheet" type="text/css" href="static/css/menu_3.css">
<link href="static/css/index_6.css" rel="stylesheet" type="text/css" />
 <div id="main">
 	<iframe style="margin-top:-4px;"  class="top" frameborder="0" scrolling="no" src="index/head.do" widht="100%" height="180px;"></iframe>
    
    <div class="cen-div color mar-t">
      <div class="con_title_left fl_left">
		        <div class=" font24 padd-b">
		          <div class="list_left_title">
		         	   基本概况
		          </div>
		        </div>
		        <div class="font2 dgrey"><img  src="static/picture/wz.png" class="padd-r"/>您现在的位置 :  
		<a href='index/page.do'  target="_parent">首页</a>&nbsp;>&nbsp;基本概况
		</div>   
      </div>
      <div class="cen-div-1 mar-t">
        <div class="con-left fl" style="width:170px;min-height:120px;border:1px solid;">
        	<ul>
        		
	        		<li style="padding-right:10px;padding-left:10px;margin-top:15px;">
		                	<a href="cahgIntro/toIntroPage.do" style="color: #fff;background: #2b67ac; color: #fff !important" href="cahgIntro/toIntroPage.do"  target="_parent" title='基本概况' ><span style="margin-left:20px;">基本概况</span></a>
		             </li>
	   				<li style="padding-right:10px;padding-left:10px;margin-top:15px;">
	   					<a style="color: #333;"  href="dept/dept_left.do"><span style="margin-left:20px;">制度建设</span></a>
	   				</li>
	        		<li style="padding-right:10px;padding-left:10px;margin-top:15px;">
		                	<a style="color: #333;" href="cahgIntro/toIntroPage2.do"  target="_parent" title='工作亮点' ><span style="margin-left:20px;">工作亮点</span></a>
		             </li>
	            
	             
        	</ul>
        </div>
        <div class="con-right fr mar-l-2">
        <div class="page"  style="width:100%; margin-top:50px;">
 				<h2 align="center">基本概况</h2>
 				<div align="center">${introMap.content}</div>
 		</div>
        </div>
      </div>	
    </div>
            <iframe class="bot"  frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes" src="index/bottom.do" widht="100%" ></iframe>
    
  </div> 
   
<script>


</script>
  
 
  
</body>
</html>