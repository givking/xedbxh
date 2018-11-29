<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>欢迎登录后台管理系统</title>
<link href="<%=basePath%>resources/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="<%=basePath%>resources/js/jquery.min.js"></script>
<script src="<%=basePath%>resources/js/cloud.js" type="text/javascript"></script>

<script type="text/javascript">

 var error="${sessionScope.SPRING_SECURITY_LAST_EXCEPTION}";
 if(error.trim()!=""){
 //alert(error);
  alert("用户名或密码错误");
   }
   
	$(function(){
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
	$(window).resize(function(){  
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
    })  
});  

function login(){
$("#form").submit();

}

</script> 

</head>

<body style="background-color:#1c77ac; text-align:center; background-image:url(images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">



    <div id="mainBody">
      <div id="cloud1" class="cloud"></div>
      <div id="cloud2" class="cloud"></div>
    </div>  


<div class="logintop">    
    <span>欢迎登录后台管理界面平台</span>    
    <ul>
    <li><a href="#">回首页</a></li>
    <li><a href="#">帮助</a></li>
    <li><a href="#">关于</a></li>
    </ul>    
    </div>
    <form id="form" name="login" action="j_spring_security_check" method="post">
    <div class="loginbody">
    
    <span class="systemlogo"></span> 
       
    <div class="loginbox">
    
    <ul>
    <li><input name="j_username" type="text" class="loginuser"  onclick="JavaScript:this.value=''"/></li>
    <li><input name="j_password" type="password" class="loginpwd"  onclick="JavaScript:this.value=''"/></li>
    <li><a class="loginbtn" style="width:112px; height: 35px;display: block; text-align: center; float: left"  href="javascript:login()"  />登录</a><a class="loginbtn" style="width:112px; height: 35px;display: block; text-align: center;float: left;margin-left: 60px;"  href="javascript:login()"  />重置</a></li>
    </ul>
    
    </div>
    
    </div>
    
	</form>
    
</body>

</html>
