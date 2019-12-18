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
<body >
<script type="text/javascript" src="js/dropdown.class.demo_3.js"></script>
<link rel="stylesheet" type="text/css" href="static/css/menu.css">
<link href="static/css/index_6.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="static/js/jquery.js"></script>
<link href="static/layui/css/layui.css" rel="stylesheet">
<script src="static/layui/layui.all.js"></script>
<style type="text/css">
table{margin: 0 auto}

</style>
<div id="main">
<!-- <iframe class="top" id="topif" name="topif" frameborder="0" scrolling="no" src="index/head.do" widht="100%" height="280px;"></iframe> -->
  	<div class="top"></div>
  	<div style="background-color: #fff">  
    <div class="cen-div color mar-t">
      <div class="con_title_left_c fl_left"> 
      	<div class="fl"><div class="font2 dgrey"><img  src="static/picture/wz.png" class="padd-r"/>您现在的位置 :  
<a href='index/page.do'  target="_parent">首页</a>&nbsp;>&nbsp;<a href='cahgMeetingNotice/meetingNoticeListPage.do'  target="_parent">会议通知列表</a>&nbsp;>&nbsp;<a href=''  target="_parent">会议通知</a>
</div></div>
      </div>
      <div class="con_title mar-t2 text">
        <h4 style="margin:20px auto;width:70%;" align="center">${newMap.title }</h4>
      </div>
      <div class="line mar-t2 hov">
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="padding-left:10px; padding-right:10px;color:#666666;">
          <tr>
            <td align="center" width="100%"><b>科室：${newMap.dept_name}&nbsp;&nbsp;&nbsp;发文人：${newMap.author}&nbsp;&nbsp;&nbsp;发表时间：${newMap.create_date }</b></td>
          </tr>
            <tr style="height:50px;">
		          	<td><hr/></td>
		    </tr>
        </table>
      </div>
      <div id="content"  style="margin-top:10px;color:black;padding-right:50px;padding-left:50px;">
         	<c:if test="${not empty newMap.content}">
         	${newMap.content }
         	</c:if>
         	<c:if test="${empty newMap.content}">
         	<table id="Table1" style="width:75%;margin:10px auto 30px;padding:0px; border-collapse:collapse;font-size:16px;">
         		<tbody>
         		<tr>
         			<td style="border:1px solid;line-height:50px;text-align:center;font-weight: bold;" width="81"><span>会议名称</span></td>
         			<td width="85%" style="padding-left:10px;" align="left"><span id="_ctl1__ctl0__ctl0_MNameLb">${newMap.title }</span>&nbsp;</td>
         		</tr>
         		<tr>
         			<td style="border:1px solid;line-height:50px;text-align:center;font-weight: bold;" width="81"><span>会议时间</span></td>
         			<td style="padding-left:10px;"><span id="_ctl1__ctl0__ctl0_MTimeLb">${newMap.meeting_time }</span>&nbsp;</td>
         		</tr>
         		<tr>
         			<td style="border:1px solid;line-height:50px;text-align:center;font-weight: bold;" width="81"><span>会议地点</span> </td>
         			<td style="padding-left:10px;"><span id="_ctl1__ctl0__ctl0_MLocationLb">${newMap.meeting_place }</span>&nbsp;</td>
         		</tr>
         		<tr>
         			<td style="border:1px solid;line-height:50px;text-align:center;font-weight: bold;" width="81"><span>参加部门</span> </td>
         			<td style="padding-left:10px;"><span id="_ctl1__ctl0__ctl0_MDepLb">${newMap.meeting_dep }</span>&nbsp;</td>
         		</tr>
         		<tr>
         			<td style="border:1px solid;line-height:50px;text-align:center;font-weight: bold;" width="81" height="30"><span>参加人员</span> </td>
         			<td height="30" style="padding-left:10px;"><span id="_ctl1__ctl0__ctl0_MPeopleLb">${newMap.meeting_person }</span>&nbsp;</td>
         		</tr>
         		<tr>
         			<td style="border:1px solid;line-height:50px;text-align:center;font-weight: bold;"><span>会议要求</span> </td>
         			<td style="padding-left:10px;"><span id="_ctl1__ctl0__ctl0_MContentLb">${newMap.meeting_require }</span>&nbsp;</td>
         		</tr>
         		<tr>
         			<td style="border:1px solid;line-height:50px;text-align:center;font-weight: bold;" width="81"><span>联 系 人</span> </td>
         			<td style="padding-left:10px;"><span id="_ctl1__ctl0__ctl0_ContackLb">${newMap.meeting_contact }</span>&nbsp;</td>
         		</tr>
         	</tbody>
         </table>
         </c:if>
         <p><br/></p>
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