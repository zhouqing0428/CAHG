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
<script type="text/javascript" src="js/dropdown.class.demo_3.js"></script>
<link rel="stylesheet" type="text/css" href="static/css/menu.css">
<link rel="stylesheet" type="text/css" href="static/js/easyui/themes/default/easyui.css">
<link href="static/css/index_6.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="static/js/jquery.js"></script>
</head>
<body>
<div id="main">
<!-- <iframe class="top" id="topif" name="topif" frameborder="0" scrolling="no" src="index/head.do" widht="100%" height="280px;"></iframe> -->
  	<div class="top"></div>
  <div style="background-color: #fff">  
    <div class="cen-div color mar-t">
      <div class="con_title_left_c fl_left"> 
      	<div class="fl"><div class="font2 dgrey"><img  src="static/picture/wz.png" class="padd-r"/>您现在的位置 :  
<a href='index/page.do'  target="_parent">首页</a>&nbsp;>&nbsp;<a href='cahgCustomNews/customNewsListPage.do	'  target="_parent">工作督办列表</a>&nbsp;>&nbsp;<a href=''  target="_parent">工作督办</a>
</div></div>
       
      </div>
      <div class="con_title mar-t2 text">
        <h4 style="margin:20px;" align="center">${newMap.title }</h4>
      </div>
      <div class="line mar-t2 hov">
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style=" padding-left:10px; padding-right:10px;color:#666666;">
          <tr>
            <td align="center" width="100%"><b>发起时间：${newMap.create_date }&nbsp;&nbsp;&nbsp;办理期限：${newMap.end_time } &nbsp;&nbsp;&nbsp;办理进度：<c:if test="${newMap.status eq 0}">待办</c:if><c:if test="${newMap.status eq 1}">在办</c:if><c:if test="${newMap.status eq 2}">已办</c:if><c:if test="${newMap.status eq 3}">超时完结</c:if> </b></td>
          </tr>
          <tr style="height:50px;">
	          <td><hr/></td>
          </tr>
        </table>
      </div>
      <div id="content" style="margin-bottom:10px;background-color:white;color:black;padding-right:50px;padding-left:50px;">
         	${newMap.content }
      </div>
      
      <c:forEach items="${detailList }" var="ele" varStatus="i">
      <div id="detailList">
      	<div class="detailItem">
      		<h1>办理进度${i.index+1}</h1>
      		<div class="detailHeader">
      			<strong>经办科室：${ele.deptName}</strong>
      			<strong>经办人：${ele.user_name}</strong>
      			<strong>办理时间：${ele.create_time}</strong>
      		</div>
      		<div class="detailFooter">
      			办理情况：${ele.content }
      		</div>
      	</div>
      </div>
      </c:forEach>
      <c:if test="${newMap.status lt 2}">
	      <div id="dealJob" style="overflow:hidden;">
        	<a href="javascript:void(0)"  onclick="doJob('${jobId}');" class="easyui-linkbutton" data-options="iconCls:'icon-search'" style="width:100px;margin:20px auto;display:block;height:30px;line-height:30px;background:#ececec;border-radius:4px;text-align:center;">办结</a>
	      </div>
      </c:if>
    </div>
</div>
<iframe class="bot"  frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes" src="index/bottom.do" widht="100%" ></iframe>
</div>
<script type="text/javascript">
	function doJob(jobId){
		window.location.href="../cahgJob/toResult.do?jobId="+jobId;
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