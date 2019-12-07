<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

	<div class="top-wrap">
	    <div class="log">
	    	<img id="img1" id="img1" src="static/images/cahg1.gif"/>
	    </div>
		<div id="page-wrap" class="blue">
			<ul id="jDropDown">
				<li>
					<a href="index/page.do" target="_parent" class="_xxgk">首页</a>
				</li>
				<li>
					<a href="cahgIntro/toIntroPage.do" target="_parent">&nbsp;&nbsp;简介&nbsp;&nbsp;</a>
					<dl class="slideList">
						<dd><a href="dept/dept_left.do" target="_parent">制度建设</a></dd>
						<dd><a href="cahgIntro/toIntroPage2.do" target="_parent">工作亮点</a></dd> 
					</dl>
				</li>
				<li>
					<a href="cahgLetter/letterShow.do" target="_parent">关长信箱</a>
				</li>
				<li>
					<a href="cahgDutySchedule/dutyDetailsShow.do?type=1" target="_parent">值班安排</a>
				</li>
				<li>
					<a href="cahgAddressLook/addressLookShowPage.do?dept_id=8" target="_parent">通讯录</a>
				</li>
				<li>
					<a href="javascript:void(0)">常用链接</a>
					<dl class="slideList">
						<dd><a href="http://10.56.1.128/HBPlusWebApp/HidealCloud/"  target="_parent">HB2012</a></dd>
						<dd><a href="http://10.56.2.115/HBWebApp/HB2004Portal/default.aspx"  target="_parent">HB2004</a></dd> 
						<dd><a href="http://10.99.108.62/portal/home/welcomepage/welcomepage.jsp" target="_parent">考勤系统</a></dd> 
						<dd><a href="http://10.56.1.186/HPZBPortal/Default.aspx" target="_parent">综保平台</a></dd> 
						<dd><a href="commomForm/commomFormsListPage.do?type=0" target="_blank">表格下载</a></dd> 
						<c:if test="${not empty traffic}">
							<dd><a href="http://10.56.65.100/file/upImg/commonforms/${traffic.file_name }" target="_blank">交通路线</a></dd> 
						</c:if>
					</dl>
				</li>
				<li>
					<a href="http://10.56.65.100/CAHGAdmin"  target="_blank">登录</a>
				</li>
				<li>
					<a href="javascript:void(0);"  target="_parent">${sysDate }</a>
				</li>
			</ul>
			<div class="suos" >
				<select name="" id="titleType" class="searchType"> 
					<c:forEach items="${newTypeList}" var="ele">
						<option value="${ele.parameter }">${ele.value }</option> 
					</c:forEach>
				</select>
				<input id="newTitle" placeholder='标题、时间' autocomplete="off">
				<a class="searchBtn" href="javascript:void(0)" onclick="checkSubmit()">搜索</a>
		    </div>
		</div>
	</div>

<script type="text/javascript">
function checkSubmit(){
	var titleType = "";
	var title = "";
	var obj = document.getElementById("titleType"); //定位id
	var index = obj.selectedIndex; // 选中索引
	type = obj.options[index].value; // 选中值
	title=document.getElementById("newTitle").value;
	if(title=="" || title=="标题、时间"){
		layui.layer.alert('请输入需要查询的值', {
			  icon: 2,
			  skin: 'layer-ext-moon' //该皮肤由layer.seaning.com友情扩展。关于皮肤的扩展规则，去这里查阅
			});
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