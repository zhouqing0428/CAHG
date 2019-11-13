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
<title>值班表</title>
<link href="static/css/index.css" rel="stylesheet"/>
<link href="static/css/page.css" rel="stylesheet" type="text/css" />
<link href="static/css/common.css" rel="stylesheet" />
<script type="text/javascript" src="static/js/jquery.js"></script>

<link rel="stylesheet" type="text/css" href="static/js/easyui/themes/default/easyui.css">
<script type="text/javascript" src="static/js/easyui/jquery.min.js"></script>
<script type="text/javascript" src="static/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="static/js/easyui/locale/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" type="text/css" href="static/js/easyui/themes/icon.css">
<script language="javascript" type="text/javascript" src="static/js/jquery.page.js"></script>
<style type="text/css">
li a{
corlor:#333;
line-height:33px;
border-bottom:1px solid #b5b5b5;
border-top:1px solid #b5b5b5;
border-right:1px solid #b5b5b5;
border-left:1px solid #b5b5b5;
background: url('static/images/tubiao1.png') 10px 8px no-repeat;
padding-right:10px;
padding-left:10px;
}

</style>
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

<link rel="stylesheet" type="text/css" href="static/css/menu_3.css">
<link href="static/css/index_6.css" rel="stylesheet" type="text/css" />
 <div id="main">
 	<iframe style="margin-top:-4px;"  class="top" frameborder="0" scrolling="no" src="index/head.do" widht="100%" height="180px;"></iframe>
    
    <div class="cen-div color mar-t">
      <div class="con_title_left fl_left">
		        <div class=" font24 padd-b">
		          <div class="list_left_title">
		         	   值班安排
		          </div>
		        </div>
		        <div class="font2 dgrey"><img  src="static/picture/wz.png" class="padd-r"/>您现在的位置 :  
		<a href='index/page.do'  target="_parent">首页</a>&nbsp;>&nbsp;值班安排
		</div>   
      </div>
      <div class="cen-div-1 mar-t">
        <div class="con-left fl" style="width:170px;min-height:120px;border:1px solid;">
        	<ul>
        		<c:if test="${type eq 1 }">
	        		<li style="padding-right:10px;padding-left:10px;margin-top:15px;">
		                	<a style="color: #fff;background: #2b67ac; color: #fff !important" href="cahgDutySchedule/dutyDetailsShow.do?type=1"  target="_parent" title='值班规章制度' ><span style="margin-left:20px;">值班规章制度</span></a>
		             </li>
	             </c:if>
	             <c:if test="${type eq 2 }">
	        		<li style="padding-right:10px;padding-left:10px;margin-top:15px;">
		                	<a style="color: #333;" href="cahgDutySchedule/dutyDetailsShow.do?type=1"  target="_parent" title='值班规章制度' ><span style="margin-left:20px;">值班规章制度</span></a>
		             </li>
	             </c:if>
	             
	             
	             <c:if test="${type eq 1 }">
	        		<li style="padding-right:10px;padding-left:10px;margin-top:15px;">
		                	<a style="color:#333" href="cahgDutySchedule/dutyDetailsShow.do?type=2"  target="_parent" title='值班表' ><span style="margin-left:20px;">值班表</span></a>
		             </li>
	             </c:if>
	             <c:if test="${type eq 2 }">
	        		<li style="padding-right:10px;padding-left:10px;margin-top:15px;">
		                	<a style="color: #fff;background: #2b67ac; color: #fff !important" href="cahgDutySchedule/dutyDetailsShow.do?type=2"  target="_parent" title='值班表' ><span style="margin-left:20px;">值班表</span></a>
		             </li>
	             </c:if>
        		<!-- 	<li style=" margin-top:15px;padding-right:10px;padding-left:10px;background: #0066a6; color: #fff !important;">
	                	<a href="cahgDutySchedule/dutyDetailsShow.do?type=1"  target="_parent" title='值班规章制度' >值班规章制度</a>
	             	</li>   
        	
          		
	          	<li style="margin-top:15px;padding-right:10px;padding-left:10px;background: #0066a6; color: #fff !important;">
	               	<a  href="cahgDutySchedule/dutyDetailsShow.do?type=2"  target="_parent" title='值班表' >值班表</a>
	             </li>
	           -->
        	</ul>
        </div>
        <div class="con-right fr mar-l-2">
 			<div id="list">
 			</div>
 			<div class="page"  style="width:100%; margin-top:50px;">
 			<c:if test="${type eq 1}">
 				<h2 align="center">${infoMap.title }</h2>
 				<div align="center">${infoMap.content}</div>
 			</c:if>
 			<c:if test="${type eq 2}">
 				<table>
 					<tr>
 						<td>
 							时间<input class="easyui-datetimebox" id="play_date" type="text">
 							至<input class="easyui-datetimebox" id="end_date" type="text">
 						</td>
 						<td>类型:</td>
 						<td><select id="category">
 							<option></option>
 							<option value="0">一般干部</option>
 							<option value="1">领导</option>
 						</select></td>
 						<td>值班人：</td>
 						<td><input class="easyui-textbox" id="name" type="text"></td>
 						<td><a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="selectDuty()">查询</a></td>
 					</tr>
 				</table>
 				<div id="list_data" class="list_data"></div>
 			</c:if>
 			</div> 
        </div>
      </div>	
    </div>
            <iframe class="bot"  frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes" src="index/bottom.do" widht="100%" ></iframe>
    
  </div> 
   
