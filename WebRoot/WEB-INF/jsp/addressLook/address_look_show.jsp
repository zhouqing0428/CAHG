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
<script type="text/javascript" src="static/js/jquery.js"></script>
<link href="static/layui/css/layui.css" rel="stylesheet">
<script src="static/layui/layui.all.js"></script>
<script type="text/javascript">	
	$(document).ready(function(){
		$(".con-left a").each(function(){
			if($.trim($(this).text())==$.trim($(".div1").text())){
				$(this).addClass("linow");
			}
		})
	});
</script>
</head>
<body>
 <div id="main">
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
      	<div class="con-left fl"></div>
		<c:if test="${!empty deptAddress.data_path}">
			<p align="right"><a href="http://10.56.65.100/file/upImg/fileload/${deptAddress.data_path}"><span style="color:red;">点击下载：${deptAddress.file_names }</span></a></p>
		</c:if>
      <div class="con-right fr mar-l-2" style="width:665px;">
		<div id="list" >
			<div class="con_title mar-t2 text">
				<h4 id="deptName" align="center"></h4>
			</div>
			<div id="content">
				<p id="deptRemark" style="white-space:pre-line;font-weight: bold;font-size: 14px;margin-top: 15px;"></p>
				<table id="myTable" co style="width:100%;margin:30px auto 30px;padding:0px; border-collapse:collapse;">
					<thead>
						<tr style="background:#2b67ac;">
							<td style="border:1px solid;line-height:50px;font-size:14px;text-align:center;"><span style="color:#fff;">序号</span></td>
							<td style="border:1px solid;line-height:50px;font-size:14px;text-align:center;"><span style="color:#fff;">姓名</span></td>
							<td style="border:1px solid;line-height:50px;font-size:14px;text-align:center;"><span style="color:#fff;">工号</span></td>
							<td style="border:1px solid;line-height:50px;font-size:14px;text-align:center;"><span style="color:#fff;">科室</span></td>
							<td style="border:1px solid;line-height:50px;font-size:14px;text-align:center;"><span style="color:#fff;">职务</span></td>
							<td style="border:1px solid;line-height:50px;font-size:14px;text-align:center;"><span style="color:#fff;">办工内线</span></td>
							<td style="border:1px solid;line-height:50px;font-size:14px;text-align:center;"><span style="color:#fff;">办工外线</span></td>
						</tr>
					</thead>
					<tbody>
						
					</tbody>
				</table>
			</div>
		</div>
      </div>
 </div>
    
   	<iframe class="bot" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes" src="index/bottom.do" widht="100%" ></iframe>
    
  </div>
  <script>
  	var deptList = '${depts}';
  	deptList = JSON.parse(deptList);
  	getSlideMenu();
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
  	function getTableData(_id){
  		alert("晴姐接口写这里"+_id)
  		$.ajax({
  		    url:"index/head.do",
  		    dataType : "html", 
  		    method:"post",
  		    async: true,  
  		    data: {},
  		    success:function(data){
  		    	var html = ""
  		    	if(data.length > 0){
  		    		for(var i = 0; i < 10; i++){
  		    			html += '<tr>';
  		    				html += '<td style="border:1px solid;line-height:35px;font-size:12px;text-align:center;">'+ i +'</td>';
  		    				html += '<td style="border:1px solid;line-height:35px;font-size:12px;text-align:center;">张三_'+ _id +'</td>';
  		    				html += '<td style="border:1px solid;line-height:35px;font-size:12px;text-align:center;">工号_'+ _id +'</td>';
  		    				html += '<td style="border:1px solid;line-height:35px;font-size:12px;text-align:center;">科室_'+ _id +'</td>';
  		    				html += '<td style="border:1px solid;line-height:35px;font-size:12px;text-align:center;">职务_'+ _id +'</td>';
  		    				html += '<td style="border:1px solid;line-height:35px;font-size:12px;text-align:center;">办工内线_'+ _id +'</td>';
  		    				html += '<td style="border:1px solid;line-height:35px;font-size:12px;text-align:center;">办工外线_'+ _id +'</td>';
  		    			html += '</tr>';
  		    		}
  		    	}else{
  		    		html += '<tr>';
  		    			html += '<td style="border:1px solid;line-height:35px;font-size:12px;text-align:center;" colspan="7">该科室下暂无人员信息</td>';
  		    		html += '</tr>';
  		    	}
  		    	$("#deptName").text("科室名称");
  		    	$("#deptRemark").text("科室备注");
  		    	$("#myTable tbody").html(html);
  		    }
  		 });
  	}
  </script>
</body>
</html>