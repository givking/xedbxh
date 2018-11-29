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
<script type="text/javascript">
if("${mes}"=="wrong"){
alert("验证码错误");
}

function changepic(){

  $("#pc").attr("src","webcode/createcode?rand="+Math.random());

}
function tijiao(){

var f = document.getElementById("form");
var flag = true;
var name = $("input[name='name']")[0];
var title = $("input[name='title']")[0];
var content = $("textarea[name='content']")[0];
if(name.value==""){
flag = false;
}else if(title.value==""){
flag = false;
}else if(content.value==""){
flag = false;
}

if(flag){
f.submit();
}else{

alert("请检查信息是否完整");
  }

}

function reset(){
var f = document.getElementById("form");
f.reset();
}


</script>


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
  
<div class="mail_main">

  <div class="mail_top">
  <form id="form" action="webcenter/addwebmailask" method="post">
  <table width="520" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100" height="60"  style="font-size:14px"><b>写信人</b></td>
    <td width="420"><input type="text" name="name" style=" width:360px; height:26px" />(必填)
       <input type="hidden" name="menu_id" value="${nav.id}"/>
       <input type="hidden" name="menu_type" value="${nav.identity}"/>
    </td>
  </tr>
    <tr>
    <td width="100" height="60" style="font-size:14px"><b>联系地址</b></td>
    <td width="420"><input type="text" name="address" style=" width:360px; height:26px" />(可填)</td>
  </tr>
   
    <tr>
    <td width="100" height="60" style="font-size:14px"><b>电话</b></td>
    <td width="420"><input type="text" name="telnum" style=" width:360px; height:26px" />(可填)</td>
  </tr>
  
      <tr>
    <td width="100" height="60" style="font-size:14px"><b>邮箱</b></td>
    <td width="420"><input type="text" name="email" style=" width:360px; height:26px" />(可填)</td>
  </tr>
      <tr>
    <td width="100" height="60" style="font-size:14px"><b>QQ</b></td>
    <td width="420"><input type="text" name="icq" style=" width:360px; height:26px" />(可填)</td>
  </tr>
  
  <tr>
    <td height="60"><b>信件类型</b></td>
    <td><input type="radio" name="type" checked="checked" value="0"/>求助&nbsp;&nbsp;<input type="radio" name="type" value="1"/>建议&nbsp;&nbsp;<input type="radio" name="type" value="2" />投诉&nbsp;&nbsp;<input type="radio" name="type" value="3" />咨询&nbsp;&nbsp;<input type="radio" name="type" value="4" />其他&nbsp;&nbsp; </td>
  </tr>
      <tr>
    <td width="100" height="60" style="font-size:14px"><b>标题</b></td>
    <td width="420"><input type="text" name="title" style=" width:360px; height:26px" />(必填)</td>
  </tr>
  
        <tr>
    <td width="100" height="60" style="font-size:14px"><b>内容</b></td>
    <td width="420"><textarea name="content" rows="8" cols="50"></textarea></td>
  </tr>
  
    <tr>
    <td width="100" height="60" style="font-size:14px"><b>验证码</b></td>
    <td width="420"><span style="float: left"><input id="code" name="code" type="text"/></span><span style="float: left;margin-left:10px;"><img id="pc" src="webcode/createcode"/></span><span style="float:left;margin-left:10px;"><a href="javascript:changepic()" style="color:blue;">看不清换一张？</a></span></td>
  </tr>

</table>
</form>
  
  </div>
  
  <div class="mail_foot">
  
  <span style="width:72px; height:27px; float:left; margin-left:120px; display:block"><a href="javascript:tijiao()"><img src="jspclient/image/message3.png" /></a></span>
    <span style="width:72px; height:27px; float:left; margin-left:30px; display:block"><a href="javascript:reset()"><img src="jspclient/image/message4.png" /></a></span>
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
