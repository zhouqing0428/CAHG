<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<dl class="slideItem">
	<dt onclick="$(this).nextAll('.subItem').slideToggle()">东莞长安海关通讯录</dt>
	<dd class="subItem">
		<a href="javascript:void(0)">长安海关科室一</a>
	</dd>
	<dd class="subItem">
		<a href="javascript:void(0)">长安海关科室二</a>
	</dd>
	<dd class="subItem">
		<a href="javascript:void(0)">长安海关科室三</a>
	</dd>
	<dd class="subItem">
		<a href="javascript:void(0)">长安海关科室四</a>
	</dd>
</dl>
<dl class="slideItem">
	<dt onclick="$(this).nextAll('.subItem').slideToggle()">黄埔海关驻长安办事处缉私分局</dt>
	<dd class="subItem">
		<a href="javascript:void(0)">黄埔海关科室一</a>
	</dd>
	<dd class="subItem">
		<a href="javascript:void(0)">黄埔海关科室二</a>
	</dd>
	<dd class="subItem">
		<a href="javascript:void(0)">黄埔海关科室三</a>
	</dd>
	<dd class="subItem">
		<a href="javascript:void(0)">黄埔海关科室四</a>
	</dd>
</dl>