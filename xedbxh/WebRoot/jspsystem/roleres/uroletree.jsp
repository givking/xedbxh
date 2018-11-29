<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>角色列表</title>
    
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
	$(document).ready(function(){
			
	loaddata();
		});
		
		function loaddata(){
		
		$.getJSON("systemuser/findbyid",{id:id,random:Math.random},function(u){
		
		if(u){
		
				$.getJSON("role/listall",function(data){
		
		if(data.length>0){
		
		for(var i = 0;i<data.length;i++){
		var html="";
		if(data[i].id==u.role_id){
		 html = "<option value='"+data[i].id+"' selected='selected'>"+data[i].role_name+"</option>";
		}else{
		html = "<option value='"+data[i].id+"'>"+data[i].role_name+"</option>";
		}
		$("#role").append(html);
		}
		
		
		}
		
		});
		
		
		
		
		}
		
		
		});

		}
  
  function saverole(){
  var r_id = $("#role").val();

if(r_id!=0){
    $.get("systemuser/setrole",{user_id:id,role_id:r_id},function(data){
        closelaye();
     });
  
   }else{
     closelaye();
  
   } 
 }
  
    function closelaye(){

var index = parent.layer.getFrameIndex(window.name); //获取当前窗体索引

    parent.layer.close(index); //执行关闭


}
  
  
  </script>
  
<body>

	<div style="width:180px; margin-top: 30px" align="center">
		<select id="role" style="border: 1px solid #666666">
		<option value='0'>请选择</option>
		</select>
		
	</div>
	
	<div style="width:180px;margin-top: 80px" align="center"><input type="button" style="width:100px; height:20px" class="btn" value="确认" onclick="saverole()"/></div>
	
</body>
</html>
