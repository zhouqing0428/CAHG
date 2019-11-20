<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>通讯录</title>
<link href="static/css/index.css" rel="stylesheet"/>
<link href="static/css/page.css" rel="stylesheet" type="text/css" />
<link href="static/css/common.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="static/css/menu_3.css">
<link href="static/css/index_6.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="static/ztree/css/zTreeStyle/zTreeStyle.css" />
<script type="text/javascript" src="static/js/jquery.js"></script>
<script language="javascript" type="text/javascript" src="static/js/jquery.page.js"></script>
<script src="static/ztree/jquery.ztree.all.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">	
	$(document).ready(function(){
		$(".con-left a").each(function(){
			if($.trim($(this).text())==$.trim($(".div1").text())){
				$(this).addClass("linow");
			}
		})
	});
</script>
<style type="text/css">
</style>
</head>
<body>
 <div id="main">
 	<iframe style="margin-top:-4px;"  class="top" frameborder="0" scrolling="no" src="index/head.do" widht="100%" height="180px;"></iframe>
    
    <div class="cen-div color mar-t">
      <div class="con_title_left fl_left">
        <div class=" font24 padd-b">
          <div class="list_left_title">
            	通讯录
          </div>
        </div>
        <div class="font2 dgrey"><img  src="static/picture/wz.png" class="padd-r"/>您现在的位置 :  
		<a href='index/page.do'  target="_parent">首页</a>&nbsp;>&nbsp;通讯录
		</div>   
      </div>
      </div>
      
     <div> 
      <div class="cen-div-1 mar-t" >
        
        <iframe style="width:280px;height:700px;" class="con-left fl" frameborder="0" scrolling="no" src="index/look_left.do?dept_id=${dept_id}"></iframe>
   		<c:if test="${!empty deptAddress.data_path}">
   				<p align="right"><a href="http://10.56.65.100/file/upImg/fileload/${deptAddress.data_path}"><span style="color:red;">点击下载：${deptAddress.file_names }</span></a></p>
   		</c:if>
        <div class="con-right fr mar-l-2" style="width:665px;">
 			<div id="list" >
 			<c:if test="${empty addressLookList}">
		 		<div class="con_title mar-t2 text">
			        <h4 align="center">${dept.name}</h4>
		        </div>
			 </c:if>
			 <c:if test="${!empty addressLookList}">
 				 <div class="con_title mar-t2 text">
			        <h4 align="center">${dept.name}</h4>
			      </div>
			      <div class="">
			        
			      </div>
		     </c:if>
		     
		      <div>
 				<c:if test="${empty dept_id or dept_id =='38'}">
 					<div class="col-xs-2" style="padding-left: 0px !important;">
 						<ul id="treeDemo" class="ztree" style="width: 100%; height: 387px; overflow-x: auto; overflow-y: auto;"></ul>
 					</div>
 					<div class="col-xs-10"  style="padding: 0px !important;">
 						<div class="sys-tables">
							<table id="myTable" class="table table-bordered table-hover" style="text-align:center;">
								<thead>
									<tr class="bg">
										<th nowrap="nowrap" width="40">序号</th>
										<th nowrap="nowrap" width="100">姓名</th>
										<th nowrap="nowrap" width="100">工号</th>
										<th nowrap="nowrap" width="200">科室</th>
										<th nowrap="nowrap" width="100">职务</th>
										<th nowrap="nowrap" width="100">办工内线</th>
										<th nowrap="nowrap" width="100">办工外线</th>
									</tr>
								</thead>
								<tbody id="mytbody">
								<c:forEach items="${addressLookList}" var="item" varStatus="idx">
									<tr>
										<td>${idx.index+1}</td>
										<td>${item.name}</td>
										<td>${item.job_number}</td>
										<td>${dept.name}</td>
										<td>${item.duty}</td>
										<td>${item.interior}</td>
										<td>${item.external}</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
 					</div>
 				</c:if>
 				<c:if test="${!empty dept_id and dept_id!='38'}">
 					<div id="content">
						<c:if test="${!empty addressLookList}">
	 						<div class="sys-tables">
								<table id="myTable" class="table table-bordered table-hover" style="text-align:center;">
									<thead>
										<tr class="bg">
											<th nowrap="nowrap" width="40">序号</th>
											<th nowrap="nowrap" width="100">姓名</th>
											<th nowrap="nowrap" width="100">工号</th>
											<th nowrap="nowrap" width="200">科室</th>
											<th nowrap="nowrap" width="100">职务</th>
											<th nowrap="nowrap" width="100">办工内线</th>
											<th nowrap="nowrap" width="100">办工外线</th>
										</tr>
									</thead>
									<tbody id="mytbody">
									<c:forEach items="${addressLookList}" var="item" varStatus="idx">
										<tr>
											<td>${idx.index+1}</td>
											<td>${item.name}</td>
											<td>${item.job_number}</td>
											<td>${dept.name}</td>
											<td>${item.duty}</td>
											<td>${item.interior}</td>
											<td>${item.external}</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</c:if>
 					</div>
 				</c:if>
		      </div>
 			</div>
        </div>
      </div>
    </div>
    
   	<iframe class="bot"  frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes" src="index/bottom.do" widht="100%" ></iframe>
    
  </div>
  <script>
  	var deptList = '${depts}';
  	deptList = JSON.parse(deptList);
  </script>
  <script src="static/js/biz/address_book_show.js?_${date.systemTime}"></script>
</body>
</html>