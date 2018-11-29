<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>栏目列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<link href="<%=basePath%>resources/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="<%=basePath%>resources/js/jquery.min.js"></script>

<script type="text/javascript">
$(function(){	
	//导航切换
	$(".menuson li").click(function(){
		$(".menuson li.active").removeClass("active")
		$(this).addClass("active");
	});
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('ul').slideUp();
		if($ul.is(':visible')){
			$(this).next('ul').slideUp();
		}else{
			$(this).next('ul').slideDown();
		}
	});
})	
</script>


  </head>
  
<body style="background:#f0f9fd;">
	<div class="lefttop"><span></span>系统目录</div>
    
    <dl class="leftmenu">
    <c:forEach items="${mvlist}" var="mv" varStatus="stu">  
    <dd>
    <div class="title" style="width:187px;height:35px;line-height:20px;">
    <span style=" height:16px;"><img src="<%=basePath%>resources/images/leftico01.png" /></span><span style="height:16px;">${mv.resource.title}</span>
    </div>
    	<ul class="menuson">
    	<c:forEach items="${mv.sublist}" var="sub">
        <li><cite></cite><a href="${sub.url}" target="rightFrame">${sub.title}</a><i></i></li>
         </c:forEach>
        </ul>    
    </dd>
        
    </c:forEach>  
    
    </dl>
    
</body>
</html>
