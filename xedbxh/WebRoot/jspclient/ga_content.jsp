<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<link rel="stylesheet" type="text/css" href="<%=basePath%>jspclient/css/ga_index_2.css" />
	<script src="<%=basePath%>jspclient/js/jquery.min.js"></script>
	<script src="<%=basePath%>jspclient/js/jquery-SliderPlay-1.0.min.js"></script>
	

  </head>
  <style>
/*   	table{
  		width:98%;
  		border-spacing: 0;
        border-collapse: collapse;
  	} *//* 表去掉单元格间间隙 */
  </style>
  <body>
  		<!-- 头部 -->
  		<jsp:include page="ga_top.jsp" />
  		
  		
  		<!-- 中间内容 -->
  		<div id="content">
  			<!--  one -->
			<div id="one">
				<div id="img">
					<div id="img_left">
						<img src="<%=basePath%>jspclient/image/location.png"/>
					</div>
				</div>
				<div id="one_left"> 
					<span>当前位置:></span>
					<span class="one_left_weizhi"><a href="webcenter/clienthome">首页></a></span>
					<span>${nav.title}</span>
				</div>
				<div id="one_center">
					<input type="text" id="one_left_two" placeholder="请输入关键字" 
					style="font-family:Simsum;font-size:13px;text-align:left;padding-left:18px"/> 
					<select  id="search_type">
						<option value='1'>文章搜索</option>
						<option value='2'>下载搜索</option>
					</select>
				</div>
				<div id="one_right">
					<input type="button" id="button" onclick="search();" value="搜索"/>
				</div>
			</div>
			
			
		    <!--   这里是动态添加内容(content)的地方  -->
			<div id="two">
				<div id="two_left">
					<div id="two_left_top">
						<div id="two_left_top_left">
							<div id="two_left_top_left_center"></div>
						</div>
						<div id="two_left_top_right">
							<span>${art.title}</span>
						</div>
					</div>
					<div id="two_left_foot">
					${art.content}
					</div>
					<div id="next">
					<p>上一篇:<c:if test="${before_article[0].title==null}">没有上一篇了</c:if><a href="javascript:showArticle('${before_article[0].id}','${before_article[0].menu_id}')">${before_article[0].title}</a></p>
					<p>下一篇:<c:if test="${next_article[0].title==null}">没有下一篇了</c:if><a href="javascript:showArticle('${next_article[0].id}','${next_article[0].menu_id}')">${next_article[0].title}</a></p>
					</div>
				</div>
				
				
				<div id="two_right">
					<div id="two_right_1">
						<div id="two_right_1_top">
							<span>最新消息</span>
						</div>
						<div id="two_right_1_foot">
							<ul>
							<c:forEach items="${latest_news}" var="art">
								<li onclick="showArticle('${art.id}','${art.menu_id}')">
								<span id="two_center_foot_left">${art.title}</span>
								<span id="two_center_foot_right">[${art.createtime}]</span>
								</li>
							</c:forEach>
							</ul>
						</div>
					</div>
					<div id="two_right_2">
						<div id="two_right_2_top">
							<span>本类更新</span>
						</div>
						<div class="two_right_2_foot">
							<ul>
								<c:forEach items="${this_latest}" var="art">
									<li onclick="showArticle('${art.id}','${art.menu_id}')">
									<span id="two_right_2_foot">${art.title}</span>
									<span id="two_center_foot_right_2">[${art.createtime}]</span>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>
			
			<div class="clear"></div>
			
	  	</div>
  		<!-- content end -->
  		<script type="text/javascript">
  		/* 跳转到内容页 */
			function showArticle(artId,menuId){
				window.open('webcenter/webarticlecontent?id='+artId+'&&menu_id='+menuId,'_parent');
			}
			/* 搜索 */
			function search(){
				var type=$("#search_type").val();
				var title=$("#one_left_two").val();
				if(type==1){
				window.open('webcenter/article_search?tit='+title);
				}else{
				window.open('webcenter/download_search?tit='+title);
				}
			}
  		</script>
  		
  		<!-- 版权信息 -->
  		<jsp:include page="ga_foot.jsp" />
  </body>
</html>