<script>

$(function () {
	$('#list_data').datagrid({   
        title:'值班列表',   
        iconCls:'icon-edit',//图标   
        width: 'auto',   
        height: 'auto',   
        nowrap: false,   
        striped: true,   
        border: true,   
        collapsible:false,//是否可折叠的   
        //fit: true,//自动大小   
        loadMsg: '加载中,请稍等',
        //data:jsondata,
        url:'cahgDutySchedule/selectDutyList.do',    
        remoteSort:false,    
        idField:'id',   
        singleSelect:true,//是否单选   
        pagination:true,//分页控件   
        rownumbers:true,//行号   
        fitColumns:true,
        columns:[[{
            title:'记录ID',
            field:'duty_schedule_id',
            align:'center',
            hidden:true,
            width:100
        },{
            title:'值班人',
            field:'name',
            align:'center',
            width:100,
            height:100 
        },{
            title:'值班人手机号码',
            field:'mobile',
            align:'center',
            width:100,
            height:100 
        },{
            title:'办公内线',
            field:'interior',
            align:'center',
            width:100,
            height:100 
        },{
            title:'办公外线',
            field:'external',
            align:'center',
            width:100,
            height:100 
        },{
            title:'值班时间',
            field:'work_time',
            align:'center',
            width:100,
            height:100 
        }
        ]],
        toolbar: [{   
            text: '下载成excel表格',   
            iconCls: 'icon-add',   
            handler: function() {   
            	excel();
            }   
        }]
    });   
    //设置分页控件   
    var p = $('#list_data').datagrid('getPager');   
     
    $(p).pagination({   
        pageSize: 40,//每页显示的记录条数，默认为10   
        pageList: [40],//可以设置每页记录条数的列表   
        beforePageText: '第',//页数文本框前显示的汉字
        afterPageText: '页    共 {pages} 页',   
        displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',
        onBeforeRefresh:function(){  
            $(this).pagination('loading');  
            $(this).pagination('loaded');  
        }
    }); 
}); 

	function selectDuty(){
		var play_date = $("#play_date").datebox('getText');
		var end_date = $("#end_date").datebox('getText');
		var category = $("#category").val();
		var name = $("#name").textbox('getText');
		if(play_date=='' || play_date==null){
			alert("请选择开始时间")
			return false;
		}
		if(end_date=='' || end_date==null){
			alert("请选择结束时间")
			return false;
		}
		if(play_date>end_date){
			alert("开始时间不能大于结束时间")
			return false;
		}
		
		$('#list_data').datagrid('load',{
			play_date: play_date,
			end_date: end_date,
			category: category,
			name:name
		});
	}
	   

	function excel(){
		var row = $('#list_data').datagrid('getData').total;
	    if(row==0){
	    	 $.messager.show({  
                title: '提示',  
                msg: '请先查询到值班数据再进行导出,谢谢',  
                timeout: 2000,  
                showType: 'fade',
	                style:{
						right:'',
						bottom:''
					}
            });
	    	 return false;
	     }
	    var play_date = $("#play_date").datebox('getText');
		var end_date = $("#end_date").datebox('getText');
		var category = $("#category").val();
		var name = $("#name").textbox('getText');
	    var url = "cahgDutySchedule/downCollecTable.do?play_date="+encodeURI(play_date)+"&end_date="+encodeURI(end_date)+"&category="+category+"&name="+encodeURI(name);
		window.open(encodeURI(url));	
	}


