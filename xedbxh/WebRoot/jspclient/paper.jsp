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
function formsub(){
var suncount=0;
var count=0;
var idstr="";
var flag = true;
<c:forEach items="${pvo.examvolist}" var="exam" varStatus="stu">
var ids = $("input[name='exun_ids${stu.count}']");
for(var i = 0;i<ids.length;i++){
     if(ids[i].checked){
       idstr+=ids[i].value+",";
       count++;
     }
}


suncount++;
</c:forEach>
$("#ex_id").val(idstr.substring(0,idstr.lastIndexOf(",")));
var uncontents = $("textarea[name='excontents']");
if(uncontents){
  
  for(var i = 0;i<uncontents.length;i++){
  suncount--;
     if(uncontents[i].value==""){
       flag=false;
     }
  }
  
}
if(suncount!=0&&suncount<=count&&flag){
$("#form").submit();

}else{
alert("问卷未填完整");

}



}

function lookresult(){
window.location.href="<%=basePath%>webcenter/webexamunresult?id=${pvo.paper.id}&&menu_id=${nav.id}";

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
  
  <div style=" width:1000px; height:60px"></div>
    
	<div class="content_main">

	<div style=" width:800x; line-height:22px; overflow:hidden">
	
	<div class="paper_main">

<div class="top_bg">
<span style=" margin-top:10px; margin-left:8px; display:block; float:left"><img src="jspclient/image/20111217wj_gz_21.jpg" /></span>
<span style=" margin-top:10px; margin-left:8px; display:block; float:left; font-size:12px; color:#0099FF; font-weight:600">最新调查</span>
</div>

<div class="top_md">
<span style=" font-weight:600; font-size:12px; display:block; text-align:center">${pvo.paper.title}</span>
<span style="font-size:12px; margin-top:12px; display:block;text-align:center">调查状态：已发布&nbsp;&nbsp;时间${pvo.paper.createtime}</span>
<span style="font-size:12px; margin-top:20px; display:block; line-height:20px;">${pvo.paper.discription}</span>
</div>
<form id="form" action="webcenter/webexamunresult" method="post">
<input type="hidden" name="id" value="${pvo.paper.id}"/>
<input type="hidden" name="menu_id" value="${nav.id}"/>
<input id="ex_id" type="hidden" name="exun_ids"/>
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
<input type="hidden" name="e_ids" value="${exam.examin.id}"/>
<textarea rows="3" cols="80" name="excontents" style="font-size: 12px"></textarea>
</span>

</c:if>


</div>
</c:forEach>

</form>

<div class="paper_button" align="center">
<c:if test="${pvo.paper.over==0}"><input type="button" name="btn" value="提交" onclick="formsub()"/></c:if><c:if test="${pvo.paper.over==1}"><input type="button" name="btn" value="已结束" /></c:if>&nbsp;&nbsp;&nbsp;<input type="button" name="btn" value="查看结果" onclick="lookresult()"/>
</div>

</div>
	
	</div>

	
	</div>
	
 
  </div>
  

</div>
<!--网页尾部添加-->
<jsp:include page="foot.jsp" />

</body>
</html>
