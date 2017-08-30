<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">
	$(function(){  
		$.ajax({
            type: "POST",
            url: '${pageContext.request.contextPath}/loginController.do?method=getMenu',
            data: {},
            dataType: "json",
            success:function(data){
            	alert(JSON.stringify(data));
            	for(var i=0;i<data.RESULTLIST.length;i++){
            		$('#main_menu').accordion('add', {
            	    	title: data.RESULTLIST[i].text,
            	    	content: '<ul id="'+data.RESULTLIST[i].menu_code+'" class="easyui-tree"></ul>',
            	    	selected: false
            	    });
            		$('#'+data.RESULTLIST[i].menu_code).tree({
            			data:data.RESULTLIST[i].children,
            			lines : true,
            			animate : true,
            			onclick:function(node){
            				addTab(data.RESULTLIST[i].text,data.RESULTLIST[i].url);
            			}
            		})
            	}
            },
            error:function(){
            	alert("菜单获取失败");
            }
		})
	});

    function addTab(title, url){
    	if ($('#layout_center_tabs').tabs('exists', title)){
    		$('#layout_center_tabst').tabs('select', title);
    	} else {
    		var content = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
    		$('#layout_center_tabs').tabs('add',{
    			title:title,
    			content:content,
    			closable:true
    		});
    	}
    }
</script>
<div id="main_menu" class="easyui-accordion" style="font-weight: bold;line-height: 28px;" data-options="fit:true,border:false">
</div>