$(function () {
    $('#play_date').datebox({
        onShowPanel: function () {//显示日趋选择对象后再触发弹出月份层的事件，初始化时没有生成月份层
            span.trigger('click'); //触发click事件弹出月份层
            if (!tds) setTimeout(function () {//延时触发获取月份对象，因为上面的事件触发和对象生成有时间间隔
                tds = p.find('div.calendar-menu-month-inner td');
                tds.click(function (e) {
                    e.stopPropagation(); //禁止冒泡执行easyui给月份绑定的事件
                    var year = /\d{4}/.exec(span.html())[0]//得到年份
                    , month = parseInt($(this).attr('abbr'), 10); //月份，这里不需要+1
                    $('#play_date').datebox('hidePanel')//隐藏日期对象
                    .datebox('setValue', year + '-' + month); //设置日期的值
                });
            }, 0);
            yearIpt.unbind();//解绑年份输入框中任何事件
        },
        parser: function (s) {
            if (!s) return new Date();
            var arr = s.split('-');
            return new Date(parseInt(arr[0], 10), parseInt(arr[1], 10) - 1, 1);
        },
        formatter: function (d) {
        var a = parseInt(d.getMonth())<parseInt('9')?'0'+parseInt(d.getMonth()+ 1):d.getMonth() + 1;
        return d.getFullYear() + '-' +a; }
    });
    var p = $('#play_date').datebox('panel'), //日期选择对象
        tds = false, //日期选择对象中月份
        yearIpt = p.find('input.calendar-menu-year'),//年份输入框
        span = p.find('span.calendar-text'); //显示月份层的触发控件
    
}); 



$(function () {
    $('#end_date').datebox({
        onShowPanel: function () {//显示日趋选择对象后再触发弹出月份层的事件，初始化时没有生成月份层
            span.trigger('click'); //触发click事件弹出月份层
            if (!tds) setTimeout(function () {//延时触发获取月份对象，因为上面的事件触发和对象生成有时间间隔
                tds = p.find('div.calendar-menu-month-inner td');
                tds.click(function (e) {
                    e.stopPropagation(); //禁止冒泡执行easyui给月份绑定的事件
                    var year = /\d{4}/.exec(span.html())[0]//得到年份
                    , month = parseInt($(this).attr('abbr'), 10); //月份，这里不需要+1
                    $('#end_date').datebox('hidePanel')//隐藏日期对象
                    .datebox('setValue', year + '-' + month); //设置日期的值
                });
            }, 0);
            yearIpt.unbind();//解绑年份输入框中任何事件
        },
        parser: function (s) {
            if (!s) return new Date();
            var arr = s.split('-');
            return new Date(parseInt(arr[0], 10), parseInt(arr[1], 10) - 1, 1);
        },
        formatter: function (d) {
        var a = parseInt(d.getMonth())<parseInt('9')?'0'+parseInt(d.getMonth()+ 1):d.getMonth() + 1;
        return d.getFullYear() + '-' +a; }
    });
    var p = $('#end_date').datebox('panel'), //日期选择对象
        tds = false, //日期选择对象中月份
        yearIpt = p.find('input.calendar-menu-year'),//年份输入框
        span = p.find('span.calendar-text'); //显示月份层的触发控件
}); 


</script>
  
 
  
</body>
</html>