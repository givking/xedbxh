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
            $.ajax({
                cache: true,
                type: "POST",
                url:"examination/add",
                data:$('#myform').serialize(),// 你的formid
                async: false,
                error: function(request) {
                    alert("Connection error");
                },
                success: function(data) {
                   
                    window.location.href="<%=basePath%>jspsystem/examination/list.jsp";
                    
                }
            });
            
         }   
              
            
            });
  
  
  });
  
  
     function formcheck(){
  var title = $("input[name='title']")[0];
   if(!title.value || title.value==""){
   alert("标题不能为空");
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
    <li><label>标题</label><input name="title" type="text" class="dfinput" /><i>必填</i></li>
     <li><label>类型</label><cite><input name="type" type="radio" value="1" checked="checked" />单选题&nbsp;&nbsp;&nbsp;&nbsp;<input name="type" type="radio" value="2" />多选题&nbsp;&nbsp;&nbsp;&nbsp;<input name="type" type="radio" value="3" />问答题</cite></li>
        <li><label>是否启用</label><cite><input name="state" type="radio" value="1" checked="checked" />是&nbsp;&nbsp;&nbsp;&nbsp;<input name="state" type="radio" value="0" />否</cite></li>
    <li><label>&nbsp;</label><input type="button" class="btn" value="确认保存"/></li>
    </ul>
    
    </div>
 </form>

</body>
</html>
