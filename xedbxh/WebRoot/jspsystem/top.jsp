<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'top.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<link href="<%=basePath%>resources/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="<%=basePath%>resources/js/jquery.js"></script>
<script type="text/javascript">
$(function(){	
	//顶部导航切换
	$(".nav li a").click(function(){
		$(".nav li a.selected").removeClass("selected")
		$(this).addClass("selected");
	})	
})	
</script>

  </head>
  
 
<body style="background:url(<%=basePath%>resources/images/topbg.gif) repeat-x;">

    <div class="topleft">
    <a href="main.html" target="_parent"><img src="<%=basePath%>resources/images/logo.png" title="系统首页" /></a>
    </div>
        
    <ul class="nav">
  
    </ul>
            
    <div class="topright">    
    <ul>
    <li><a href="webcenter/clienthome" target="_blank">网站首页</a></li>
    <li><a href="j_spring_security_logout" target="_parent">退出</a></li>
    </ul>
     
    <div class="user">
    <span>${sessionScope.user.personname}</span>
    </div>    
    
    </div>

</body>
</html>
