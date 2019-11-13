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
<link href="static/css/index.css" rel="stylesheet"/>
<link href="static/css/page.css" rel="stylesheet" type="text/css" />
<link href="static/css/common.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="static/js/easyui/themes/default/easyui.css">
<script type="text/javascript" src="static/js/easyui/jquery.min.js"></script>
<script type="text/javascript" src="static/js/easyui/jquery.easyui.min.js"></script>
<link rel="stylesheet" type="text/css" href="static/js/easyui/themes/icon.css">
<link rel="stylesheet" href="static/kindeditor-4.1.7/themes/default/default.css"/>
<script charset="utf-8" src="static/kindeditor-4.1.7/kindeditor.js"></script>
<script charset="utf-8" src="static/kindeditor-4.1.7/lang/zh_CN.js"></script>
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

<script type="text/javascript">	
function letter(){
	var to_user_id = $("#to_user_id").textbox('getValue');
	var author = $("#author").textbox('getValue');
	var duty_name = $("#duty_name").textbox('getValue');
	var dept_name = $("#dept_name").textbox('getValue');
	var title = $("#title").textbox('getValue');
	var content =  editor.html();
	if(title==null || title==""){
		$.messager.show({  
            title: '提示',  
            msg: '请填写标题',  
            timeout: 1500,  
          showType: 'fade',
      style:{
			right:'',
			bottom:''
		} 
  });
	return false;
}
	if(content==null || content==""){
			$.messager.show({  
	            title: '提示',  
	            msg: '请填写内容',  
	            timeout: 1500,  
	          showType: 'fade',
	      style:{
				right:'',
				bottom:''
			} 
	  });
		return false;
	}
	/* $('#letterForm').serialize() */
	if(author==null || author ==""){
		$.messager.confirm("提示", "是否确定该信件为匿名发送", function (re) {  
			if (re) {  
				$.ajax({
			        type: "POST",
			        url:'cahgLetter/addLetter.do',
			        data:{to_user_id:to_user_id,author:author,duty_name:duty_name,dept_name:dept_name,title:title,content:content},// 你的formid
			        async: false,
			        error: function(request) {
			            alert("错误，请联系管理员");
			        },
			        success: function(data) {
			        
				        	$.messager.show({  
				                 title: '提示',  
				                 msg: '发送成功',  
				                 timeout: 1500,  
				               showType: 'fade',
			               style:{
								right:'',
								bottom:''
							} 
			           });
			        }
			    });
			}
		});
	}
	if(author!=null && author !=""){
		$.messager.confirm("提示", "该信件为实名发送", function (re) {  
			if (re) {  
				$.ajax({
			        type: "POST",
			        url:'cahgLetter/addLetter.do',
			        data:{to_user_id:to_user_id,author:author,duty_name:duty_name,dept_name:dept_name,title:title,content:content},
			        async: false,
			        error: function(request) {
			            alert("错误，请联系管理员");
			        },
			        success: function(data) {
			        	
				        	$.messager.show({  
				                 title: '提示',  
				                 msg: '发送成功',  
				                 timeout: 1500,  
				               showType: 'fade',
			               style:{
								right:'',
								bottom:''
							} 
			           });
			        }
			    });
			}
		});
	} 
}
</script>

