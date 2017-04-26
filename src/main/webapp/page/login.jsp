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
	function login(){		
		var json={
				name:$("#name").val(),
				password:$("#password").val(),
		}
		$.ajax({ 
            type:"POST", 
            url:"${pageContext.request.contextPath}/loginController.do?method=login",                    
            data:json, 
            dataType: "json",
            success:function(data){ 
                 if(data.RESULT == "SUCCESS"){
                	//登陆验证成功
                	window.top.location.href = '${pageContext.request.contextPath}/page/index.jsp'
                 }else{
                	$.messager.alert('警告',data.MESSAGE,'warning');
                 }
            } 
         }); 
	}
</script>
</head>
<body id="login_window" class="easyui-layout">
	    <div id="win" class="easyui-window" title="Login" style="width:300px;height:180px;">
    	<form style="padding:10px 20px 10px 40px;">
    		<p>账户: <input type="name" id="name"></p>
    		<p>密码: <input type="password" id="password"></p>
    		<div style="padding:5px;text-align:center;">
    			<a href="javascript:void(0)" class="easyui-linkbutton" icon="icon-ok" onclick="login()">Ok</a>
    			<a href="#" class="easyui-linkbutton" icon="icon-cancel">Cancel</a>
    		</div>
    	</form>
    </div>
</body>
</html>