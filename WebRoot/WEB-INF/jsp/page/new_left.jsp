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
}

</style>
</head>
<body>
	<div class="con-left fl" style="width:170px;min-height:120px;border:1px solid #eeeeee;border-top:0;padding-bottom:15px;">
          <ul>
         <li style="background-color: #006FCB;color: #fff;text-align:center"><b>制度建设</b></li>
          	<c:forEach items="${newTypeList }" var="ele">
          		<c:if test="${url eq ele.key }">
          			<li style="padding-right:10px;padding-left:10px;margin-top:15px;">
	                	<a style="color: #fff;background: #2b67ac; color: #fff !important" href="${ele.key}"  target="_parent" title='${ele.value }' ><span style="margin-left:20px;">${ele.value }</span></a>
	             	</li>
          		</c:if>
	          	
	          	<c:if test="${url ne ele.key }">
          			<li style="margin-top:15px;padding-right:10px;padding-left:10px;">
	                	<a style="color: #333;" href="${ele.key}"  target="_parent" title='${ele.value }' ><span style="margin-left:20px;">${ele.value }</span></a>
	             	</li>
          		</c:if>
	          	</c:forEach>
          </ul>
        </div>
</body>
</html>