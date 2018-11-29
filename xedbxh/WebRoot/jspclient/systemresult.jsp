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
$(document).ready(function(){

 
 <c:forEach items="${pvo.examvolist}" var="exam" varStatus="stu">
     var count = 0;
    <c:forEach items="${exam.examunlist}" var="exun" varStatus="num">
                   count=count+parseInt("${exun.checkcount}");
      </c:forEach>
 
 
   <c:forEach items="${exam.examunlist}" var="exun" varStatus="num">
               
               var wide = (parseInt("${exun.checkcount}")/count)*300;
               var per = (parseInt("${exun.checkcount}")/count)*100;
                 if(count!=0){
                $("#p${stu.count}ic${num.count}").css("width",wide.toFixed(2));
                $("#p${stu.count}ercent${num.count}").html(per.toFixed(2)+"%");
               }else{
               
                               $("#p${stu.count}ic${num.count}").css("width",0);
                $("#p${stu.count}ercent${num.count}").html("0%");
                }
                
      </c:forEach>
 
 
 
 
 </c:forEach>
 
});

function back(){
history.go(-1);
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
<span style=" margin-top:10px; margin-left:8px; display:block; float:left; font-size:12px; color:#0099FF; font-weight:600">调查结果</span>
</div>

<form id="form">

<c:forEach items="${pvo.examvolist}" var="exam" varStatus="stu">
<div class="paper_exam">

<div style="width:740px; margin:0 auto;"><span style="font-size:12px; margin-top:12px; display:block">${stu.count}.${exam.examin.title}</span></div>
<div style="width:740px;margin:0 auto;height:20px;"></div>
<c:if test="${exam.examin.type=='1'}">
<c:forEach items="${exam.examunlist}" var="exun" varStatus="num">
<div style="width:740px;height:26px; margin:0 auto;">
<span style="width:390px;font-size:12px;  float:left; display:block"><input type="radio" name="exun_ids" value="${exun.id}"/>&nbsp;${exun.title}(${exun.checkcount}票)</span>
<span style="width:300px;height:12px;float:left;margin-left:30px;display:block;">
<span id="p${stu.count}ic${num.count}" style="height:12px;float:left;background-image:url(jspclient/image/icon_poll_counter02.jpg)"></span>
</span>
<span id="p${stu.count}ercent${num.count}" style="width:80px;float: right"></span>
</div>
<div style="width:740px;margin:0 auto;height:20px;"></div>
 </c:forEach>
</c:if>

<c:if test="${exam.examin.type=='2'}">
<c:forEach items="${exam.examunlist}" var="exun" varStatus="num">
<div style="width:740px;height:26px; margin:0 auto;">
<span style="width:390px;font-size:12px;  float:left; display:block"><input type="checkbox" name="exun_ids" value="${exun.id}"/>&nbsp;${exun.title}(${exun.checkcount}票)</span>
<span style="width:300px;height:12px;float:left;margin-left:30px;display:block;">
<span id="p${stu.count}ic${num.count}" style="height:12px;float:left;background-image:url(jspclient/image/icon_poll_counter02.jpg)"></span>
</span>
<span id="p${stu.count}ercent${num.count}" style="width:80px;float: right"></span>
</div>
<div style="width:740px;margin:0 auto;height:20px;"></div>
 </c:forEach>
</c:if>

<c:if test="${exam.examin.type=='3'}">

<div style="width:740px;height:26px; margin:0 auto;">
 共(${exam.count})条记录
</div>
<div style="width:740px;margin:0 auto;height:20px;"></div>
</c:if>


</div>
</c:forEach>



</form>
<div style="width:740px;margin:0 auto;height:60px;"></div>
<div class="paper_button" align="center">
<input type="button" name="btn" value="返回" onclick="back()"/>
</div>

</div>
	
	</div>

	
	</div>
	
 
  </div>
  

</div>


</body>
</html>
