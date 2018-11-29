<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


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
<!-- 头部登录栏 -->
<div id="ding">
	<div id="ding_center">
		<!-- <div id="ding_center_left"><span>登录&nbsp;&nbsp;注册</span></div> -->
		<div id="ding_center_right"><span>${year}年${month}月${day}日&nbsp;${time}&nbsp;${weekday}</span></div>
	</div>
</div>

<!--   二维码  -->
<div id="code">
	<div id="code_top"></div>
	<div id="code_foot">
		<span>扫码关注微信公众号</span>
	</div>
</div>
<!-- 中间内容栏  -->
<div id="main">
	<!-- 导航栏 -->
	<div id="head">
		<div id="head_top"></div>
		<div id="head_foot">
			<div id="head_foot_left"></div>
			<div id="head_foot_center">
				<ul id="navigation"> 
					<li onmouseover="displaySubMenu(this)" onmouseout="hideSubMenu(this)"> 
						<a href="webcenter/clienthome">首页</a> 
					</li>
					<c:forEach items="${webnav}" var="nav">
						<li onmouseover="displaySubMenu(this)" onmouseout="hideSubMenu(this)"> 
							<a href="${nav.menu.url}">${nav.menu.title}</a> 
							<ul> 
								<c:forEach items="${nav.sublist}" var = "subnav">
									<li style="width: 100px;"><a href="${subnav.url}" >${subnav.title}</a></li> 
								</c:forEach>
							</ul> 
						</li> 
					</c:forEach>
				</ul>  
			</div>
			<div id="head_foot_right"></div>
		</div>
	</div>
</div>
