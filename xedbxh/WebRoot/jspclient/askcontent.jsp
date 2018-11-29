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
<style type="text/css">
.left_td{ background-color:#CCCCCC;}
.tbord{border:solid 1px #FFFFFF}
.tb{ background-color:#F7F7F7}
body{ font-size:12px}
</style>


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
  
     <div class="r_top"><span style="width:5px; height:29px; margin-top:10px; margin-left:20px; float:left; display:block"><img src="jspclient/image/menu_list.png" /></span><span style="margin-top:18px; margin-left:10px; float:left; font-size:16px; font-weight:600; display:block">${nav.title}</span></div>
  
  <div class="r_list">


<table width="720" height="362" border="0" cellpadding="0" cellspacing="0" class="tb">
  <tr>
    <td width="104" height="26" class="left_td tbord">姓名</td>
    <td class="tbord" width="240" align="center">${mvo.mailask.name}</td>
    <td width="104" class="tbord"></td>
    <td class="tbord"></td>
  </tr>
  <tr>
    <td height="26" class="left_td tbord">咨询时间</td>
    <td class="tbord">${mvo.mailask.createtime}</td>
    <td class="tbord">联系地址</td>
    <td class="tbord">${mvo.mailask.address}</td>
  </tr>
  <tr>
    <td height="26" class="left_td tbord">联系电话</td>
    <td class="tbord">${mvo.mailask.telnum}</td>
    <td class="tbord">邮箱</td>
    <td class="tbord">${mvo.mailask.email}</td>
  </tr>


  <tr>
    <td height="129" class="left_td tbord">咨询内容</td>
    <td colspan="3" class="tbord">${mvo.mailask.content}</td>
  </tr>
  <c:forEach items="${mvo.unlist}" var="unser">
    <tr>
    <td height="26" class="tbord" colspan="4">&nbsp;</td>
  </tr>
     <tr>
    <td height="129" class="left_td tbord">回复时间</td>
    <td colspan="3" class="tbord">${unser.createtime}</td>
  </tr>
    <tr>
    <td height="129" class="left_td tbord">回复内容</td>
    <td colspan="3" class="tbord">${unser.ucontent}</td>
  </tr>
  </c:forEach>
</table>



  </div>
  

  
  </div>
  
  
  </div>
  
  </div>
  

</div>
<!--网页尾部添加-->
<jsp:include page="foot.jsp" />

</body>
</html>
