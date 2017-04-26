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
        data-options="url:'${pageContext.request.contextPath}/userController.do?method=getMenu',fitColumns:true,singleSelect:true">
        <thead>
    		<tr>
    			<th data-options="field:'TYPE',width:100">类型</th>
    			<th data-options="field:'NAME',width:100">角色</th>
    			<th data-options="field:'AMOUNT',width:100">金额</th>
    			<th data-options="field:'SOURCE',width:100">来源</th>
    		</tr>
        </thead>
    </table>
</body>
</html>