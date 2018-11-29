<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <link href="<%=basePath%>resources/css/style.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="<%=basePath%>resources/js/jquery.min.js"></script>
  </head>
  <script type="text/javascript">
  $(document).ready(function(){

            $(".btn").click(function(){
            
         if(formcheck()){
            var p = $("input[name='password']");
            var p1 = $("input[name='surep']");
            if(p[0].value==p1[0].value){
            
            $.ajax({
                cache: true,
                type: "POST",
                url:"systemuser/add",
                data:$('#myform').serialize(),// 你的formid
                async: false,
                error: function(request) {
                    alert("Connection error");
                },
                success: function(data) {
                   
                    window.location.href="<%=basePath%>jspsystem/systemuser/list.jsp";
                    
                }
            });
            
            }else{
            p[0].value="";
            p1[0].value="";
            alert("两次密码不一致");
            }
            
        }      
            
            });
  
  
  });
  
  function formcheck(){
  var name = $("input[name='personname']")[0];
   var account = $("input[name='account']")[0];
   var password = $("input[name='password']")[0];
   if(!name.value || name.value==""){
   alert("姓名不能为空");
   return false;
   }else if(!account.value || account.value==""){
      alert("账号不能为空");
   return false;
   }else if(!password.value || password.value==""){
      alert("密码不能为空");
   return false;
   }else{
   
   return true;
   }
   
   
  }
  </script>
  
<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li>表单</li>
    </ul>
    </div>
   <form id="myform">
    <div class="formbody">
    
    <div class="formtitle"><span>基本信息</span></div>
    
    <ul class="forminfo">
    <li><label>姓名</label><input name="personname" type="text" class="dfinput" /><i>必填</i></li>
    <li><label>用户名</label><input name="account" type="text" class="dfinput" /><i>必填</i></li>
    <li><label>密码</label><input type="password" name="password" class="dfinput"/></li>
    <li><label>密码确认</label><input name="surep" type="password" class="dfinput"/></li>
     <li><label>邮箱</label><input name="email" type="text" class="dfinput" /><i>e-mail</i></li>
      <li><label>地址</label><input name="address" type="text" class="dfinput" /><i>可填</i></li>
      <li><label>电话</label><input name="phonetel" type="text" class="dfinput" /><i>可填</i></li>
        <li><label>是否启用</label><cite><input name="state" type="radio" value="1" checked="checked" />是&nbsp;&nbsp;&nbsp;&nbsp;<input name="state" type="radio" value="0" />否</cite></li>
    <li><label>&nbsp;</label><input type="button" class="btn" value="确认保存"/></li>
    </ul>
    
    </div>
 </form>

</body>
</html>
