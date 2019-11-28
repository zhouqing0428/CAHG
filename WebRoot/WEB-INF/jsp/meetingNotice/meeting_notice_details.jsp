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
        <h4 style="margin:20px;" align="center">${newMap.title }</h4>
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
         	
         	<table id="Table1" cellspacing="0" cellpadding="2" width="500" align="center">
         		<tbody>
         		<tr class="firstRow">
         			<td colspan="2" align="middle"><span style="font-size:24px;font-family:宋体">会议通知</span></td>
         		</tr>
         		<tr>
         			<td style="" width="81" align="right"><span style="font-family:宋体">会议名称</span></td>
         			<td width="85%" align="left"><span id="_ctl1__ctl0__ctl0_MNameLb">${newMap.title }</span>&nbsp;</td>
         		</tr>
         		<tr>
         			<td style="" align="right" width="81"><span style="font-family:宋体">会议时间</span></td>
         			<td><span id="_ctl1__ctl0__ctl0_MTimeLb">${newMap.meeting_time }</span>&nbsp;</td>
         		</tr>
         		<tr>
         			<td style="" align="right" width="81"><span style="font-family:宋体">会议地点</span> </td>
         			<td><span id="_ctl1__ctl0__ctl0_MLocationLb">${newMap.meeting_place }</span>&nbsp;</td>
         		</tr>
         		<tr>
         			<td style="" align="right" width="81"><span style="font-family:宋体">参加部门</span> </td>
         			<td><span id="_ctl1__ctl0__ctl0_MDepLb">${newMap.meeting_dep }</span>&nbsp;</td>
         		</tr>
         		<tr>
         			<td align="right" width="81" height="30"><span style="font-family:宋体">参加人员</span> </td>
         			<td height="30"><span id="_ctl1__ctl0__ctl0_MPeopleLb">${newMap.meeting_person }</span>&nbsp;</td>
         		</tr>
         		<tr>
         			<td align="right"><span style="font-family:宋体">会议要求</span> </td>
         			<td><span id="_ctl1__ctl0__ctl0_MContentLb">${newMap.meeting_require }</span>&nbsp;</td>
         		</tr>
         		<tr>
         			<td style="" align="right" width="81"><span style="font-family:宋体">联 系 人</span> </td>
         			<td><span id="_ctl1__ctl0__ctl0_ContackLb">${newMap.meeting_contact }</span>&nbsp;</td>
         		</tr>
         	</tbody>
         </table>
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