</head>
<body>
<link rel="stylesheet" type="text/css" href="static/css/menu_3.css">
<link href="static/css/index_6.css" rel="stylesheet" type="text/css" />
 <div id="main">
 	<iframe style="margin-top:-4px;"  class="top" frameborder="0" scrolling="no" src="index/head.do" widht="100%" height="180px;"></iframe>
    <div class="cen-div color mar-t">
      <div class="con_title_left fl_left">
		        <div class=" font24 padd-b">
		          <div class="list_left_title">
		            东莞长安海关
		          </div>
		        </div>
		        <div class="font2 dgrey"><img  src="static/picture/wz.png" class="padd-r"/>您现在的位置 :  
		<a href='index/page.do'  target="_parent">首页</a>&nbsp;>&nbsp;<a href="cahgLetter/letterShow.do	">东莞长安海关-关长信箱</a>-编辑信件
		</div>   
      </div>
      <div class="cen-div-1 mar-t">
        <div style="width:200px;" class="con-left fl">
         	<table>
         		<tr>
         			<td style="font-size:18px;color:blue;">“关长信箱”写信通知</td>
         		</tr>
         		<tr>
         			<td style="color:red;">1:给关领导写信鼓励署实名，对署实名的来信，关领导将亲自或委托有关部门回复
         			(如需保密，有关部门将直接回复写信人)，并严格为来信人保密，防止和禁止打击报复的事情发生，
         			对匿名信件，将视情况回复，若得不到回复，请来信人谅解。</td>
         		</tr>
         		<tr></tr><tr></tr><tr></tr>
         		<tr>
         			<td style="color:red;">2:写信时以应持互相尊重、严肃认真的态度，注重文明礼貌。</td>
         		</tr>
         		<tr></tr><tr></tr><tr></tr>
         		<tr>
         			<td style="color:red;">3:希望大家积极参与，多提宝贵建议，共同把关把信箱维护好，使用好.</td>
         		</tr>
         		<tr>
         			<td align="right">东莞长安海关</td>
         		</tr>
         	</table>
        </div>
        
        
        <div class="con-right fr mar-l-2" align="center">
        	  <h4 style="margin:20px;" align="center">转至"${remark.remark}"的信件</h4>
 			<div id="list" style="align:center;">
 				<form id="letterForm" action="" method="post">
 				<table>
 					<tr style="display:none">
 						<td><input class="easyui-textbox" name="to_user_id" id="to_user_id" value="${to_user_id}"></td>
 					</tr>
 					<tr>
 						<td align="right">写信人姓名:</td>
 						<td><input class="easyui-textbox" type="text" id="author" name="author" style="width:555px;"></td>
 					</tr>
 					<tr>
 						<td align="right">写信人职务:</td>
 						<td><input class="easyui-textbox" type="text" id="duty_name" name="duty_name" style="width:555px;"></td>
 					</tr>
 					<tr>
 						<td align="right">写信人所属科室:</td>
 						<td><input class="easyui-textbox" type="text" id="dept_name" name="dept_name" style="width:555px;"></td>
 					</tr>
 					<tr>
 						<td align="right">信件标题:</td>
 							<td><input class="easyui-textbox" type="text" id="title" name="title" style="width:555px;"></td>
 					</tr>
 					<tr>
 						<td align="right">信件内容:</td>
 						<td> <textarea id="content" name="content" style="width:555px;height:200px;"></textarea></td>
 					<!-- 	<td><input class="easyui-textbox" id="content" name="content" data-options="multiline:true" style="width:200%;height:150px;"></td> -->
 					</tr>
 					<tr>
 						<td></td>
 						<td><a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="letter();" style="width:80px">确定</a></td>
 					</tr>
 				</table>
 				</form>
 			</div>
 			
        </div>
      </div>
    </div>
             <iframe class="bot"  frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes" src="index/bottom.do" widht="100%" ></iframe>
      </div> 
<script type="text/javascript">
KindEditor.ready(function(K) {
    window.editor = K.create('#content',{  
        width:'90%',  
        height:'250px',  
        items:[  
           'code', 'cut', 'copy', 'paste',  
           'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',  
           'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',  
           'superscript', 'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen', '/',  
           'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',  
           'italic', 'underline', 'lineheight', 'removeformat', '|', 'image', 'multiimage',  
           'flash', 'media', 'insertfile', 'table', 'hr', 'emoticons', 'baidumap', 'pagebreak',  
           'anchor', 'link', 'unlink'  
        ],  
        
        /* 制定上传方法 */  
        uploadJson :'static/js/kindeditor-4.1.7/jsp/upload_json.jsp',  
        /* 图片管理器的路径 */  
        fileManagerJson : 'static/js/kindeditor-4.1.7/jsp/file_manager_json.jsp',  
        allowFileManager : true 
      });
 });
</script>
</body>
</html>