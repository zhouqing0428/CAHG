<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<dt>科室</dt>
<c:forEach items="${deptList }" var="ele" >
<c:if test="${dept_id eq ele.dept_id }">
<dd class="curr">
	<a href="cahgAddressLook/addressLookShowPage.do?dept_id=${ele.dept_id}"  target="_parent" title='${ele.name }' >${ele.name }</a>
</dd>
</c:if>

<c:if test="${dept_id ne ele.dept_id }">
<dd>
	<a href="cahgAddressLook/addressLookShowPage.do?dept_id=${ele.dept_id}"  target="_parent" title='${ele.name }' >${ele.name }</a>
</dd>
</c:if>
</c:forEach>