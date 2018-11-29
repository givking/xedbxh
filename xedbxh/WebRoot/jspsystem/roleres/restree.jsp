<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>资源列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <link href="<%=basePath%>resources/css/alefrom.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>resources/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>resources/css/demo.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="<%=basePath%>resources/js/jquery.min.js"></script>
  <script type="text/javascript" src="<%=basePath%>resources/js/jquery-form.js"></script>
  <script type="text/javascript" src="<%=basePath%>resources/js/jquery.ztree.core-3.5.js"></script>
   <script type="text/javascript" src="<%=basePath%>resources/js/jquery.ztree.excheck-3.5.js"></script>
  </head>
  <script type="text/javascript">
  var id="<%=request.getParameter("id")%>";
 var setting = {
			check: {
				enable: true,
				chkboxType: { "Y": "", "N": "" }
			},
	data: {
			key: {
			name: "title"
		},
				simpleData: {
					enable: true,
			        idKey: "id",
			        pIdKey: "parent_id",
			        rootPId: -1
				}
			},
			callback: {
				
			},
			view: {
		showIcon: false
	}
		};

		
		$(document).ready(function(){
			
	loaddata();
		});
		//-->
		
		function loaddata(){
		$.getJSON("resource/rolereslist",{role_id:id},function(data){
		if(data.length>0){
			
					$.getJSON("resource/listall",function(nodes){
		if(nodes.length>0){
			$.fn.zTree.init($("#treeDemo"), setting, nodes);
			var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
			var arr = treeObj.getCheckedNodes(false);
			
			for(var i = 0;i<data.length;i++){
			
			   for(var j=0;j<arr.length;j++){
			     if(data[i].res_id==arr[j].id){
			       treeObj.checkNode(arr[j], true, true);
			      }
			   }
			
			}
			
			
		}
		
		});
			
			
		}else{
		alldata();
		}
		
		});
		
		}
		
		function alldata(){
		
		$.getJSON("resource/listall",function(data){
		if(data.length>0){
			$.fn.zTree.init($("#treeDemo"), setting, data);
		}
		
		});
		
		}
		
		function selcheck(){
		
		var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
    var nodes = treeObj.getCheckedNodes(true);
    var res_ids="";
    for(var i = 0;i<nodes.length;i++){
    
     res_ids=res_ids+nodes[i].id+",";
     
    }
	
	if(res_ids!=""){
	res_ids=res_ids.substring(0, res_ids.lastIndexOf(","));
	addcheck(res_ids);
	}	
		
}


function addcheck(res_ids){

$.get("resource/addroleres",{res_arr:res_ids,role_id:id},function(data){
    var josn = eval("("+data+")");
    closelaye();
    if(data.result){
    
    }

});

}
  
  function closelaye(){

var index = parent.layer.getFrameIndex(window.name); //获取当前窗体索引

    parent.layer.close(index); //执行关闭


}
  
  
  
  </script>
  
<body>

	<div style="width:180px;">
		<ul id="treeDemo" class="ztree" style="width:180px;"></ul>
		<div style="width:180px;" align="center"><input type="button" style="width:100px; height:20px" class="btn" value="确认" onclick="selcheck()"/></div>
	</div>
	
</body>
</html>
