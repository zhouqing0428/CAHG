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
<link href="static/css/common.css" rel="stylesheet" />
<script type="text/javascript" src="js/dropdown.class.demo_3.js"></script>
<script type="text/javascript" src="static/js/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="static/css/menu.css">
<link href="static/css/index_6.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="main">
<!-- <iframe class="top" id="topif" name="topif" frameborder="0" scrolling="no" src="index/head.do" widht="100%" height="280px;"></iframe> -->
  	<div class="top"></div>
  <div style="background-color: #fff"> 
    <div class="cen-div color mar-t" >
      
      <div class="con_title_left_c fl_left"> 
      	<div class="fl"><div class="font2 dgrey"><img  src="static/picture/wz.png" class="padd-r"/>您现在的位置 :  
<a href='index/page.do'  target="_parent">首页</a>&nbsp;>&nbsp;<a href='cahgSpecialTopic/specialTopicListPage.do?url=${newMap.special_topic_category_id }'  target="_parent">${newMap.category_name}列表</a>&nbsp;>&nbsp;<a href=''  target="_parent">${newMap.category_name }</a>
</div></div>
      </div>
      
      <div class="con_title mar-t2 text" >
        <h4 style="margin:20px;" align="center">${newMap.title }</h4>
      </div>
      
      <div class="line mar-t2 hov">
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style=" padding-left:10px; padding-right:10px;color:#666666;">
          <tr>
            <td align="center" width="100%"><b>作者：${newMap.author}&nbsp;&nbsp;&nbsp;发表时间：${newMap.create_date }&nbsp;&nbsp;&nbsp;</b></td>
          </tr>
          <tr>
          	<td align="center" style="height:50px;"><a href="">${newMap.file_old_name }</a>&nbsp;&nbsp;&nbsp;<a href="http://10.56.65.100/file/upImg/file/${newMap.file_old_name}" target="_blank">【下载】</a></td>
          </tr>
        </table>
        <p><a href="">${newMap.file_old_name }</a></p>
      </div>
      
      <div id="content" style="margin-top:10px;background-color:white;color:black">
         	${newMap.content }
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