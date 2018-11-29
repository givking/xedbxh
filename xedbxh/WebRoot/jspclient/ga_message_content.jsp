<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>南充市小贷担保协会网</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>jspclient/css/ga_top.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>jspclient/css/ga_foot.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>jspclient/css/ga_message_content.css" />
	<script src="<%=basePath%>jspclient/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>resources/js/jquery-form.js"></script>
</head>
	<script type="text/javascript">
	 $(document).ready(function(){
            $(".btn").click(function(){
       if(formcheck()){
            $("#myform").ajaxSubmit({
                type: "POST",
                url:"message/savemessage",
                error: function(request) {
                    alert("Connection error");
                },
                success: function(data) {
                	
                 	
                    alert("留言成功!");
                    window.location.href="<%=basePath%>webcenter/webarticlelist?id=102";

															}
														});

											}

										});

					});

	function formcheck() {
		var name = $("input[name='name']")[0];
		var phone = $("input[name='phone']")[0];
		var email = $("input[name='email']")[0];
		var content = $("textarea[name='content']")[0];
		if (!name.value || name.value == "") {
			alert("姓名不能为空");
			return false;
		}if (!phone.value || phone.value == "") {
			alert("电话不能为空");
			return false;
		}if (!email.value || email.value == "") {
			alert("邮箱不能为空");
			return false;
		}if (!content.value || content.value == "") {
			alert("留言内容不能为空");
			return false;
		}
		else{
			return true;
		}

	}  
</script>
	

  </head>
  
  <body>
  		<!-- 头部 -->
  		<jsp:include page="ga_top.jsp" />
  		
  		
  		<!-- 中间内容 -->
  		<div id="content">
  			<div id="liuyan_tup"><img src="jspclient/image/liuyan-tup.jpg"></div>
  			
  			
				<div id="liuyan_content">
					<div id="liuyan_center">
						<form id="myform" >
							<div class="liuyan_all"><div class="xinhao-mingcheng"><span class="xinhao">*&nbsp;</span><span class="mingcheng">姓名:</span></div><div class="shuru"><input  type="text" name="name"></div></div>
							<div class="liuyan_all"><div class="xinhao-mingcheng"><span class="xinhao">*&nbsp;</span><span class="mingcheng">电话:</span></div><div class="shuru"><input type="text" name="phone"></div></div>
							<div class="liuyan_all"><div class="xinhao-mingcheng"><span class="xinhao">*&nbsp;</span><span class="mingcheng">邮箱:</span></div><div class="shuru"><input type="text" name="email"></div></div>
							<div class="liuyan_all"><div class="xinhao-mingcheng"><span class="xinhao">*&nbsp;</span><span class="mingcheng">留言:</span></div><div style="float: left;"><textarea  id="content" name="content" placeholder="在此留下您的意见或建议，以便我们更好的为您服务..." style="width:426px;height: 184px;resize:none;border:1px solid #7a7a7a;font-size: 14px;font-family: MicrosoftYaHei;color: #00000;"></textarea></div></div>
							<div id="tijiao"><input class="btn" type="button" value="提交"></div>
						</form>
					</div>
				</div>
				</div>
  			
  		<!-- content end -->
  		
  		
  		<!-- 版权信息 -->
  		<jsp:include page="ga_foot.jsp" />
  </body>
</html>
