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
<title>南充市慈善网</title>
<link href="<%=basePath%>jspclient/css/list.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>jspclient/css/cs_style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>jspclient/js/jquery.min.js"></script>

<script type="text/javascript">

function printpreview(){ 
window.print();
 
 } 

</script>
<style type="text/css">
td{border: solid 1px;}
</style>

</head>

<body>
<!--滚动图片-->
<jsp:include page="cs_top.jsp" />

<!--列表页主题-->
<div class="list_main">

   <div class="list_location">
   <span class="t1"><img src="jspclient/image/t_ico.jpg" /></span>
    <span class="t2">当前位置：></span>
   <span class="t2"><a href="webcenter/clienthome">首页></a></span>
   <span class="t3">${nav.title}</span>
  </div>
  
  <div class="list_contain">
  
  <!-- <div style=" width:1000px; height:60px"></div> -->
    
	<div class="content_main">
	<div class="content_title">${art.title}</div>
	 <div style=" width:800x; height:30px"></div>
	<div style=" width:800x"><hr color="#000000"/></div>
	<div style=" width:800x; height:20px"></div>
	<div style="width:800px; height:22px; line-height:22px;background-color:#ffeec6">
	<span style=" float:left; margin-left:150px; font-size:12px;  display:block">作者：${art.anthor}</span>
	<span style=" float:left; margin-left:30px;font-size:12px;  display:block">时间：${art.createtime}</span>
	<span style=" float:left; margin-left:30px; font-size:12px;  display:block">来源:${art.shortitle}</span>
	<span style=" float:left; margin-left:100px;  display:block"><a href="javascript:printpreview()">打印本页</a></span>
	<span style=" float:left; margin-left:20px;  display:block"><a href="webcenter/clienthome">关闭窗口</a></span>
	</div>
	<div style=" width:800x; height:40px"></div>
	<div style=" width:800x; line-height:30px; margin-left: 10px;">
	
	
    ${art.content}
	
	
	</div>
	<div style=" width:800x; height:20px"></div>
	

	
 
  </div>
  

   </div>
   
</div>
<!--网页尾部添加-->

<jsp:include page="cs_foot.jsp" />


</body>
</html>