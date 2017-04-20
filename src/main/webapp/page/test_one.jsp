<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>test</title>
<script type="text/javascript" src="../jslib/jquery-1.11.3.min.js" charset="utf-8"></script>
<!-- 引入EasyUI -->
<script type="text/javascript" src="../jslib/jquery-easyui-1.5.1/jquery.easyui.min.js"></script>
<!-- 引入EasyUI的样式文件-->
<link rel="stylesheet" href="../jslib/jquery-easyui-1.5.1/themes/default/easyui.css" type="text/css"/>
<!-- 引入EasyUI的图标样式文件-->
<link rel="stylesheet" href="../jslib/jquery-easyui-1.5.1/themes/icon.css" type="text/css"/>
<script type="text/javascript">
	var index ={
		queryData:function(){
			$.ajax({
				url:"http://localhost:8088/test_web_eayui/userController/queryUser",
				type:"post",
				data:{
					userId:"user"
				},
				success:function(data){
					
				}
			})
		}
	}
</script>
</head>
<body id="testOne" style="padding: 0px">
	<div id="toolbar">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">New User</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">Edit User</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyUser()">Remove User</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="index.queryData()">查询</a>
	</div>		
	<table class="easyui-datagrid" data-options="fitColumns:true,singleSelect:true,url:'${pageContext.request.contextPath}/data.json',method:'GET'">
    <thead>
		<tr>
			<th data-options="field:'code',width:100">Code</th>
			<th data-options="field:'name',width:100">Name</th>
			<th data-options="field:'price',width:100,align:'right'">Price</th>
		</tr>
    </thead>
</table>
</body>
</html>




