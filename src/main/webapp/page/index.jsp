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
		var webSocket = new WebSocket("ws://localhost:8088/test_web_eayui/websocket");
		
		webSocket.onerror = function(event) {
	      onError(event)
	    };

	    webSocket.onopen = function(event) {
	      onOpen(event)
	    };

	    webSocket.onmessage = function(event) {
	      onMessage(event)
	    };

	    function onMessage(event) {
	    	var data = JSON.parse(event.data);
	    	switch (data.type) {
			case 'TC':
				alert(data.msg);
				webSocket.close();
				window.location.href="${pageContext.request.contextPath}"; 
				break;
			default:
				break;
			}
	    	
	    };

	    function onOpen(event) {   
	    	
	    };

	    function onError(event) {
	      alert(JSON.stringify(event));
	    };

	})
</script>
</head>
<body id="mainlayout" class="easyui-layout">
	<!-- 	主页面结构 -->
	<div data-options="region:'north',split:true" style="height:100px;"></div>
	<div data-options="region:'west',title:'系统菜单',split:true,href:'${pageContext.request.contextPath}/page/layout/west.jsp'" style="width:200px;"></div>
	<div data-options="region:'center',split:true,href:'${pageContext.request.contextPath}/page/layout/center.jsp'"></div>
	<div data-options="region:'south'"style="text-align:right;height:30px;line-height:30px;"></div>
</body>
</html>