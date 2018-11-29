<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<link rel="stylesheet" href="css/zzsc.css" type="text/css" media="screen" />
<script type="text/javascript" src="<%=basePath%>jspclient/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>jspclient/js/zzsc.js"></script>
<script type="text/javascript">

function lookresult(){
window.location.href="<%=basePath%>paper/lookresult?id=${p_id}";

}

</script>

<style type="text/css">
.paper_main{ width:762px; margin:0 auto; overflow:hidden}
.top_bg{ width:760px; margin:0 auto; height:34px; background-image:url("jspclient/image/20111217wj_gz_18.jpg");}
.top_md{width:760px; margin:0 auto; height:auto; margin-top:20px;}
.paper_exam{width:760px; margin:0 auto; height:auto; margin-top:5px;}
.paper_button{width:760px; margin:0 auto; height:30px;; margin-top:20px;}
</style>
</head>

<body>

<!--列表页主题-->
<div class="list_main">


  <div class="list_contain">
  
  <div style=" width:1000px; height:60px"></div>
    
	<div class="content_main">

	<div style=" width:800x; line-height:22px; overflow:hidden">
	
	<div class="paper_main">

<div class="top_bg">
<span style=" margin-top:10px; margin-left:8px; display:block; float:left"><img src="jspclient/image/20111217wj_gz_21.jpg" /></span>
<span style=" margin-top:10px; margin-left:8px; display:block; float:left; font-size:12px; color:#0099FF; font-weight:600">最新调查</span>
</div>


<form id="form" action="webcenter/webexamunresult" method="post">

<c:forEach items="${pvo.examvolist}" var="exam" varStatus="stu">
<div class="paper_exam">
<span style="font-size:12px; margin-top:12px; display:block">${stu.count}.${exam.examin.title}</span>
<c:if test="${exam.examin.type=='1'}">
<c:forEach items="${exam.examunlist}" var="exun">
<span style="font-size:12px; margin-top:12px; display:block"><input type="radio"  name="exun_ids${stu.count}" value="${exun.id}"/>&nbsp;${exun.title}</span>
</c:forEach>
</c:if>

<c:if test="${exam.examin.type=='2'}">
<c:forEach items="${exam.examunlist}" var="exun">
<span style="font-size:12px; margin-top:12px; display:block"><input type="checkbox"  name="exun_ids${stu.count}" value="${exun.id}"/>&nbsp;${exun.title}</span>
</c:forEach>
</c:if>

<c:if test="${exam.examin.type=='3'}">

<span style="font-size:12px; margin-top:12px; display:block">
<textarea rows="3" cols="80" style="font-size: 12px"></textarea>
</span>

</c:if>


</div>
</c:forEach>

</form>

<div class="paper_button" align="center">
<input type="button" name="btn" value="查看结果" onclick="lookresult()"/>
</div>

</div>
	
	</div>

	
	</div>
	
 
  </div>
  

</div>


</body>
</html>
