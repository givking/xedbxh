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
    <link href="<%=basePath%>resources/css/alefrom.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>resources/css/demo.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="<%=basePath%>resources/js/jquery.min.js"></script>
  <script type="text/javascript" src="<%=basePath%>resources/js/jquery-form.js"></script>
 
    
  </head>
  <script type="text/javascript">	 
  $(document).ready(function(){

  
            $(".btn").click(function(){
      if(formcheck()){
                 $("#myform").ajaxSubmit({
            type: 'post', // 提交方式 get/post
            url: 'advertisement/addasfile', // 需要提交的 url
            success: function(data) { // data 保存提交后返回的数据，一般为 json 数据
                window.location.href="<%=basePath%>jspsystem/advertisement/list.jsp";
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
    <ul class="placeul" style="list-style: none;">
    <li><a>首页</a></li>
    <li>表单</li>
    </ul>
    </div>
   <form id="myform"  enctype="multipart/form-data">
    <div class="formbody">
    
    <div class="formtitle"><span>信息</span></div>
    
    <ul class="forminfo">
    <li><label>标题</label><input name="title" type="text" class="dfinput" /><input type="hidden" name="state" value="1"/><i>必填</i></li>
     <li><label>链接</label><input name="url" type="text" class="dfinput" /></li>
     <li><label>类型</label><cite><input name="type" type="radio" value="0" checked="checked" />友情链接&nbsp;&nbsp;&nbsp;&nbsp;<input name="type" type="radio" value="1" />横幅广告&nbsp;&nbsp;&nbsp;&nbsp;<input name="type" type="radio" value="2" />对联广告</cite></li>
    <li><label>图片</label><input name="files" type="file" class="dfinput"/></li>
     <li><label>状态</label><cite><input name="state" type="radio" value="1" checked="checked" />启用&nbsp;&nbsp;&nbsp;&nbsp;<input name="state" type="radio" value="0" />停用</cite></li>
    
    <li><label>&nbsp;</label><input type="button" class="btn" value="确认保存"/></li>
    </ul>
    
    </div>
 </form>

</body>
</html>
