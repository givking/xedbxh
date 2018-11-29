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
	<link rel="stylesheet" type="text/css" href="<%=basePath%>jspclient/css/ga_index_3.css" />
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
  				<div id="right_top">
					<div id="right_top_top"></div>
					<div id="right_top_foot"><span>${nav.title}</span></div>
				</div>
				
				<!-- 中间列表 -->
				<div class="r_list">
				<ul>
					<c:forEach items="${artlist2}" var="art">
						<li>
							<div id="r_list_top">
								<div id="r_list_top_left">
									<span><a href="webcenter/webarticlecontent?id=${art.id}&&menu_id=${art.menu_id}">${art.title}</a>
									</span>
								</div>
								<div id="r_list_top_right">
									<span>${art.createtime}</span>
								</div>
							</div>
							<div id="r_list_foot">
								<span><c:if test="${fn:length(art.content)<=100}">${art.content}</c:if>
								<c:if test="${fn:length(art.content)>100}">${fn:substring(art.content,0,100)}...</c:if>
								&nbsp;&nbsp;
								</span>
								
							</div>
							<div id="r_list_a">
								<a style="display:block" href="webcenter/webarticlecontent?id=${art.id}&&menu_id=${art.menu_id}">阅读全文>></a>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
					
					<!-- 最下面的页数跳转 -->
					<div class="list_page">

						<table width="100%" border="0" align="center" cellpadding="0"
							cellspacing="0" style="background-color: #e6e7e8">
							<tr>
								<td width="40%" style="height:30px;">共 <span
									class="right-text09">${page.pagecount}</span> 页 | 第 <span
									class="right-text09">${page.curentpage}</span> 页</td>
								<td width="60%" align="right">[ <a
									href="webcenter/webarticlelist?id=${nav.id}&page=1"
									class="right-font08">首页</a> | <a
									href="webcenter/webarticlelist?id=${nav.id}&page=${page.pagebefroe}"
									class="right-font08">上一页</a> | <a
									href="webcenter/webarticlelist?id=${nav.id}&page=${page.pageafter}"
									class="right-font08">下一页</a> | <a
									href="webcenter/webarticlelist?id=${nav.id}&page=${page.pagecount}"
									class="right-font08">末页</a> 转到:<input id="yema" type="text"
									name="yema" style="width:30px;height:16px" /><input
									type="button" name="go" value="GO" onclick="gogo()" />]</td>
							</tr>
						</table>
					</div>
  			</div>
	  	</div>
  		<!-- content end -->
  		
  		
  		<!-- 版权信息 -->
  		<jsp:include page="ga_foot.jsp" />
  </body>
</html>
