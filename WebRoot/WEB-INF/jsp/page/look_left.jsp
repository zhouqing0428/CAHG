<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:forEach items="${deptList }" var="ele" >
<dl class="slideItem">
	<dt onclick="$(this).nextAll('.subItem').slideToggle();">${ele.name }</dt>
	<c:forEach items="${cdeptList }" var="dept" >
	<c:if test="${ele.dept_id eq dept.parent_id }">
		<c:if test="${dept_id eq dept.dept_id }">
		<dd class="subItem curr">
			<a href="javascript:void(0)" onclick="getTableData(${dept.dept_id})" title='${dept.name }' >${dept.name }</a>
		</dd>
		</c:if>
		<c:if test="${dept_id ne dept.dept_id }">
		<dd class="subItem">
			<a href="javascript:void(0)" onclick="getTableData(${dept.dept_id})" title='${dept.name }' >${dept.name }</a>
		</dd>
		</c:if>
	</c:if>
	</c:forEach>
</dl>
</c:forEach>