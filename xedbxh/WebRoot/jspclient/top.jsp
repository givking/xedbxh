<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!--滚动图片-->
<div class="topbanner">

<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="1200" height="223" title="aa">
  <param name="movie" value="<%=basePath%>jspclient/flash/title_flash.swf" />
  <param name="quality" value="high" />
  <embed src="<%=basePath%>jspclient/flash/title_flash.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="1200" height="223"></embed>
</object>

</div>
<!--栏目导航-->
<div class="nav">

	 <div class="nav_main">
		 <ul id="navigation"> 
			<li onmouseover="displaySubMenu(this)" onmouseout="hideSubMenu(this)"> 
			<a href="webcenter/clienthome">首页</a> 
			</li>
			<c:forEach items="${webnav}" var="nav">
			<li style="margin-left:6px;" onmouseover="displaySubMenu(this)" onmouseout="hideSubMenu(this)"> 
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
