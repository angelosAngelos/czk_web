<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">
	
</script>
<form action="${pageContext.request.contextPath}/UploadController.do?method=upload" enctype="multipart/form-data" method="post">
     上传用户：<input type="text" name="username"><br/>
     上传文件1：<input type="file" name="file1"><br/>
     上传文件2：<input type="file" name="file2"><br/>
   <input type="submit" value="提交">
</form>