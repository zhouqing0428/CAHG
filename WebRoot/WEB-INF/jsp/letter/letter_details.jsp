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
<title></title>
</head>
<body>
<script type="text/javascript" src="js/dropdown.class.demo_3.js"></script>
<link rel="stylesheet" type="text/css" href="static/css/menu.css">
<link href="static/css/index_6.css" rel="stylesheet" type="text/css" />
<div id="main">
<!-- <iframe class="top" id="topif" name="topif" frameborder="0" scrolling="no" src="index/head.do" widht="100%" height="280px;"></iframe> -->
  	<div class="top"></div>
<div style="background-color: #fff">  
    <div class="cen-div color mar-t">
      <div class="con_title_left_c fl_left"> 
      	<div class="fl"><div class="font2 dgrey"><img  src="static/picture/wz.png" class="padd-r"/>您现在的位置 :  
<a href='index/page.do'  target="_parent">首页</a>&nbsp;>&nbsp;<a href='cahgLetter/letterShow.do'  target="_parent">信箱列表</a>&nbsp;>&nbsp;<a href=''  target="_parent">信件回复</a>
</div></div>
      </div>
      <div class="con_title mar-t2 text">
        <h4 style="margin:20px;" align="center"></h4>
      </div>
      <div class="line mar-t2 hov">
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="padding-left:10px; padding-right:10px;color:#666666;">
          <%-- <tr>
            <td align="center" width="100%"><b>主任：${newMap.user_name}&nbsp;&nbsp;&nbsp;回复时间：${newMap.create_date }&nbsp;&nbsp;&nbsp;</b></td>
          </tr> --%>
          <tr style="height:50px;">
		          	<td><hr/></td>
		          </tr>
        </table>
      </div>
      <div  style="margin-top:10px;color:black;padding-right:50px;padding-left:50px;">
         	<h1 align="center">信件内容</h1>
         	<p align="center">${letterMap.content }</p>
      </div>
      <div align="center" style="margin-top:40px;color:black;padding-right:50px;padding-left:50px;">
      <h1 align="center">主任回复</h1>
      <c:forEach items="${newMap}" var="ele">
      	<h3 align="center">回复标题：${ele.title }</h3>
         <p align="center">回复时间：${ele.create_date }</p>
      	 <p align="center">${ele.content }</p>
      </c:forEach>	
      </div>
    </div>
   </div>
   <iframe class="bot"  frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes" src="index/bottom.do" widht="100%" ></iframe>
  </div>
</body>
</html>

<script>
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