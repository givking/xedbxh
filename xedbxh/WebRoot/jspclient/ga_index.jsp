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
	<link rel="stylesheet" type="text/css" href="<%=basePath%>jspclient/css/ga_index_content.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>jspclient/css/sliderPlay-2.0.min.css" />
	<script src="<%=basePath%>jspclient/js/jquery.min.js"></script>
	<script src="<%=basePath%>jspclient/js/jquery-SliderPlay-2.0.min.js"></script>
	

  </head>
  
  <body>
  		<!-- 头部 -->
  		<jsp:include page="ga_top.jsp" />
  		
  		
  		<!-- 中间内容 -->
  		<div id="content">
	  		<!-- 中间内容页 -->
			<!--  one -->
			<div id="one">
				<div id="img">
					<div id="img_left">
						<img src="<%=basePath%>jspclient/image/gundongxinwen.png"/>
					</div>
				</div>
				<div id="one_left"> 
					<marquee style="margin-top:3px" onMouseOver="this.stop()" onMouseOut="this.start()">	
						<span id="new">${scroll_news}</span>
					</marquee>
				</div>
				<div id="one_center">
					<input type="text" id="one_left_two" placeholder="请输入关键字" 
					style="font-family:Simsum;font-size:13px;text-align:left;padding-left:18px"/>
					<select style="height:23px;" id="search_type">
						<option value='1'>文章搜索</option>
						<option value='2'>下载搜索</option>
					</select> 
				</div>
				<div id="one_right">
					<input style="color:white;" type="button" id="button" onclick="search();" value="搜索"/>
				</div>
			</div>
			
			
			<!--  two -->
			<div id="two">
				<div id="two_left">
					<!-- 轮播图片 -->
					<div class='sliderPlay' id='sliderPlay'>
						<ul class='slider'>
							<c:forEach items="${news_pic}" var="art">
							<li><a href="javascript:showArticle('${art.id}','${art.menu_id}')"><img src='${art.imgpath}' alt='${art.title}'/></a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
					<script>
						$(function(){
							$('#sliderPlay').sliderPlay({
								speed: 500, 		
								timeout: 5000,		 
								moveType: 'opacity',  
								mouseEvent: 'click', 
								isShowTitle: true,	
								isShowBtn:  true  
							});
						});
						
					</script>
					
					
				<div id="two_center">
					<div id="two_center_top">
						<span class="all_title">最新消息</span><span class="more"><a class="more" href="javascript:showMoreall()">更多》</a></span>
					</div>
					<div id="two_center_center">
						<ul>
							<c:forEach items="${latest_news}" var="art">
								<li >
								<span id="two_center_center_left" onclick="showArticleList('${art.menu_id}')">[${art.menu_name}]</span>
								<span id="two_center_center_center" onclick="showArticle('${art.id}','${art.menu_id}')">${art.title}</span>
								<span id="two_center_center_right">[${art.createtime}]</span>
								</li>
							</c:forEach>
						</ul>
					</div>
					<div id="two_center_foot">
					</div>
				</div>
				
				
				<div id="two_right">
					<div id="two_right_top"><a href="javascript:showMore('103')"><img src="jspclient/image/tongzhigg.png"/></a></div>
					<div id="two_right_center"><a href="javascript:showMore('94')"><img src="jspclient/image/zhengcefagui.png"/></a></div>
					<div id="two_right_foot"><a href="javascript:showMore('84')"><img src="jspclient/image/ruhuishenqing.png"/></a></div>
				</div>
			</div>
			
			<!--  three -->
			<!-- 协会资讯 -->
			<div id="three">
				<div id="three_left">
					<div id="three_left_top">
						<span class="all_title">协会资讯</span><span class="more"><a class="more" href="javascript:showMore('85')">更多》</a></span>
					</div>
					
					<div id="three_left_center">
						<div class="left"><img style="width:100%;height:100%;" id="org_info_pic" <c:if test="${ga_info[0].imgpath!='no'}">src="${ga_info[0].imgpath}"</c:if><c:if test="${ga_info[0].imgpath=='no'}">src="jspclient/image/noimg.png"</c:if> ></div>
						<div class="right">
							<div class="right_top">
								<a href="javascript:showArticle('${ga_info[0].id}','${ga_info[0].menu_id}')"><span>${ga_info[0].title}</span></a>
							</div>
							<div class="right_foot">
								<p><c:if test="${fn:length(ga_info[0].content)<=30}">${ga_info[0].content}</c:if>
								<c:if test="${fn:length(ga_info[0].content)>30}">${fn:substring(ga_info[0].content,0,30)}...</c:if></p>
							</div>
						</div>
					</div>
					
					<div id="three_left_foot">
						<ul style="list-style:none;">
							<c:forEach items="${ga_info}" var="art" begin="1">
								<li onclick="showArticle('${art.id}','${art.menu_id}')">
								<span class="three_left_foot">${art.title}</span>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
				
				
				<!-- 行业动态 -->
				<div id="three_center">
					<div id="three_center_top">
						<span class="all_title">行业动态</span><span class="more"><a class="more" href="javascript:showMore('86')">更多》</a></span>
					</div>
					<div id="three_center_center">
						<div class="left"><img style="width:100%;height:100%;" id="ga_dyn_pic" <c:if test="${ga_dyn[0].imgpath!='no'}">src="${ga_dyn[0].imgpath}"</c:if><c:if test="${ga_dyn[0].imgpath=='no'}">src="jspclient/image/noimg.png"</c:if>></div>
						<div class="right">
							<div class="right_top">
								<a href="javascript:showArticle('${ga_dyn[0].id}','${ga_dyn[0].menu_id}')"><span>${ga_dyn[0].title}</span></a>
							</div>
							<div class="right_foot">
								<p><c:if test="${fn:length(ga_dyn[0].content)<=30}">${ga_dyn[0].content}</c:if>
								<c:if test="${fn:length(ga_dyn[0].content)>30}">${fn:substring(ga_dyn[0].content,0,30)}...</c:if>
								</p>
							</div>
						</div>
					</div>
					<div id="three_center_foot">
						<ul style="list-style:none;">
							<c:forEach items="${ga_dyn}" var="art" begin="1">
								<li onclick="showArticle('${art.id}','${art.menu_id}')">
								<span class="three_left_foot">${art.title}</span>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
				
				
				<!-- 会员中心 -->
				<div id="three_right">
					<div id="three_right_top">
						<span class="all_title">会员中心</span><span class="more"><a class="more" href="javascript:showMore('87')">更多》</a></span>
					</div>
					
					<!-- 这里要上下滚动 -->
					<div id="three_right_foot">
					<ul id="roll">
							<c:forEach items="${ga_member}" var="art" begin="1">
								<li onclick="showArticle('${art.id}','${art.menu_id}')">
								<span class="three_left_foot">${art.title}</span>
								</li>
							</c:forEach>
						</ul>
						  <div id="bug"></div>
					</div>
					<script type="text/javascript">
					(function(A){
					   function _ROLL(obj){
						  this.ele = document.getElementById(obj);
					   this.interval = false;
					   this.currentNode = 0;
					   this.passNode = 0;
					   this.speed = 100;
					   this.childs = _childs(this.ele);
					   this.childHeight = parseInt(_style(this.childs[0])['height']);
						   addEvent(this.ele,'mouseover',function(){
													   window._loveYR.pause();
							   });
						addEvent(this.ele,'mouseout',function(){
													   window._loveYR.start(_loveYR.speed);
							   });
					   }
					   function _style(obj){
						 return obj.currentStyle || document.defaultView.getComputedStyle(obj,null);
					   }
					   function _childs(obj){
					   var childs = [];
					   for(var i=0;i<obj.childNodes.length;i++){
					   var _this = obj.childNodes[i];
					   if(_this.nodeType===1){
					   childs.push(_this);
					   }
					   }   
					   return childs;
					   }
					 function addEvent(elem,evt,func){
						if(-[1,]){
						 elem.addEventListener(evt,func,false);   
						}else{
						 elem.attachEvent('on'+evt,func);
						};
					 }
					 function innerest(elem){
						  var c = elem;
					   while(c.childNodes.item(0).nodeType==1){
						   c = c.childNodes.item(0);
					   }
					   return c;
					 }
					   _ROLL.prototype = {
						  start:function(s){
							   var _this = this;
						 _this.speed = s || 100;
							_this.interval = setInterval(function(){
							  _this.ele.scrollTop += 1;
						   _this.passNode++;
						   if(_this.passNode%_this.childHeight==0){
							  var o = _this.childs[_this.currentNode] || _this.childs[0];
							  _this.currentNode<(_this.childs.length-1)?_this.currentNode++:_this.currentNode=0;
							  _this.passNode = 0;
							  _this.ele.scrollTop = 0;
							  _this.ele.appendChild(o);
						   }
							},_this.speed);
					   },
					   pause:function(){
					   var _this = this;
						  clearInterval(_this.interval);
					   }
					   }
						A.marqueen = function(obj){A._loveYR = new _ROLL(obj); return A._loveYR;}
					})(window);
					marqueen('roll').start(100/*速度默认100*/);
					</script>
				</div>
			</div>
			
			
			<!--  four  -->
			<div id="four">
			<!-- 政策法规 -->
				<div id="four_left">
					<div id="four_left_top">
						<span class="all_title">政策法规</span><span class="more"><a class="more" href="javascript:showMore('94')">更多》</a></span>
					</div>
					<div id="four_left_foot">
						<ul style="list-style:none;">
							<c:forEach items="${ga_law}" var="art" >
								<li onclick="showArticle('${art.id}','${art.menu_id}')">
								<span class="three_left_foot">${art.title}</span>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<!-- 研究与杂谈 -->
				<div id="four_center">
					<div id="four_center_top">
						<span class="all_title">研究与杂谈</span><span class="more"><a class="more" href="javascript:showMore('99')">更多》</a></span>
					</div>
					<div id="four_center_center">
						<div class="left"><img style="width:100%;height:100%;" id="ga_research_pic" <c:if test="${ga_research[0].imgpath!='no'}">src="${ga_research[0].imgpath}"</c:if><c:if test="${ga_research[0].imgpath=='no'}">src="jspclient/image/noimg.png"</c:if>></div>
						<div class="right">
							<div class="right_top">
								<a href="javascript:showArticle('${ga_research[0].id}','${ga_research[0].menu_id}')"><span>${ga_research[0].title}</span></a>
							</div>
							<div class="right_foot">
								<p><c:if test="${fn:length(ga_research[0].content)<=30}">${ga_research[0].content}</c:if>
								<c:if test="${fn:length(ga_research[0].content)>30}">${fn:substring(ga_research[0].content,0,30)}...</c:if>
								</p>
							</div>
						</div>
					</div>
					<div id="four_center_foot">
						<ul style="list-style:none;">
							<c:forEach items="${ga_research}" var="art" begin="1">
								<li onclick="showArticle('${art.id}','${art.menu_id}')">
								<span class="three_left_foot">${art.title}</span>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
				
				
				
				<!-- 下载中心 -->
				<div id="three_right">
					<div id="four_right_top">
						<span class="all_title">下载中心</span><span class="more"><a class="more" href="javascript:showMore('101')">更多》</a></span>
					</div>
					<div id="four_right_foot">
						<ul style="list-style:none;">
							<c:forEach items="${ga_file}" var="art" >
								<li>
								<a href="javascript:downfile('${art.id}')">
								<span class="three_left_foot">${art.filename}</span>
								</a>
								</li>
							</c:forEach>
						</ul>
					
					</div>
				</div>
			</div>
			
			
			<!--  five  -->
			<div id="five">
				<div id="five_top"></div>
				<div id="five_foot">
					<!-- 滚动效果 -->
					<div id=demo style="overflow:hidden;width:980px;height:85px;line-height:85px;">
							<table border=0 align=center cellpadding=0 cellspacing=13>
								<tr>
									<td valign=top bgcolor=ffffff id=marquePic1>
										<table width='100%' border='0' cellspacing='8'>
											<tr>
												<td align=center><a href='http://www.scmfa.org.cn/'><img title="四川省小额贷款公司协会" src='<%=basePath%>jspclient/image/link-01.png'></a></td>
												<td align=center><a href='http://www.china-cmca.org/'><img title="中国小额贷款公司协会"src='<%=basePath%>jspclient/image/link-02.png'></a></td>
												<td align=center><a href='http://www.scjrb.gov.cn/'><img title="四川省金融工作局" src='<%=basePath%>jspclient/image/link-03.png'></a></td>
												<td align=center><a href='http://www.ncjrw.gov.cn/'><img title="南充金融网" src='<%=basePath%>jspclient/image/link-04.png'></a></td>
												<td align=center><a href='http://www.scrzdb.org/'><img title="四川省融资担保协会"src='<%=basePath%>jspclient/image/link-05.png'></a></td>
												<td align=center><a href='http://www.chinafga.org/'><img title="中国融资担保协会" src='<%=basePath%>jspclient/image/link-06.png'></a></td>
												<td align=center><a href='http://www.cbrc.gov.cn/index.html'><img title="中国银行业监督管理委员会" src='<%=basePath%>jspclient/image/link-07.png'></a></td>
												<td align=center><a href='http://www.pbc.gov.cn/'><img title="中国人民银行" src='<%=basePath%>jspclient/image/link-08.png'></a></td>
												<td align=center><a href='http://www.sccrg.com.cn/'><img title="四川省信用再担保有限公司" src='<%=basePath%>jspclient/image/link-09.png'></a></td>
											</tr>
										</table>
									</td>
									<td id=marquePic2 valign=top></td>
								</tr>
							</table>
						</div>
						<script type="text/javascript">
						var speed=50 
						marquePic2.innerHTML=marquePic1.innerHTML 
						function Marquee(){ 
						if(demo.scrollLeft>=marquePic1.scrollWidth){ 
						demo.scrollLeft=0 
						}else{ 
						demo.scrollLeft++ 
						} 
						} 
						var MyMar=setInterval(Marquee,speed) 
						demo.onmouseover=function() {clearInterval(MyMar)} 
						demo.onmouseout=function() {MyMar=setInterval(Marquee,speed)} 
						</script>
				</div>
			</div>
  		</div>
  		<script type="text/javascript">
  			/* 文件下载 */
			function downfile(ids){
				window.location.href="<%=basePath%>download/downfile?ids="+ids;
			}
			/* 跳转到内容页 */
			function showArticle(artId,menuId){
				window.open('webcenter/webarticlecontent?id='+artId+'&&menu_id='+menuId,'_parent');
			}
			function showArticleList(menuId){
				window.open('webcenter/webarticlelist?id='+menuId,'_parent');
			}
			/* 更多 */
			function showMore(artId){
				window.open('webcenter/webarticlelist?id='+artId);
			}
			/* 最新消息的更多 */
			function showMoreall(){
				window.open('webcenter/webarticlelistall?type=all');
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
  		<!-- content end -->
  		
  		
  		<!-- 版权信息 -->
  		<jsp:include page="ga_foot.jsp" />
  </body>
</html>
