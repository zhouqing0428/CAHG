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
<title>东莞长安海关简介</title>
<link href="static/css/common.css" rel="stylesheet" />
<script type="text/javascript" src="static/js/jquery.js"></script>
<script type="text/javascript" src="js/dropdown.class.demo_3.js"></script>
<link rel="stylesheet" type="text/css" href="static/css/menu.css">
<link href="static/css/index_6.css" rel="stylesheet" type="text/css" />
<link href="static/layui/css/layui.css" rel="stylesheet">
<script src="static/layui/layui.all.js"></script>
</head>
<body>
<div id="main">
	<!-- <iframe class="top" id="topif" name="topif" frameborder="0" scrolling="no" src="index/head.do" widht="100%" height="280px;"></iframe> -->
  	<div class="top"></div>
	<div class="cen-div color mar-t">
      <div class="con_title_left fl_left">
        <div class=" font24 padd-b">
          <div class="list_left_title">
         	   制度建设
          </div>
        </div>
        <div class="font2 dgrey">
        	<img  src="static/picture/wz.png" class="padd-r"/>您现在的位置 :  
        	<a href='index/page.do'  target="_parent">首页</a>&nbsp;>&nbsp;制度建设
		</div>   
      </div>
      <div class="cen-div-1 mar-t">
        <dl class="con-left fl">
       		<dt>简介</dt>
			<dd>
				<a href="cahgIntro/toIntroPage.do" target="_parent" title='基本概况' >基本概况</a>
			</dd>
			<dd class="curr">
				<a href="dept/dept_left.do" target="_parent" title='制度建设'>制度建设</a>
			</dd>
			<dd>
				<a href="cahgIntro/toIntroPage2.do" target="_parent" title='工作亮点' >工作亮点</a>
			</dd>
       	</dl>
        <div class="con-right fr mar-l-2">
	        <div class="page"  style="width:100%; margin-top:50px;">
				<h2 style="font-weight:normal;height:60px;line-height:60px;">一、本关主要工作</h2>
		       	<table style="width:100%;margin:0px auto 30px;padding:0px; border-collapse:collapse;">
		       	<c:forEach begin="0" end="${officeCount}" varStatus="n">
		       		<tr>
		       			<c:forEach items="${officeList }" var="ele" varStatus="i">
			       		<c:if test="${ i.index >=4*n.index and i.index < 4*(n.index+1) }">
		       				<td style="border:1px solid;width:120px;line-height:50px;font-size:18px;text-align:center;"><a href="dept/officeWorkFileListPage.do?office_work_category_id=${ele.office_work_category_id }">${ele.name }</a></td>
			       		</c:if>
			       		</c:forEach>
		       		</tr>
		       	</c:forEach>					
		       	</table>
		       	<h2 style="font-weight:normal;height:60px;line-height:60px;">二、科室管理规范</h2>
		       	<table  style="width:100%;margin:0px auto 30px;padding:0px; border-collapse:collapse;">
		       	<c:forEach begin="0" end="${count}" varStatus="n">
		       		<tr>
		       		<c:forEach items="${deptList }" var="ele" varStatus="i">
		       		<c:if test="${ i.index >=3*n.index and i.index < 3*(n.index+1) }">
	       				<td style="border:1px solid;width:120px;line-height:50px;font-size:18px;text-align:center;"><a href="dept/deptDetails.do?dept_id=${ele.dept_id }">${ele.name }</a></td>
		       		</c:if>
		       		</c:forEach>
		       		</tr>
		       	</c:forEach>
		       	</table>
	 		</div>
        </div>
      </div>	
    </div>
    <iframe class="bot"  frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes" src="index/bottom.do" widht="100%" ></iframe>
  </div>
</body>
</html>
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