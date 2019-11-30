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
<link href="static/css/page.css" rel="stylesheet" type="text/css" />
<link href="static/css/common.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="static/css/menu.css">
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
.ztree li span.button.ico_docu,.ztree li span.button.ico_open{
	margin-top:0;
}
</style>
</head>
<body>
 <div id="main">
 	<!-- <iframe class="top" id="topif" name="topif" frameborder="0" scrolling="no" src="index/head.do" widht="100%" height="280px;"></iframe> -->
  	<div class="top"></div>
    <div class="cen-div color mar-t">
      <div class="con_title_left fl_left">
        <div class=" font24 padd-b">
          <div class="list_left_title">通讯录</div>
        </div>
        <div class="font2 dgrey"><img  src="static/picture/wz.png" class="padd-r"/>您现在的位置 : <a href='index/page.do'  target="_parent">首页</a>&nbsp;>&nbsp;通讯录</div>   
      </div>
    </div>
      
    <div class="cen-div-1 mar-t" >
      <!-- <iframe style="width:280px;height:700px;" class="con-left fl" frameborder="0" scrolling="no" src="index/look_left.do?dept_id=${dept_id}"></iframe> -->
      	<dl class="con-left fl"></dl>
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
			</c:if>
			<c:if test="${empty dept_id or dept_id =='38'}">
				<div id="content">
					<ul id="treeDemo" class="ztree"></ul>
					<table id="myTable" co style="width:100%;margin:30px auto 30px;padding:0px; border-collapse:collapse;">
						<tr style="background:#2b67ac;">
							<td style="border:1px solid;line-height:50px;font-size:14px;text-align:center;"><span style="color:#fff;">序号</span></td>
								<td style="border:1px solid;line-height:50px;font-size:14px;text-align:center;"><span style="color:#fff;">姓名</span></td>
								<td style="border:1px solid;line-height:50px;font-size:14px;text-align:center;"><span style="color:#fff;">工号</span></td>
								<td style="border:1px solid;line-height:50px;font-size:14px;text-align:center;"><span style="color:#fff;">科室</span></td>
								<td style="border:1px solid;line-height:50px;font-size:14px;text-align:center;"><span style="color:#fff;">职务</span></td>
								<td style="border:1px solid;line-height:50px;font-size:14px;text-align:center;"><span style="color:#fff;">办工内线</span></td>
								<td style="border:1px solid;line-height:50px;font-size:14px;text-align:center;"><span style="color:#fff;">办工外线</span></td>
						</tr>
						<c:forEach items="${addressLookList}" var="item" varStatus="idx">
						<tr>
							<td style="border:1px solid;line-height:50px;font-size:12px;text-align:center;">${idx.index+1}</td>
							<td style="border:1px solid;line-height:50px;font-size:12px;text-align:center;">${item.name}</td>
							<td style="border:1px solid;line-height:50px;font-size:12px;text-align:center;">${item.job_number}</td>
							<td style="border:1px solid;line-height:50px;font-size:12px;text-align:center;">${dept.name}</td>
							<td style="border:1px solid;line-height:50px;font-size:12px;text-align:center;">${item.duty}</td>
							<td style="border:1px solid;line-height:50px;font-size:12px;text-align:center;">${item.interior}</td>
							<td style="border:1px solid;line-height:50px;font-size:12px;text-align:center;">${item.external}</td>
						</tr>
						</c:forEach>
					</table>
		    	</div>
			</c:if>
			<c:if test="${!empty dept_id and dept_id!='38'}">
				<div id="content">
					<c:if test="${!empty addressLookList}">
						<table id="myTable" co style="width:100%;margin:30px auto 30px;padding:0px; border-collapse:collapse;">
							<tr style="background:#2b67ac;">
								<td style="border:1px solid;line-height:50px;font-size:14px;text-align:center;"><span style="color:#fff;">序号</span></td>
								<td style="border:1px solid;line-height:50px;font-size:14px;text-align:center;"><span style="color:#fff;">姓名</span></td>
								<td style="border:1px solid;line-height:50px;font-size:14px;text-align:center;"><span style="color:#fff;">工号</span></td>
								<td style="border:1px solid;line-height:50px;font-size:14px;text-align:center;"><span style="color:#fff;">科室</span></td>
								<td style="border:1px solid;line-height:50px;font-size:14px;text-align:center;"><span style="color:#fff;">职务</span></td>
								<td style="border:1px solid;line-height:50px;font-size:14px;text-align:center;"><span style="color:#fff;">办工内线</span></td>
								<td style="border:1px solid;line-height:50px;font-size:14px;text-align:center;"><span style="color:#fff;">办工外线</span></td>
							</tr>
							<c:forEach items="${addressLookList}" var="item" varStatus="idx">
							<tr>
								<td style="border:1px solid;line-height:50px;font-size:12px;text-align:center;">${idx.index+1}</td>
								<td style="border:1px solid;line-height:50px;font-size:12px;text-align:center;">${item.name}</td>
								<td style="border:1px solid;line-height:50px;font-size:12px;text-align:center;">${item.job_number}</td>
								<td style="border:1px solid;line-height:50px;font-size:12px;text-align:center;">${dept.name}</td>
								<td style="border:1px solid;line-height:50px;font-size:12px;text-align:center;">${item.duty}</td>
								<td style="border:1px solid;line-height:50px;font-size:12px;text-align:center;">${item.interior}</td>
								<td style="border:1px solid;line-height:50px;font-size:12px;text-align:center;">${item.external}</td>
							</tr>
							</c:forEach>
						</table>
					</c:if>
				</div>
			</c:if>
		</div>
      </div>
 </div>
    
   	<iframe class="bot"  frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes" src="index/bottom.do" widht="100%" ></iframe>
    
  </div>
  <script>
  	var deptList = '${depts}';
  	deptList = JSON.parse(deptList);
  	getSlideMenu()
  	function getSlideMenu(){
  		var url = "${dept_id}"
  		$.ajax({
  		    url:"index/look_left.do?dept_id="+url,
  		    dataType : "html", 
  		    method:"post",
  		    async: true,  
  		    data: {},
  		    contentType: "application/x-www-form-urlencoded; charset=utf-8", 
  		    success:function(data){
  		    	$(".con-left").html(data);
  		    }
  		 });
  	}	

  	function getHeader(){
  		$.ajax({
  		    url:"index/head.do",
  		    dataType : "html", 
  		    method:"post",
  		    async: true,  
  		    data: {},
  		    contentType: "application/x-www-form-urlencoded; charset=utf-8", 
  		    success:function(data){
  		    	$(".top").html(data);
  		    }
  		 });
  	}
  	getHeader();
  </script>
  <script src="static/js/biz/address_book_show.js?_${date.systemTime}"></script>
</body>
</html>