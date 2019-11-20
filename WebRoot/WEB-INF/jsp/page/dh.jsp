<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<base href="<%=basePath%>">
<link rel="stylesheet" type="text/css" href="static/css/menu.css">
<link href="static/css/index_1.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="static/js/jquery.js"></script>

<link rel="stylesheet" type="text/css" href="static/js/easyui/themes/default/easyui.css">
<script type="text/javascript" src="static/js/easyui/jquery.min.js"></script>
<script type="text/javascript" src="static/js/easyui/jquery.easyui.min.js"></script>
<link rel="stylesheet" type="text/css" href="static/js/easyui/themes/icon.css">
<title>Insert title here</title>

</head>
<body>
<div class="top">

  <div class="top-wrap">

    <div class="log">

     <img id="img1" id="img1" src="static/images/cahg1.gif"/> 

<!-- <embed  menu="true" loop="true" width="1005px" height="255px;	" play="true" type="application/x-shockwave-flash"  src="static/images/cahg1.swf"></embed>
 -->    </div>
    <div id="page-wrap" class="blue">
                    <!-- jDropDown menu -->
                    <ul id="jDropDown">
                   <!--        <li class="img"><a href="/rlzyj/index.shtml" target="_parent"><img src="static/picture/home.png" /></a></li> -->
                        <li class="hx" id="hx"></li>
                        <li><a href="index/page.do" target="_parent" class="_xxgk">首页</a>
                     	 </li>
                     	  <li class="hx"></li>
                        <li><a href="cahgIntro/toIntroPage.do"  target="_parent">简介</a>
                        </li>
                        <li class="hx"></li>
                        <li><a href="cahgLetter/letterShow.do"  target="_parent">关长信箱</a>
                        
                        <li class="hx"></li>
                        <li><a href="http://10.56.1.128/HBPlusWebApp/HidealCloud/"  target="_parent">HB2012</a>
                        
                        </li><li class="hx"></li>
                        <li><a href="http://10.56.2.115/HBWebApp/HB2004Portal/default.aspx"  target="_parent">HB2004</a>
                      
                        </li>
                        <li class="hx"></li>
                        <li><a href="cahgAddressLook/addressLookShowPage.do?dept_id=38"  target="_parent">通讯录</a>
						
                        </li>
                        <li class="hx"></li>
                        <li>
                            <a href="http://10.56.65.100/CAHGAdmin"  target="_blank">登录</a>
                           
                        </li>
                        
                        <li class="hx"></li>
                        
                        <li><a href="javascript:void(0);"  target="_parent">${sysDate }</a>
                       
                        </li>
                  </ul>
                  
                  
                  
                  <div class="suos" >
                  	<select name="" id="titleType" class="searchType"> 
						<c:forEach items="${newTypeList}" var="ele">
 				 			<option value="${ele.parameter }">${ele.value }</option> 
 				 		</c:forEach>
					</select>
					<input id="newTitle" placeholder='标题、时间'>
					<a class="searchBtn" href="javascript:void(0)" onclick="checkSubmit()">搜索</a>

        </div>
    </div>
  
  </div>
</div>

<script type="text/javascript">

$(document).ready(function(){
	  
	 /*   $("#img1").fadeToggle(5000);
	   $("#img1").fadeToggle(5000);
	 */
	 
});

	function checkSubmit(){
		var titleType = "";
		var title = "";

		var obj = document.getElementById("titleType"); //定位id
		var index = obj.selectedIndex; // 选中索引
		type = obj.options[index].value; // 选中值
		title=document.getElementById("newTitle").value;
		if(title=="" || title=="标题、时间"){
			alert("请输入需要查询的值");
			return false;
		}
		
		
		var path = getContextPath();
		var url = path+"/index/indexSelect.do?title="+encodeURI(title)+"&type="+type;
		window.open(encodeURI(url));
		
	}
	function getContextPath() {
	    var pathName = document.location.pathname;
	    var index = pathName.substr(1).indexOf("/");
	    var result = pathName.substr(0,index+1);
	    return result;
	  }
</script>
</body>
</html>