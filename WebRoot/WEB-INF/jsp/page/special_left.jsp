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
	<div class="con-left fl " style="width:170px;min-height:500px;border:1px solid;">
          <ul>
         <li style="background-color: #006FCB;color: #fff;text-align:center"><b>分类</b></li>
        	<c:forEach items="${specialLeftList }" var="ele">
          		<c:if test="${special_topic_category_id eq ele.special_topic_category_id }">
          			<li style="padding-right:10px;padding-left:10px;margin-top:15px;">
	                	<a style="background: #0066a6; color: #fff !important;" href="cahgSpecialTopic/specialTopicListPage.do?url=${ele.special_topic_category_id }"  target="_parent" title='${ele.name }' ><span style="margin-left:20px;">${ele.name }</span></a>
	             	</li>
          		</c:if>
	          	<c:if test="${special_topic_category_id ne ele.special_topic_category_id }">
          			<li style="margin-top:15px;padding-right:10px;padding-left:10px;">
	                	<a href="cahgSpecialTopic/specialTopicListPage.do?url=${ele.special_topic_category_id }"  target="_parent" title='${ele.name }' ><span style="margin-left:20px;">${ele.name }</span></a>
	             	</li>	
          		</c:if>
	         </c:forEach>
        	</ul>
	    </div>
</body>
</html>