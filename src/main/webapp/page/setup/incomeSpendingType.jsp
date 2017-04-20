<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>test</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/jslib/jquery-1.11.3.min.js" charset="utf-8"></script>
<!-- 引入EasyUI -->
<script type="text/javascript" src="${pageContext.request.contextPath}/jslib/jquery-easyui-1.5.1/jquery.easyui.min.js"></script>
<!-- 引入EasyUI的样式文件-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/jslib/jquery-easyui-1.5.1/themes/default/easyui.css" type="text/css"/>
<!-- 引入EasyUI的图标样式文件-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/jslib/jquery-easyui-1.5.1/themes/icon.css" type="text/css"/>
<script type="text/javascript">
	$(function(){
		
	})
</script>
</head>
<body id="mainlayout" class="easyui-layout">
    <table class="easyui-datagrid" style="width:400px;height:250px"
        data-options="url:'datagrid_data.json',fitColumns:true,singleSelect:true">
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