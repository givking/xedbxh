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
	<link rel="stylesheet" type="text/css" href="<%=basePath%>jspclient/css/ga_org_list.css" />
	<script src="<%=basePath%>jspclient/js/jquery.min.js"></script>
	<script type="text/javascript">
	function gogo(){
	var obj = document.getElementById("yema");
	 var reg = new RegExp("^[0-9]*$");
	 var flag = true;
	     if(!reg.test(obj.value)){
	        flag = false;
	        alert("请输入数字!");
	    }else if(!/^[0-9]+$/.test(obj.value)){
	         flag = false;
	        alert("请输入数字!");
	    }else if(parseInt(obj.value)>parseInt("${page.pagecount}")){
	      flag = false;
	     alert("页码超出范围!");
	    }  
	    if(flag){   
	        window.location.href="<%=basePath%>webcenter/webarticlelist?id=${nav.id}&page="+obj.value;
	    }
	}
	</script>	

  </head>
  
  <body>
  		<!-- 头部 -->
  		<jsp:include page="ga_top.jsp" />
  		
  		
  		<!-- 中间内容 -->
  		<div id="content">
  			<div id="left">
  				<div id="left_top">
  				<!-- 大标题 -->
  					<span ><a href="${leftnav.menu.url}" style="color:#FFFFFF">${leftnav.menu.title}</a>
					</span>
  				</div>
				<div id="left_foot">
					<!-- 小标题 -->
					<c:forEach items="${leftnav.sublist}" var="menu">
						<div id="l_subnav" <c:if test="${nav.title==menu.title}">class="sub_active"</c:if>>
							<span><a href="${menu.url}">${menu.title}</a> </span>
						</div>
					</c:forEach>
					<div id="left_foot_foot"></div>
				</div>
		</div>
  			
  			<!-- 右边的详细列表内容显示 -->
  			<div id="right">
  				<div id="two_left">
					<div id="two_left_top">
						<div id="two_left_top_left">
							<div id="two_left_top_left_center"></div>
						</div>
						<div id="two_left_top_right">
							<span>${nav.title}</span>
						</div>
					</div>
					<div id="two_left_foot">
					${art.content}
					</div>
				</div>
  			</div>
	  	</div>
  		<!-- content end -->
  		
  		
  		<!-- 版权信息 -->
  		<jsp:include page="ga_foot.jsp" />
  </body>
</html>
