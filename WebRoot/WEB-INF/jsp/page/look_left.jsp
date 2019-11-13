<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="static/css/index.css" rel="stylesheet"/>
<title></title>
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
width:100px;
float: left;
margin:5px;
}
</style>
</head>
<body>
	<div class="con-left fl " style="width:320px;height:580px;padding-bottom: 10px;">
          <ul>
         <li style="background-color: #006FCB;color: #fff;text-align:center;"><b style="margin-left:-40px;">科室</b></li>
          	<c:forEach items="${deptList }" var="ele" >
          		<c:if test="${dept_id eq ele.dept_id }">
          			<li style=" padding-right:10px;padding-left:10px;margin-top:10px;">
	                	<a style="background: #0066a6; color: #fff !important;" href="cahgAddressLook/addressLookShowPage.do?dept_id=${ele.dept_id}"  target="_parent" title='${ele.name }' ><span style="margin-left:20px;">${ele.name }</span></a>
	             	</li>
	             	
          		</c:if>
	          	
	          	<c:if test="${dept_id ne ele.dept_id }">
          			<li style="margin-top:10px;padding-right:10px;padding-left:10px;">
	                	<a style="color: #333;" href="cahgAddressLook/addressLookShowPage.do?dept_id=${ele.dept_id}"  target="_parent" title='${ele.name }' ><span style="margin-left:20px;">${ele.name }</span></a>
	             	</li>
          		</c:if>
	          	</c:forEach>
          </ul>
        </div>
</body>
</html>