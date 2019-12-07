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
<link href="static/layui/css/layui.css" rel="stylesheet">
<script src="static/layui/layui.all.js"></script>
</head>
<body style="margin:0;padding: 20px;">
	<table id="Table1" style="width:100%;margin:0 auto 30px;padding:0px; border-collapse:collapse;">
			<tr>
				<td colspan="4" align="center" style="border:1px solid;line-height:44px;font-size:14px;text-align:center;">
					<span">会议室使用情况</span>
				</td>
			</tr>
			<tr>
					<td align="center" style="border:1px solid;line-height:34px;font-size:14px;text-align:center;"><span>会议室</span></td>
					<td align="center" style="border:1px solid;line-height:34px;font-size:14px;text-align:center;"><span>使用科室</span></td>
					<td align="center" style="border:1px solid;line-height:34px;font-size:14px;text-align:center;"><span>开始时间</span></td>
					<td align="center" style="border:1px solid;line-height:34px;font-size:14px;text-align:center;"><span>结束时间</span></td>
			</tr>
		<c:forEach items="${meetingRoomList }" var="ele">
			
			<tr>
				<td align="center" style="border:1px solid;line-height:34px;font-size:12px;text-align:center;">${ele.roomName }</td>
				<td align="center" style="border:1px solid;line-height:34px;font-size:12px;text-align:center;">${ele.deptname }</td>
				<td align="center" style="border:1px solid;line-height:34px;font-size:12px;text-align:center;">${ele.start_time }</td>
				<td align="center" style="border:1px solid;line-height:34px;font-size:12px;text-align:center;">${ele.end_time }</td>
			</tr>
		</c:forEach>
	</table>
		
</body>
</html>