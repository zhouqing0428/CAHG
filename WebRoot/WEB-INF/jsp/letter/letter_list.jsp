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
<title></title>
<link rel="stylesheet" type="text/css" href="static/css/menu.css">
<link href="static/css/index_6.css" rel="stylesheet" type="text/css" />
<link href="static/css/page.css" rel="stylesheet" type="text/css" />
<link href="static/css/common.css" rel="stylesheet" />
<style type="text/css">
#new_title{  
		display: block;
		width: 700px; /* li 的宽度 这个控制显示多少字后显示...设的宽度大于字数时， 是不会显示...的 */
		overflow: hidden;
		white-space: nowrap;
		-o-text-overflow: ellipsis;
		text-overflow: ellipsis;
	  }  
</style>
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
	$('.page3').createPage(function(n){
	},{
		pageCount:20,//总页码,默认10
		showPrev:false,//是否显示上一页按钮
		showNext:false,//是否显示下一页按钮
		showTurn:false,//是否显示跳转,默认可以
		showNear:4,//显示当前页码前多少页和后多少页，默认2
		showSumNum:false//是否显示总页码
	},{
		"color":"#0f0",//字体颜色
		"borderColor":"#00f",//边线颜色
		"currentColor":"#ed601b"//当前页码的字体颜色
	});
</script>
</head>
<body>
 <div id="main">
 	<!-- <iframe class="top" id="topif" name="topif" frameborder="0" scrolling="no" src="index/head.do" widht="100%" height="280px;"></iframe> -->
  	<div class="top"></div>
    <div class="cen-div color mar-t">
      <div class="con_title_left fl_left">
		        <div class=" font24 padd-b">
		          <div class="list_left_title">
		             关长信箱
		          </div>
		        </div>
		        <div class="font2 dgrey"><img  src="static/picture/wz.png" class="padd-r"/>您现在的位置 :  
		<a href='index/page.do'  target="_parent">首页</a>&nbsp;>&nbsp;关长信箱
		</div>   
      </div>
      <div class="cen-div-1 mar-t">
        <dl class="con-left fl">
       		<dt>关长信箱</dt>
			<dd class="curr">
				<a href="cahgLetter/letterShow.do" target="_parent" title='基本概况' >关长信箱</a>
			</dd>
       	</dl>
        <div class="con-right fr mar-l-2">
        	<table>
         		<tr>
         			<td style="font-size:18px;color:blue;text-align:center;height:40px;line-height:40px;">“关长信箱”写信通知</td>
         		</tr>
         		<tr>
         			<td style="color:red;line-height:24px;">
         				${attentive.content }
         			</td>
         		</tr>
         		<tr></tr><tr></tr><tr></tr>
         		
         		<tr>
         			<td align="right">东莞长安海关</td>
         		</tr>
         	</table>
        <table width="100%" style="table-layout: fixed;margin-top:50px;" >        	
        		<tr>
        			<c:forEach items="${letterList }" var="ele" varStatus="i">
        				<c:if test="${i.index < 4 }">
        					<td align="center" style="width:25%;background-color: #1c649f;height:40px;line-height:40px;color: #fff"><a style="color:#fff" href="cahgLetter/updatePage.do?to_user_id=${ele.user_id }">${ele.remark}</a></td>
        					<td>    </td>
        				</c:if>
        			</c:forEach>
        		</tr>
        		<tr>
        			<c:forEach items="${letterList }" var="ele" varStatus="i">
        				<c:if test="${i.index < 4 }">
        				<td style="width:25%;" ><a href="cahgLetter/updatePage.do?to_user_id=${ele.user_id }"><img style="width:100%" height="180px;" src="http://10.56.65.100/file/upImg/userPhoto/${ele.photo}" /></a></td>
        				<td>    </td>
        				</c:if>
        			</c:forEach>
        		</tr>
        		<tr>
        			<c:forEach items="${letterList }" var="ele" varStatus="i">
        				<c:if test="${i.index < 4 }">
        				<td style="width:25%;" align="center"><a href="cahgLetter/updatePage.do?to_user_id=${ele.user_id }">${ele.intro}</a></td>
        				<td>    </td>
        				</c:if>
        			</c:forEach>
        		</tr>

        		
        		
        		
        		
        		
        		<tr>
        			<c:forEach items="${letterList }" var="ele" varStatus="i">
        				<c:if test="${i.index >= 4 and i.index<8}">
        					<td align="center" style="width:25%;background-color: #1c649f;height:40px;line-height:40px;color: #fff"><a style="color:#fff" href="cahgLetter/updatePage.do?to_user_id=${ele.user_id }">${ele.remark}</a></td>
        					<td>    </td>
        				</c:if>
        			</c:forEach>
        		</tr>
        		<tr>
        			<c:forEach items="${letterList }" var="ele" varStatus="i">
        				<c:if test="${i.index >= 4 and i.index<8}">
        				<td style="width:25%;" ><a href="cahgLetter/updatePage.do?to_user_id=${ele.user_id }"><img style="width:100%" height="180px;" src="http://10.56.65.100/file/upImg/userPhoto/${ele.photo}" /></a></td>
        				<td>    </td>
        				</c:if>
        			</c:forEach>
        		</tr>
        		<tr>
        			<c:forEach items="${letterList }" var="ele" varStatus="i">
        				<c:if test="${i.index >= 4 and i.index<8}">
        				<td style="width:25%;" align="center"><a href="cahgLetter/updatePage.do?to_user_id=${ele.user_id }">${ele.intro}</a></td>
        				<td>    </td>
        				</c:if>
        			</c:forEach>
        		</tr>
        		
        	</table>
        </div>
        <div class="con-right fr mar-l-2">
        	
 			<div id="list" style="margin-left:40px;margin-top:50px;">
 				
 			</div>
 			<div class="page"  style="width:100%; margin-top:50px;"></div> 
        </div>
      </div>
    </div>
            <iframe class="bot"  frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes" src="index/bottom.do" widht="100%" ></iframe>
      </div> 
<script>
	var pageCount = '${pageCount}';
	var count = '${count}';
	$('.page').createPage(function(curPage){
		$.ajax({
		    url:"cahgLetter/letterList.do",
		    dataType : "json", 
		    method:"post",
		    async: true,  
		    data: {curPage:curPage},
		    success:function(data){
		    	var html = "";
		     	for(var i=0;i<data.list.length;i++){
		    		html += "<div class='list_div mar-top2' >" +
		    				"<a  href='cahgLetter/reply.do?letter_id="+data.list[i].letter_id+"' target='_blank'  >"+
		    				" <div class='list-right_title fon_1'><b id='new_title'>对《"+data.list[i].title+"》的答复</b></div>" +
		    				" <table width='98%' border='0' align='center' cellpadding='0' cellspacing='0' style='margin-top:10px; color:#9E9E9E;'>" +
		    				" <td width='50%' align='left'><b>回复时间："+data.list[i].create_date+"</b></td>" +
		    				"<td width='50%' align='right' ><span class='column-name'><b>主任："+data.list[i].user_name+"</b></span></td>"+
		    				"</tr></table></a></div>";
		    	}
		     	$("#list").html(html);
		    }
		 });
		
	},{
		count:count,
		pageCount:pageCount,//总页码,默认10
		showNear:3//显示当前页码前多少页和后多少页，默认2
	}); 
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