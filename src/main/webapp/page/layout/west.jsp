<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">
	$(function(){  
		$.ajax({
            type: "POST",
            url: '${pageContext.request.contextPath}/loginController.do?method=getMenu',
            data: {},
            dataType: "json",
            success:function(data){
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
            				var center_tab = $('#layout_center_tabs');
            				if (center_tab.tabs('exists', node.text)) {
            					var tab=center_tab.tabs('getTab', node.text);
            					var tabSelected = center_tab.tabs('getSelected');
            					if($(tabSelected).panel('options').title==node.text){
            						//当前激活tab属于当前点击节点时,不处理
            						return;
            					}else{
            						//激活属于当前点击节点的tab
            						center_tab.tabs('select', node.text);
            						return;
            					}
            				}
            				alert(node.text);  // alert node text property when clicked
            			}
            		})
            	}
            },
            error:function(){
            	alert("菜单获取失败");
            }
		})
	});	
</script>
<div id="main_menu" class="easyui-accordion" style="font-weight: bold;line-height: 28px;" data-options="fit:true,border:false">
</div>