<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<base href="<%=basePath%>">
<title>${newMap.title}</title>
</head>
<body>
<script type="text/javascript" src="js/dropdown.class.demo_3.js"></script>
<link rel="stylesheet" type="text/css" href="static/css/menu_3.css">
<link href="static/css/index_6.css" rel="stylesheet" type="text/css" />
<div id="main">
<iframe style="margin-top:-4px;"  class="top" frameborder="0" scrolling="no" src="index/head.do" widht="100%" height="180px;"></iframe>
    <div class="cen-div color mar-t">
      <div class="con_title_left_c fl_left"> 
      	<div class="fl"><div class="font2 dgrey"><img  src="static/picture/wz.png" class="padd-r"/>您现在的位置 :  
<a href='index/page.do'  target="_parent">首页</a>&nbsp;>&nbsp;制度建设
</div></div>
       
      </div>
       <div class="cen-div-1 mar-t">
        <div class="con-left fl" style="width:170px;min-height:120px;border:1px solid;">
        	<ul>
	        		<li style="padding-right:10px;padding-left:10px;margin-top:15px;" >
		                	<a href="cahgIntro/toIntroPage.do" style="color: #333;" href="cahgIntro/toIntroPage.do"  target="_parent" title='基本概况' ><span style="margin-left:20px;">基本概况</span></a>
		             </li>
	   				<li style="padding-right:10px;padding-left:10px;margin-top:15px;">
	   					<a style="background: #2b67ac; color: #fff !important"  href="dept/dept_left.do"><span style="margin-left:20px;">制度建设</span></a>
	   				</li>
	        		<li style="padding-right:10px;padding-left:10px;margin-top:15px;">
		                	<a style="color: #333;" href="cahgIntro/toIntroPage2.do"  target="_parent" title='工作亮点' ><span style="margin-left:20px;">工作亮点</span></a>
		             </li>
        	</ul>
        </div>
      <div class="con-right fr mar-l-2">
      <div class="line mar-t2 hov">
       <h2>一、本关主要工作</h2>
       	
       	<table style="width:100%;margin:0px;padding:0px; border-collapse:collapse;">
       				<tr>
       					<c:forEach items="${officeList }" var="ele" varStatus="i">
       						<c:if test="${ i.index < 6 }">
       							<td style="border:1px solid;width:120px;line-height: 30px;font-size:18px;"><a href="dept/officeWorkFileListPage.do?office_work_category_id=${ele.office_work_category_id }">${ele.name }</a></td>
       						</c:if>
       					</c:forEach>
       				</tr>
       				
       				<tr>
       					<c:forEach items="${officeList }" var="ele" varStatus="i">
       						<c:if test="${ i.index < 12 and  i.index >=6}">
       							<td style="border:1px solid;width:120px;line-height: 30px;font-size:18px;"><a href="dept/officeWorkFileListPage.do?office_work_category_id=${ele.office_work_category_id }">${ele.name }</a></td>
       						</c:if>
       					</c:forEach>
       				</tr>	
       				
       				<tr>
       					<c:forEach items="${officeList }" var="ele" varStatus="i">
       						<c:if test="${ i.index < 18 and  i.index >=12}">
       							<td style="border:1px solid;width:120px;line-height: 30px;font-size:18px;"><a href="dept/officeWorkFileListPage.do?office_work_category_id=${ele.office_work_category_id }">${ele.name }</a></td>
       						</c:if>
       					</c:forEach>
       				</tr>
       				
       				<tr>
       					<c:forEach items="${officeList }" var="ele" varStatus="i">
       						<c:if test="${ i.index < 24 and  i.index >=18}">
       							<td style="border:1px solid;width:120px;line-height: 30px;font-size:18px;"><a href="dept/officeWorkFileListPage.do?office_work_category_id=${ele.office_work_category_id }">${ele.name }</a></td>
       						</c:if>
       					</c:forEach>
       				</tr>
       	</table>
       	
      </div>
      
      

      <div class="line mar-t2 hov" style="margin-top:40px;">
       <h2>二、科室管理规范</h2>
       	
       	<table style="width:100%;margin:0px;padding:0px; border-collapse:collapse;">
       				<tr>
       					<c:forEach items="${deptList }" var="ele" varStatus="i">
       						<c:if test="${ i.index < 6 }">
       							<td style="border:1px solid;width:120px;line-height: 30px;font-size:18px;"><a href="dept/deptDetails.do?dept_id=${ele.dept_id }">${ele.name }</a></td>
       						</c:if>
       					</c:forEach>
       				</tr>
       				
       				<tr>
       					<c:forEach items="${deptList }" var="ele" varStatus="i">
       						<c:if test="${ i.index < 12 and  i.index >=6}">
       							<td style="border:1px solid;width:120px;line-height: 30px;font-size:18px;"><a href="dept/deptDetails.do?dept_id=${ele.dept_id }">${ele.name }</a></td>
       						</c:if>
       					</c:forEach>
       				</tr>	
       				
       				<tr>
       					<c:forEach items="${deptList }" var="ele" varStatus="i">
       						<c:if test="${ i.index < 18 and  i.index >=12}">
       							<td style="border:1px solid;width:120px;line-height: 30px;font-size:18px;"><a href="dept/deptDetails.do?dept_id=${ele.dept_id }">${ele.name }</a></td>
       						</c:if>
       					</c:forEach>
       				</tr>
       				
       				<tr>
       					<c:forEach items="${deptList }" var="ele" varStatus="i">
       						<c:if test="${ i.index < 24 and  i.index >=18}">
       							<td style="border:1px solid;width:120px;line-height: 30px;font-size:18px;"><a href="dept/deptDetails.do?dept_id=${ele.dept_id }">${ele.name }</a></td>
       						</c:if>
       					</c:forEach>
       				</tr>
       	</table>
       	</div>
      </div>
   </div>
      
    </div>
    
            <iframe class="bot"  frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes" src="index/bottom.do" widht="100%" ></iframe>
    
  </div>

</body>
</html>