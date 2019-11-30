<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

         <dt>专题专栏</dt>
          	<c:forEach items="${specialLeftList }" var="ele">
          		<c:if test="${special_topic_category_id eq ele.special_topic_category_id }">
          			<dd class="curr">
	                	<a href="cahgSpecialTopic/specialTopicListPage.do?url=${ele.special_topic_category_id }"  target="_parent" title='${ele.name }' >${ele.name }</a>
	             	</dd>
          		</c:if>
	          	<c:if test="${special_topic_category_id ne ele.special_topic_category_id }">
          			<dd>
	                	<a href="cahgSpecialTopic/specialTopicListPage.do?url=${ele.special_topic_category_id }"  target="_parent" title='${ele.name }' >${ele.name }</a>
	             	</dd>	
          		</c:if>
	         </c:forEach>
