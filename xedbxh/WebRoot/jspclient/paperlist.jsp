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
function gogo(){
var obj = document.getElementById("yema");
 var reg = new RegExp("^[0-9]*$");
 var flag = true;
     if(!reg.test(obj.value)){
        flag = false;
        alert("请输入数字!");
    }else if(!/^[0-9]+$/.test(obj.value)){
         flag = false;
        alert("请输入数字!");
    }else if(parseInt(obj.value)>parseInt("${page.pagecount}")){
      flag = false;
     alert("页码超出范围!");
    }
    
    if(flag){
    
        window.location.href="<%=basePath%>webcenter/webpaperlist?menu_id=${nav.id}&page="+obj.value;
    }
 
 
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
  
     <div class="r_top"><span style="width:5px; height:29px; margin-top:10px; margin-left:20px; float:left; display:block"><img src="jspclient/image/menu_list.png" /></span><span style="margin-top:18px; margin-left:10px; float:left; font-size:16px; font-weight:600; display:block">${nav.title}</span></div>
  
  <div class="r_list">
     <ul>
     <c:forEach items="${plist}" var="paper">
	  <li>
	   <span style=" width:600px; height:26px; line-height:22px; float:left; display:block"><a href="webcenter/webpaper?id=${paper.id}&&menu_id=${nav.id}">${paper.title}</a></span>
	   <span style="line-height:26px; float:right; display:block">${paper.createtime}</span>
	   </li>
  </c:forEach>

	 </ul>
  </div>
  
  <div class="list_page">
  
  <table width="100%" border="0" align="center" cellpadding="0"
										cellspacing="0" style="background-color: #e6e7e8">
										<tr>
											<td width="50%" style="height:30px;">
												共
												<span class="right-text09">${page.pagecount}</span>
												页 | 第
												<span class="right-text09">${page.curentpage}</span>
												页
											</td>
											<td width="49%" align="right">
												[
												<a href="webcenter/webpaperlist?menu_id=${nav.id}&page=1"
													class="right-font08">首页</a> |
												<a
													href="webcenter/webpaperlist?menu_id=${nav.id}&page=${page.pagebefroe}"
													class="right-font08">上一页</a> |
												<a
													href="webcenter/webpaperlist?menu_id=${nav.id}&page=${page.pageafter}"
													class="right-font08">下一页</a> |
												<a
													href="webcenter/webpaperlist?menu_id=${nav.id}&page=${page.pagecount}"
													class="right-font08">末页</a>     转到:<input id="yema" type="text" name="yema" style="width:30px;height:16px"/><input type="button" name="go" value="GO" onclick="gogo()"/>] 
											</td>
										</tr>
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
