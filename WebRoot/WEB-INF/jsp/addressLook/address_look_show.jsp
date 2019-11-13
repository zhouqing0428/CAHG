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
<title>通讯录</title>
<link href="static/css/index.css" rel="stylesheet"/>
<link href="static/css/page.css" rel="stylesheet" type="text/css" />
<link href="static/css/common.css" rel="stylesheet" />
<script type="text/javascript" src="static/js/jquery.js"></script>
<script language="javascript" type="text/javascript" src="static/js/jquery.page.js"></script>
<script type="text/javascript">	
	$(document).ready(function(){
		$(".con-left a").each(function(){
			if($.trim($(this).text())==$.trim($(".div1").text())){
				$(this).addClass("linow");
			}
		})
	});
	
	/* function downExcel(){
		var dept_id = '${dept_id}';
		var name = '${dept.name}';
		 var url = "cahgAddressLook/downAddressLookTable.do?dept_id="+encodeURI(dept_id)+"&name="+encodeURI(name+"通讯录");
			window.open(encodeURI(url));	
	} */
</script>
<style type="text/css">
</style>
</head>
<body>

<link rel="stylesheet" type="text/css" href="static/css/menu_3.css">
<link href="static/css/index_6.css" rel="stylesheet" type="text/css" />
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
			     
			     
			      <div  style="margin-top:10px;color:black;align:center">
			 				<c:if test="${empty deptAddress.sys_content and empty deptAddress.data_path}">
			 						<p style="color:red;">提醒：该科室暂无通讯录人员，请联系管理人员进行添加</p>
			 				</c:if>
			 				<div id="content" >${deptAddress.sys_content}</div>
			 			
			      </div>
 			</div>
        </div>
      </div>
    </div>
    
           <iframe class="bot"  frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes" src="index/bottom.do" widht="100%" ></iframe>
    
  </div> 
</body>
</html>