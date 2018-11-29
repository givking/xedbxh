<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css" href="css/cs_style.css" />
<title>top</title>
<script type="text/javascript">

function displaySubMenu(li) { 
var subMenu = li.getElementsByTagName("ul")[0]; 
subMenu.style.display = "block"; 
} 
function hideSubMenu(li) { 
var subMenu = li.getElementsByTagName("ul")[0]; 
subMenu.style.display = "none"; 
} 
</script>
</head>

<body>
	<div id="top_bg">
<!-- header-->	
	<div id="cs_header">
		<div id="cs_nav"> 
			 <ul id="navigation"> 
				<li onmouseover="displaySubMenu(this)" onmouseout="hideSubMenu(this)"> 
				<a href="webcenter/clienthome">首页</a> 
				</li>
				<c:forEach items="${webnav}" var="nav">
				<li  onmouseover="displaySubMenu(this)" onmouseout="hideSubMenu(this)"> 
				<a href="${nav.menu.url}">${nav.menu.title}</a> 
					<ul> 
						<c:forEach items="${nav.sublist}" var = "subnav">
							<li><a href="${subnav.url}">${subnav.title}</a></li> 
						</c:forEach>
					</ul> 
				</li> 
				</c:forEach>
			</ul>         
   		</div>
	</div>
<!-- header end!-->	
	</div>
</body>
</html>