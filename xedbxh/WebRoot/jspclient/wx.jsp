<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
   <span class="t3">南充住建微信公众平台二维码</span>
  </div>
  
  <div class="list_contain">
  
  <div style=" width:1000px; height:60px"></div>
    
	<div class="content_main">
	<div class="content_title">南充住建微信公众平台二维码</div>
	 <div style=" width:800x; height:30px"></div>
	<div style=" width:800x"><hr color="#000000"/></div>
	<div style=" width:800x; height:20px"></div>
	<div style="width:800px; height:22px; line-height:22px"><span style=" float:left; margin-left:280px; font-size:14px; color:#666666; display:block">system</span><span style=" float:left; margin-left:30px;font-size:14px; color:#666666; display:block">时间：2015-07-27</span></div>
	<div style=" width:800x; height:20px"></div>
	<div style=" width:800x; line-height:22px; overflow:hidden">
	
	
  <div style="width:430px;height:430px; margin:0 auto;"><img src="jspclient/image/wxtwo.jpg"/></div>
	
	
	</div>
	<div style=" width:800x; height:20px"></div>
	
	<div class="content_foot">
	
	
	

	
	</div>
	
	 <div style=" width:800x; height:20px"></div>
	
	
	</div>
	
 
  </div>
  

</div>
<!--网页尾部添加-->
<jsp:include page="foot.jsp" />

</body>
</html>