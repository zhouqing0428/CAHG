$(function() {
	var setting = {
		view : {
			selectedMulti : false
		},
		check : {
			enable : true,
			chkboxType : {
				"Y" : "",
				"N" : ""
			},
			chkStyle : "radio",
			radioType: "all"
		},
		data : {
			simpleData : {
				enable : true,
				idKey : "id",
				pIdKey : "pId",
				rootPId : "0"
			}
		},
		edit : {
			enable : false
		},
		callback : {
			onClick : zTreeOnCheck
		}
	};
	
	var zNodes = [];
	//默认科室为父级组织
	zNodes.push({
		id : '0',
		name : '科室',
		pId : '',
		open : true,
		checked : true
	});
	
	$.each(deptList, function(i, dept) {
		zNodes.push({
			id : dept.dept_id,
			name : dept.name,
			pId : '0',
			open : true
		});
	});

	$.fn.zTree.init($("#treeDemo"), setting, zNodes);
});

function zTreeOnCheck(event, treeId, treeNode) {
	var treeObj = $.fn.zTree.getZTreeObj("treeDemo");

	treeObj.checkNode(treeNode, !treeNode.checked, false);
};