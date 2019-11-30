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
<title>工作办结</title>
</head>
<body>
<link rel="stylesheet" type="text/css" href="static/css/menu.css">
<link href="static/css/index_6.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/dropdown.class.demo_3.js"></script>
<script type="text/javascript" src="static/js/jquery.min.js"></script>
<script type="text/javascript" src="static/js/jquery.js"></script>
<div id="main">
<!-- <iframe class="top" id="topif" name="topif" frameborder="0" scrolling="no" src="index/head.do" widht="100%" height="280px;"></iframe> -->
  	<div class="top"></div>
  	 <div style="background-color: #fff">  
    <div class="cen-div color mar-t">
      <div class="con_title_left_c fl_left"> 
      	<div class="fl"><div class="font2 dgrey"><img  src="static/picture/wz.png" class="padd-r"/>您现在的位置 :  
<a href='index/page.do'  target="_parent">首页</a>&nbsp;>&nbsp;<a href='cahgCustomNews/customNewsListPage.do	'  target="_parent">工作督办</a>&nbsp;>&nbsp;<a href=''  target="_parent">工作办结</a>
</div></div>
      </div>
	      <div>
        	<font color="red">*</font>经办科室：
        	<select id="deptId" name="deptId">
        		<option value="">请选择经办科室</option>
        		<c:forEach items="${deptList}" var="dept">
       			<option value="${dept.dept_id}">${dept.name}</option>
        		</c:forEach>
        	</select>
	      </div>
	      <div>
	      	<font color="red">*</font>经办人：
	      	<input type="text" id="userName" name="userName" placeholder="请填写经办人"/>
	      </div>
	      <div>
         	<font color="red">*</font>办理情况：
         	<textarea id="content" name="content" rows="3" cols="150"></textarea>
	      </div>
	      <div>
	      	<input type="hidden" id="jobId" name="jobId" value="${jobId}"/>
	      	<input type="button" value="提交" onclick="submit();"/>
	      </div>
    </div>
</div>
<iframe class="bot"  frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes" src="index/bottom.do" widht="100%" ></iframe>
</div>
<script type="text/javascript">
	function submit(){
		var jobId = $("#jobId").val();
		var deptId = $("#deptId").val();
		if(deptId == null || deptId == ""){
			alert("请选择经办科室");
			return;
		}
		var userName = $("#userName").val();
		if(userName == null || userName == ""){
			alert("请填写经办人");
			return;
		}
		var content = $("#content").val();
		if(content == null || content == ""){
			alert("请填写办理情况");
			return;
		}
		$.ajax({
			type : "POST",
			url : "../cahgJob/submit.do",
			data : {
				jobId : jobId,
				deptId : deptId,
				userName : userName,
				content : content
			},
			success : function(data) {
				if (data.code == 0) {
					window.location.href="../cahgJob/jobDetailsShow.do?job_id="+jobId;
				} else {
					alert("工作办结提交失败");
				}
			},
			complete : function(XMLHttpRequest, textStatus) {
				if (textStatus != "success") {
					location.reload(true);
				}
				;
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
</body>
</html>