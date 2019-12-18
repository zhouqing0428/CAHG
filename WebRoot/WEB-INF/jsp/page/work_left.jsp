<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<dt>重点工作</dt>
<c:forEach items="${tableCategoryList }" var="ele">
<c:if test="${work_table_category_id eq ele.work_table_category_id }">
<dd class="curr">
<a href="cahgWorkTable/workTableListPage.do?work_table_category_id=${ele.work_table_category_id}"  target="_parent" title='${ele.name }' >${ele.name }</a>
</dd>
</c:if>

<c:if test="${work_table_category_id ne ele.work_table_category_id }">
<dd>
<a href="cahgWorkTable/workTableListPage.do?work_table_category_id=${ele.work_table_category_id}"  target="_parent" title='${ele.name }' >${ele.name }</a>
</dd>
</c:if>
</c:forEach>