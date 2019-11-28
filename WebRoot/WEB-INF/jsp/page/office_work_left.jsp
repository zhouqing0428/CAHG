<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

    <dt>制度建设</dt>
	<c:forEach items="${officeWorkCategoryList }" var="ele">
		<c:if test="${url eq ele.office_work_category_id }">
			<dd class="curr">
				<a href="dept/officeWorkFileListPage.do?office_work_category_id=${ele.office_work_category_id}"  target="_parent" title='${ele.name }' >${ele.name }</a>
			</dd>
		</c:if>
		
		<c:if test="${url ne ele.office_work_category_id }">
			<dd>
				<a href="dept/officeWorkFileListPage.do?office_work_category_id=${ele.office_work_category_id}"  target="_parent" title='${ele.name }' >${ele.name }</a>
			</dd>
		</c:if>
	</c:forEach>