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
  
 
   <div class="gb_port_title"><span style="float:left; margin-left:20px; margin-top:11px; font-size:14px; color:#FFFFFF"><b>公文公报</b></span>
  <span style="float:right; margin-right:10px; margin-top:11px;"><a href="webcenter/webarticlelist?id=7"><b>更多>></b></a></span></div>
     
  <div style=" width:702px; height:20px"></div>
  
<div class="gb_port_list">
 
 <ul>
 <c:forEach items="${make_file}" var="art">
 <li><span style="float:left; width:500px;height:26px; overflow: hidden; display: block"><a href="webcenter/webarticlecontent?id=${art.id}&&menu_id=${art.menu_id}">${art.title}</a></span><span style="float:right">${art.createtime}</span></li>
 </c:forEach>
 </ul>
 
 </div>
 
  <div style=" width:702px; height:20px"></div>
  
    <div class="gb_port_title"><span style="float:left; margin-left:20px; margin-top:11px; font-size:14px; color:#FFFFFF"><b>人事信息</b></span>
  <span style="float:right; margin-right:10px; margin-top:11px;"><a href="webcenter/webarticlelist?id=36"><b>更多>></b></a></span></div>
     
  <div style=" width:702px; height:20px"></div>
  
<div class="gb_port_list">
 
 <ul>
 <c:forEach items="${make_person}" var="art">
 <li><span style="float:left; width:500px;height:26px; overflow: hidden; display: block"><a href="webcenter/webarticlecontent?id=${art.id}&&menu_id=${art.menu_id}">${art.title}</a></span><span style="float:right">${art.createtime}</span></li>
 </c:forEach>
 </ul>
 
 </div>
 
  <div style=" width:702px; height:20px"></div>
  
    <div class="gb_port_title"><span style="float:left; margin-left:20px; margin-top:11px; font-size:14px; color:#FFFFFF"><b>规划计划</b></span>
  <span style="float:right; margin-right:10px; margin-top:11px;"><a href="webcenter/webarticlelist?id=37"><b>更多>></b></a></span></div>
     
  <div style=" width:702px; height:20px"></div>
  
<div class="gb_port_list">
 
 <ul>
 <c:forEach items="${make_report}" var="art">
 <li><span style="float:left; width:500px;height:26px; overflow: hidden; display: block"><a href="webcenter/webarticlecontent?id=${art.id}&&menu_id=${art.menu_id}">${art.title}</a></span><span style="float:right">${art.createtime}</span></li>
 </c:forEach>
 </ul>
 
 </div>
 
  <div style=" width:702px; height:20px"></div>
  

  

  
  
  </div>
  
  
  </div>
  
  </div>
  

</div>
<!--网页尾部添加-->
<jsp:include page="foot.jsp" />

</body>
</html>
