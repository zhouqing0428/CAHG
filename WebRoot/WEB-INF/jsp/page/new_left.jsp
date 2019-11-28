<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

         <dt>制度建设</dt>
          	<c:forEach items="${newTypeList }" var="ele">
          		<c:if test="${url eq ele.key }">
          			<dd class="curr">
	                	<a href="${ele.key}"  target="_parent" title='${ele.value }' >${ele.value }</a>
	             	</dd>
          		</c:if>
	          	
	          	<c:if test="${url ne ele.key }">
          			<dd>
	                	<a href="${ele.key}" target="_parent" title='${ele.value }' >${ele.value }</a>
	             	</dd>
          		</c:if>
	          	</c:forEach>
