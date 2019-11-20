<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="static/css/menu.css">
<link href="static/css/index_1.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="static/js/jquery.js"></script>
<style type="text/css">
	select{font-size:16px;}
	select option{font-size:16px;}
</style>
</head>
<body>
<div align="center">
<hr align="center" style="width:1000px;"/>
	<div>
	<img src="static/images/lianjie.jpg" style="float: left;">
	<img src="static/images/lianjie1.jpg" style="margin-left:-10px;width:886px;height:30px;">	

	<p class="ft-midle" style="border:1px solid #FFAD85;"><span style="color:red;font-size:16px;"><!-- <b>友情链接</b></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
	<select id="link1" class="selectSty">
		<option value="">部门网站</option>
		<c:forEach items="${linkList }" var="ele">
			<c:if test="${ele.type eq 1 }">
				<option value="${ele.url }">${ele.name }</option>
			</c:if>
		</c:forEach></select>
	
	<select id="link2" class="selectSty">
	<option value="">分关网站</option>
				<c:forEach items="${linkList }" var="ele">
					<c:if test="${ele.type eq 2 }">
						<option value="${ele.url }">${ele.name }</option>
					</c:if>
				</c:forEach>
			</select>
	
	<select id="link3" class="selectSty">
	<option value="">应用系统</option>
				<c:forEach items="${linkList }" var="ele">
					<c:if test="${ele.type eq 3 }">
						<option value="${ele.url }">${ele.name }</option>
					</c:if>
				</c:forEach>
			</select>
	
	<select id="link4" class="selectSty">
	<option value="">相关链接</option>
				<c:forEach items="${linkList }" var="ele">
					<c:if test="${ele.type eq 4 }">
						<option value="${ele.url }">${ele.name }</option>
					</c:if>
				</c:forEach>
			</select>

	</p>

		<div class="foot-wrap" >
			<div class="ft-center">
				<p class="ft-top blue" style="font-size:16px;margin-top:-23px;"><span style="line-height:35px;  overflow:hidden; color:#fff">中华人民共和国东莞长安海关版权所有&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
				<!-- <p class="ft-midle">友情链接：</p>
				<p class="ft-bottom"></p> -->
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
$("#link1").bind("change",function(){
	var obj = document.getElementById("link1"); //定位id
	var index = obj.selectedIndex; // 选中索引
	type = obj.options[index].value; // 选中值
	if(type!=null && type !=""){
		window.open(encodeURI(type));
	}
	
});

$("#link2").bind("change",function(){
	var obj = document.getElementById("link2"); //定位id
	var index = obj.selectedIndex; // 选中索引
	type = obj.options[index].value; // 选中值
	if(type!=null && type !=""){
		window.open(encodeURI(type));
	}
});

$("#link3").bind("change",function(){
	var obj = document.getElementById("link3"); //定位id
	var index = obj.selectedIndex; // 选中索引
	type = obj.options[index].value; // 选中值
	if(type!=null && type !=""){
		window.open(encodeURI(type));
	}
});

$("#link4").bind("change",function(){
	var obj = document.getElementById("link4"); //定位id
	var index = obj.selectedIndex; // 选中索引
	type = obj.options[index].value; // 选中值
	if(type!=null && type !=""){
		window.open(encodeURI(type));
	}
});
</script>
</body>
</html>