<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>南充市住房和城乡建设局</title>
<link href="<%=basePath%>jspclient/css/global.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>jspclient/css/list.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>jspclient/js/jquery.min.js"></script>
<script type="text/javascript">

function printpreview(){ 
window.print();
 
 } 

</script>

</head>

<body>
<!--滚动图片-->
<jsp:include page="top.jsp" />
<!--列表页主题-->
<div class="list_main">

   <div class="list_location">
   <span class="t1"><img src="jspclient/image/t_ico.jpg" /></span>
    <span class="t2">当前位置：></span>
   <span class="t2"><a href="webcenter/clienthome">首页></a></span>
   <span class="t3">${nav.title}</span>
  </div>
  
  <div class="list_contain">
  
  <div style=" width:1000px; height:20px"></div>
  
  <div class="contain_bd">
  
  <div class="bd_left">
  
    <div class="l_nav"><span style="float:left; display:block; margin-top:16px; margin-left:40px; font-size:14px; font-weight:600"><a href="${leftnav.menu.url}" style="color:#FFFFFF">${leftnav.menu.title}</a></span></div>
   <c:forEach items="${leftnav.sublist}" var="menu">
      <div class="l_subnav"><span style="float:left; display:block; margin-top:14px; margin-left:50px;  font-weight:600"><a href="${menu.url}">${menu.title}</a></span></div>
	   </c:forEach>
  </div>
  
  <div class="bd_right"> 
  
  <div style=" width:700px; height:60px"></div>
    
	<div class="content_main" style="width:700px">
	<div class="content_title" style="width:700px">${art.title}</div>
	 <div style=" width:700x; height:30px"></div>
	<div style=" width:700x"><hr color="#000000"/></div>
	<div style=" width:700x; height:20px"></div>
	<div style="width:700px; height:22px; line-height:22px;background-color:#9bcef9">
	<span style=" float:left; margin-left:80px; font-size:12px;  display:block">作者：${art.anthor}</span>
	<span style=" float:left; margin-left:30px;font-size:12px;  display:block">时间：${art.createtime}</span>
	<span style=" float:left; margin-left:30px; font-size:12px;  display:block">来源:${art.shortitle}</span>
	<span style=" float:left; margin-left:100px;  display:block"><a href="javascript:printpreview()">打印本页</a></span>
	<span style=" float:left; margin-left:20px;  display:block"><a href="webcenter/clienthome">关闭窗口</a></span>
	</div>
	<div style=" width:700x; height:40px"></div>
	<div style=" width:700x; line-height:30px;float:left">
	
	
    ${art.content}
	
	
	</div>
	<div style=" width:700x; height:20px"></div>
	

	
 
  </div>
  

  
  </div>
  
  
  </div>
  
  </div>
  

</div>
<!--网页尾部添加-->
<jsp:include page="foot.jsp" />

</body>
</html>
