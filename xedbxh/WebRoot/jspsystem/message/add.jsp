<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
<link href="<%=basePath%>resources/css/style.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="<%=basePath%>resources/js/jquery.min.js"></script>
<script type="text/javascript" 
	src="<%=basePath%>resources/js/jquery-form.js"></script>
</head>
<script type="text/javascript">
  $(document).ready(function(){
            $(".btn").click(function(){
       if(1){
            $("#myform").ajaxSubmit({
                type: "POST",
                url:"download/addasfile",
                error: function(request) {
                    alert("Connection error");
                },
                success: function(data) {
                   
                    window.location.href="<%=basePath%>jspsystem/download/list.jsp";

															}
														});

											}

										});

					});

	function formcheck() {
		var filename = $("input[name='filename']")[0];
		if (!filename.value || filename.value == "") {
			alert("文件名称不能为空");
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
	<form id="myform" enctype="multipart/form-data">
		<div class="formbody">

			<div class="formtitle">
				<span>基本信息</span>
			</div>
			<ul class="forminfo">
				<li><div>
						<span>上传文件信息</span>
					</div></li>
				<li><label>文件名：</label><input type="text" name="filename"
					class="dfinput" /><span>可选，默认为上传文件名称</span></li>
				<li><label>上传：</label><input type="file" name="files"
					class="dfinput"></li>
				<li><label>&nbsp;</label><input type="button" class="btn"
					value="确认保存" /></li>

			</ul>
		</div>
	</form>

</body>

</html>
