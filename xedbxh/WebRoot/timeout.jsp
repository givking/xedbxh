<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>超时页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="resources/js/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="resources/js/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/demo.css" />
	<script type="text/javascript" src="resources/js/jquery.min.js"></script>
	<script type="text/javascript" src="resources/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="resources/js/easyui-lang-zh_CN.js"></script>
  </head>
  <body>
  	<div id="myine">
  		<div align="center">
	  		<p>页面将在<span id="sec">5</span>秒后自动跳转,如无法跳转请单击：</p><br>
			<a href="login.jsp" target="_top">跳转到主页面</a>
  		</div>
	</div> 
  </body>
<script type="text/javascript">
	$(document).ready(function(){
		togo();
		$("#myine").panel({
			fit:true
		});
		setTimeout("togo()",6000);
		jump();
	});
	function togo(){
		window.open("login.jsp","_top");
	}
	function jump(){
		var secvalue = $("#sec").text();
		if(secvalue>0){
			--secvalue;
			$("#sec").text(secvalue);
		}else{
			togo();
		}
		setTimeout("jump()",1000);
	}
</script>
</html>
