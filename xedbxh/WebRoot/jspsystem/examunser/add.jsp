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
    var id=<%=request.getParameter("id")%>
  $(document).ready(function(){
    $("input[name='exam_id']")[0].value=id;
            $(".btn").click(function(){

       if(formcheck()){
            $.ajax({
                cache: true,
                type: "POST",
                url:"examunser/add",
                data:$('#myform').serialize(),// 你的formid
                async: false,
                error: function(request) {
                    alert("Connection error");
                },
                success: function(data) {
                   
                    window.parent.closelaye();
                    
                }
            });
            
         }   
              
            
            });
  
  
  });
  
  
     function formcheck(){
  var title = $("input[name='title']")[0];
    var showchar = $("input[name='showchar']")[0];
   if(!title.value || title.value==""){
   alert("标题不能为空");
   return false;
   } else{
   
     return true;   
   }
   
   
  }
  
  </script>
  
<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a>首页</a></li>
    <li>表单</li>
    </ul>
    </div>
   <form id="myform">
    <div class="formbody">
    
    <div class="formtitle"><span>基本信息</span></div>
    
    <ul class="forminfo">
    <li><label>标题</label><input type="hidden" name="exam_id"/><input name="title" type="text" class="dfinput" /></li>
    <li><label>&nbsp;</label><input type="button" class="btn" value="确认保存"/></li>
    </ul>
    
    </div>
 </form>

</body>
</html>
