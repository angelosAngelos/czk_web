<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">
	$(function(){  
		$.ajax({
            type: "POST",
            url: '${pageContext.request.contextPath}/userController.do?method=getMenu',
            data: {},
            dataType: "json",
            success:function(data){
            	for(var i=0;i<data.RESULTLIST.length;i++){
            		$('#main_menu').accordion('add', {
            	    	title: data.RESULTLIST[i].text,
            	    	content: '<ul id="'+data.RESULTLIST[i].m_id+'" class="easyui-tree"></ul>',
            	    	selected: false
            	    });
            		$('#'+data.RESULTLIST[i].m_id).tree({
            			data:data.RESULTLIST[i].children,
            			lines : true,
            			animate : true,
            			onclick:function(node){
            				$.ajax({
            					
            				});
            				alert(node.text);  // alert node text property when clicked
            			}
            		})
            	}
            },
            error:function(){
            	alert("error");
            }
		})
	});	
</script>
	<div id="main_menu" class="easyui-accordion" style="font-weight: bold;line-height: 28px;" data-options="fit:true,border:false">
</div>