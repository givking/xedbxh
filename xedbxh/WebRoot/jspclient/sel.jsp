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
function sel(){
var title= $("#tt").val();

window.location.href="<%=basePath%>webcenter/webselarticle?tit="+title;

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
   <span class="t2"><a href="#">首页></a></span>
   <span class="t3">查询</span>
  </div>
  
    <div class="list_contain">
  
  <div style=" width:1000px; height:30px"></div>
  
  <div class="sel_top">
   <div class="sel_top_tit"><b>搜索结果</b></div>
      <div class="sel_txt"><span style=" float:left; width:228px; height:32px; display:block"><input id="tt" type="text" name="sel" style="width:228px; height:25px" /></span><span style="float:left; margin-left:16px; display:block"><a href="javascript:sel();"><img src="jspclient/image/search_result_10.png" /></a></span></div>
	  
	    <div class="sel_result">
  
  <ul>
  <c:forEach items="${artlist}" var="art">
  <li><span style="float:left; line-height:30px;"><a href="webcenter/webarticlecontent?id=${art.id}&&menu_id=${art.menu_id}">${art.title}</a></span><span style="float:right;line-height:30px;">发布时间：[${art.createtime}]</span></li>
  </c:forEach>
    </ul>
	
  </div>
    
  <div style=" width:1000px; height:30px"></div>

  </div>
  
  </div>

  

</div>

<!--网页尾部添加-->
<jsp:include page="foot.jsp" />

</body>
</html>
