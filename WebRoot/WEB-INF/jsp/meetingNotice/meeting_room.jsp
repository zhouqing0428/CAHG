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
<title>会议室状态</title>
<link rel="stylesheet" type="text/css" href="static/js/easyui/themes/default/easyui.css">
<script type="text/javascript" src="static/js/easyui/jquery.min.js"></script>
<script type="text/javascript" src="static/js/easyui/jquery.easyui.min.js"></script>
<link rel="stylesheet" type="text/css" href="static/js/easyui/themes/icon.css">
</head>
<body >
	<table align="center" style="text-align: center" border="1px">
			<tr>
				<td align="center" style="font-size:22px;" colspan="4" width="400px;" height="40px;">会议室使用情况</td>
			</tr>
			<tr>
					<td align="center"  style="font-size:18px;"><b>会议室</b></td>
					<td align="center"  style="font-size:18px;"><b>使用科室</b></td>
					<td align="center"  style="font-size:18px;"><b>开始时间</b></td>
					<td align="center"  style="font-size:18px;"><b>结束时间</b></td>
			</tr>
		<c:forEach items="${meetingRoomList }" var="ele">
			
			<tr>
				<td align="center" style="font-size:18px;width:80px;">${ele.roomName }</td>
				<td align="center" style="font-size:18px;width:80px;">${ele.deptname }</td>
				<td align="center" style="font-size:18px;width:180px;">${ele.start_time }</td>
				<td align="center" style="font-size:18px;width:180px;">${ele.end_time }</td>
			</tr>
		</c:forEach>
	</table>
		
</body>
</html>