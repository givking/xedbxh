<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>南充市慈善网</title>


<link href="<%=basePath%>jspclient/css/zzsc.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>jspclient/css/cs_style.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>jspclient/css/scroll_style.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="<%=basePath%>jspclient/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>jspclient/js/zzsc.js"></script>
<script type="text/javascript"
	src="<%=basePath%>jspclient/js/bplayer.js"></script>
<script type="text/javascript" src="<%=basePath%>jspclient/js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>jspclient/js/scroll.js"></script>
<style type="text/css">
a {
	font-size: 13px;
	color: #333333;
	text-decoration: none;
}

a:hover {
	color: red;
	text-decoration: underline;
}

img {
	border: none;
}

.marquee ul {
	width: 3000px;
}

.marquee {
	width: 440px;
	height: 122px;
	overflow: hidden;
	border: 0;
}

.marquee li {
	display: inline;
	float: left;
	margin-right: 12px;
}

.marquee li a {
	width: 170px;
	height: 122px;
	display: block;
	float: left;
	text-align: center;
	font-size: 14px;
}

.marquee li a:hove {
	text-decoration: none;
}

.marquee li img {
	width: 150px;
	height: 100px;
}

.marquee li em {
	color: black;
	font-style: normal;
	height: 22px;
	line-height: 22px;
	display: block;
}
</style>



</head>

<body>
	<!--滚动图片-->

	<jsp:include page="cs_top.jsp" />



	<!-- main -->
	<div id="main">
		<div id="content_1">
			<div style="width:590px;height:335px;float:left;margin: 0;padding: 0">
				<div id="header">
					<div class="wrap">
						<div id="slide-holder">
							<div id="slide-runner">
								<c:forEach items="${notice_pic}" var="art" varStatus="stu">
									<a
										href="webcenter/webarticlecontent?id=${art.id}&&menu_id=${art.menu_id}"
										target="_blank"><img id="slide-img-${stu.count}"
										src="${art.imgpath}" class="slide" alt="${art.title}"
										width="590" height="322" /> </a>
								</c:forEach>
								<div id="slide-controls">
									<p id="slide-client" class="text">
										<strong></strong><span></span>
									</p>
									<p id="slide-desc" class="text"></p>
									<p id="slide-nav"></p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
<script type="text/javascript">

function showArticle(artId,menuId){
	window.open('webcenter/webarticlecontent?id='+artId+'&&menu_id='+menuId,'_parent');

}
</script>
			<!--公告栏-->
			<div id="bul_board">
				<div id="title_bul">
					<span style="float:right; margin:10px 6px auto auto; "><a
						href="webcenter/webarticlelist?id=39">更多&gt;&gt;</a> </span>
				</div>
				<div id="notic">
					<ul>
						<c:forEach items="${latest_news}" var="art">
							<li onclick="showArticle('${art.id}','${art.menu_id}')"><span class="sn1">${art.title}
							</span><span class="sn2">[${art.createtime}]</span></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		<div class="clear"></div>

		<div id="pic_vol">
			<div id="line">
				<div id="online_donate">
					<a href="<%=basePath%>jspclient/donation_online.jsp"><img
						src="jspclient/image/online_donate_bg.png" alt="" /> </a>
				</div>
				<div id="vol_application">
					<a href="<%=basePath%>webcenter/govolunteer"><img
						src="jspclient/image/vol_appli_bg.png" alt="" /> </a>
				</div>
			</div>
			<div id="donate_pub">

				<div id="amount_pub">
					<div id="a_1">捐赠金额公示</div>
					<div id="a_2">
						2016年至今累计善款<span id="a_3">${sum}</span>元
					</div>
				</div>

				<div id="project_pub">
					<div id="pub_pic"></div>
					<div class="marquee">
						<ul style="width:100">
							<li><c:forEach items="${notice_pic}" var="art"
									varStatus="stu">
									<a
										href="webcenter/webarticlecontent?id=${art.id}&&menu_id=${art.menu_id}"
										target="_blank"><img src="${art.imgpath}"
										alt="${art.title}" border="0" /><em>${art.title}</em> </a>

								</c:forEach></li>
						</ul>
					</div>

					<script type="text/javascript">
$(document).ready(function(){
	$('.marquee').kxbdMarquee({
			direction:'left',
			eventA:'mouseenter',
			eventB:'mouseleave'
	});
});
</script>
					<script type="text/javascript">
//滚动
(function($){

	$.fn.kxbdMarquee = function(options){
		var opts = $.extend({},$.fn.kxbdMarquee.defaults, options);
		
		return this.each(function(){
			var $marquee = $(this);//滚动元素容器
			var _scrollObj = $marquee.get(0);//滚动元素容器DOM
			var scrollW = $marquee.width();//滚动元素容器的宽度
			var scrollH = $marquee.height();//滚动元素容器的高度
			var $element = $marquee.children(); //滚动元素
			var $kids = $element.children();//滚动子元素
			var scrollSize=0;//滚动元素尺寸
			var _type = (opts.direction == 'left' || opts.direction == 'right') ? 1:0;//滚动类型，1左右，0上下

			//防止滚动子元素比滚动元素宽而取不到实际滚动子元素宽度
			$element.css(_type?'width':'height',10000);
			//获取滚动元素的尺寸
			if (opts.isEqual) {
				scrollSize = $kids[_type?'outerWidth':'outerHeight']() * $kids.length;
			}else{
				$kids.each(function(){
					scrollSize += $(this)[_type?'outerWidth':'outerHeight']();
				});
			}
			//滚动元素总尺寸小于容器尺寸，不滚动
			if (scrollSize<(_type?scrollW:scrollH)) return; 
			//克隆滚动子元素将其插入到滚动元素后，并设定滚动元素宽度
			$element.append($kids.clone()).css(_type?'width':'height',scrollSize*5);
			
			var numMoved = 0;
			function scrollFunc(){
				var _dir = (opts.direction == 'left' || opts.direction == 'right') ? 'scrollLeft':'scrollTop';
				if (opts.loop > 0) {
					numMoved+=opts.scrollAmount;
					if(numMoved>scrollSize*opts.loop){
						_scrollObj[_dir] = 0;
						return clearInterval(moveId);
					} 
				}
				if(opts.direction == 'left' || opts.direction == 'up'){
					var newPos = _scrollObj[_dir] + opts.scrollAmount;
					if(newPos>=scrollSize){
						newPos -= scrollSize;
					}
					_scrollObj[_dir] = newPos;
				}else{
					var newPos = _scrollObj[_dir] - opts.scrollAmount;
					if(newPos<=0){
						newPos += scrollSize;
					}
					_scrollObj[_dir] = newPos;
				}
			};
			//滚动开始
			var moveId = setInterval(scrollFunc, opts.scrollDelay);
			//鼠标划过停止滚动
			$marquee.hover(
				function(){
					clearInterval(moveId);
				},
				function(){
					clearInterval(moveId);
					moveId = setInterval(scrollFunc, opts.scrollDelay);
				}
			);
			
			//控制加速运动
			if(opts.controlBtn){
				$.each(opts.controlBtn, function(i,val){
					$(val).bind(opts.eventA,function(){
						opts.direction = i;
						opts.oldAmount = opts.scrollAmount;
						opts.scrollAmount = opts.newAmount;
					}).bind(opts.eventB,function(){
						opts.scrollAmount = opts.oldAmount;
					});
				});
			}
		});
	};
	$.fn.kxbdMarquee.defaults = {
		isEqual:true,//所有滚动的元素长宽是否相等,true,false
		loop: 0,//循环滚动次数，0时无限
		direction: 'left',//滚动方向，'left','right','up','down'
		scrollAmount:1,//步长
		scrollDelay:10,//时长
		newAmount:3,//加速滚动的步长
		eventA:'mousedown',//鼠标事件，加速
		eventB:'mouseup'//鼠标事件，原速
	};
	
	$.fn.kxbdMarquee.setDefaults = function(settings) {
		$.extend( $.fn.kxbdMarquee.defaults, settings );
	};
	
})(jQuery);
</script>


				</div>
			</div>
		</div>
		<div class="clear"></div>
		<div id="center_mes">
			<!--慈善新闻-->
			<div class="news_info">
				<div id="title_news">
					<span style="float:right; margin:15px 10px auto auto; "><a
						href="webcenter/webarticlelist?id=40">更多&gt;&gt;</a> </span>
				</div>
				<div class="news_cont">
				
				<!-- 修改 -->
					<div class="left"><img src="${ga_info[0].imgpath}" style="width: 72px;height:72px;"/>
					</div>
					<div class="right">
								<div class="right_top">
									<span>${ga_info[0].title}</span>
								</div>
								<div class="right_foot">
									<p>${ga_info[0].content}</p>
								</div>
					</div>
				<!-- 修改 结束-->
					<div class="n_1">
						<ul style="list-style:none;">
							<c:forEach items="${ga_info}" var="art" begin="1">
								<li onclick="showArticle('${art.id}','${art.menu_id}')"><span class="nc_1"><%-- <a
										href="webcenter/webarticlecontent?id=${art.id}&&menu_id=${art.menu_id}">${art.title}</a>  --%><img
											src="jspclient/image/sign_point.png" />${art.title}</span> <span
									class="nc_2">[${art.createtime}]</span></li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
			<!--组织信息-->
			<div class="news_info" style="float:right;">
				<div id="title_info">
					<span style="float:right; margin:15px 10px auto auto; "><a
						href="webcenter/webarticlelist?id=41">更多&gt;&gt;</a> </span>
				</div>
				<div class="news_cont">
					<div class="n_1">
						<ul style="list-style:none;">
							<c:forEach items="${make_org}" var="art">
								<li onclick="showArticle('${art.id}','${art.menu_id}')"><span class="nc_1"><%-- <a
										href="webcenter/webarticlecontent?id=${art.id}&&menu_id=${art.menu_id}"><img
											src="jspclient/image/sign_point.png" />${art.title}</a> --%> <img
											src="jspclient/image/sign_point.png" />${art.title}</span> <span
									class="nc_2">[${art.createtime}]</span></li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div id="dona_info">

			<div id="net_dona">
				<div class="n_nav_1">
					<a href="<%=basePath%>jspclient/donation_online.jsp"><img
						src="jspclient/image/nav_1.png" alt="" /> </a>
				</div>
				<div class="n_nav_1">
					<a href="<%=basePath%>webcenter/govolunteer"><img
						src="jspclient/image/nav_2.png" alt="" /> </a>
				</div>
				<div class="n_nav_2" style="margin-bottom:10px;">
					<span id="n_tel"><a href="">0818-2809051</a> </span>
				</div>
				<div class="n_nav_3">
					<span id="n_mon">${ontimesum}</span>元
				</div>
			</div>

			<div id="dona_exh">
				<!--最新捐赠-->
				<div id="newest_don">
					<div id="title_newest_don">
						<span style="float:right; margin:15px 6px auto auto; "><a
							href="webcenter/webarticlelist?id=43">更多&gt;&gt;</a> </span>
					</div>
					<div class="box">
						<div class="bcon">
							<table width="480" border="0" cellpadding="0" cellspacing="0">
							<tr  style="color:#F87D52;">
								<th width="120" height="25" align="left"
									style="font-weight:normal;text-indent:10px;">日期</th>
								<th width="120" align="left" style="font-weight:normal;text-indent:10px;">捐赠人</th>
								<th width="120" align="left" style="font-weight:normal;text-indent:10px;">金额</th>
								<th width="120" align="left" style="font-weight:normal;text-indent:10px;">捐赠意向</th>
							</tr>
							</table>
							<!-- 代码开始 -->
							<div class="list_lh">
								<ul>
								<c:forEach items="${latestdon}" var="art">
								<li>
								<table width="480" border="0" cellpadding="0" cellspacing="0">
								<tr  style="color:#F87D52;">
									<td width="120" align="left" style="font-weight:normal;">${art.createtime}</td>
									<td width="120" align="left" style="font-weight:normal;">${art.donor}</td>
									<td width="120" align="left" style="font-weight:normal;">${art.amount}</td>
									<td width="120" align="left" style="font-weight:normal;">${art.intention}</td>
									</tr>
									</table>
								</li>
							</c:forEach>
								</ul>
							</div>
							<!-- 代码结束 -->
						</div>
						<script type="text/javascript">
						$(document).ready(function(){
							$('.list_lh li:even').addClass('lieven');
						});
						$(function(){
							$("div.list_lh").myScroll({
								speed:60, //数值越大，速度越慢
								rowHeight:37 //li的高度
							});
						});
						</script>
						
					</div>
				</div>
				<!--专项捐赠-->
				<div id="specil_don">
					<div id="title_specil_don">
						<span style="float:right; margin:15px 6px auto auto; "><a
							href="webcenter/webarticlelist?id=42">更多&gt;&gt;</a> </span>
					</div>
					<div class="news_cont">
						<c:forEach items="${make_donation}" var="art">
							<div class="n_2" onclick="showArticle('${art.id}','${art.menu_id}')" style="cursor:pointer;">
								<span class="sd_1"><%-- <a
									href="webcenter/webarticlecontent?id=${art.id}&&menu_id=${art.menu_id}">${art.title}</a> --%>
									${art.title}
								</span>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<!--友情链接-->
		<div id="fri_link">
			<div id="title_fri"></div>
			<div class="net_link">
				<span><a href="" target="_blank">中华慈善网</a> </span>
			</div>
			<div class="net_link">
				<span><a href="" target="_blank">成都慈善信息网</a> </span>
			</div>
			<div class="net_link">
				<span><a href="" target="_blank">南充市民政局</a> </span>
			</div>
			<div class="net_link">
				<span><a href="" target="_blank">南充市人民政府</a> </span>
			</div>
			<div class="net_link">
				<span><a href="" target="_blank">四川慈善网</a> </span>
			</div>
			<div class="net_link">
				<span><a href="http://www.sczyfw.org/" target="_blank">四川自愿服务网</a> </span>
			</div>
			<div>
				<img src="jspclient/image/link_2.png" />
			</div>

		</div>
	</div>

	<!-- main end! -->

	<!--网页尾部添加-->

	<jsp:include page="cs_foot.jsp" />
</body>
<script type="text/javascript">
    if(!window.slider) {
		var slider={};
	}
	slider.data= slider.data= [
	<c:forEach items="${notice_pic}" var="art" varStatus="stu">
	
	<c:if test="${stu.count!=5}">
	  {
        "id":"slide-img-${stu.count}", // 与slide-runner中的img标签id对应
        "client":"",
        "desc":"${art.title}" //这里修改描述
    },
	
	</c:if>
      <c:if test="${stu.count==5}">
    {
        "id":"slide-img-${stu.count}", // 与slide-runner中的img标签id对应
        "client":"",
        "desc":"${art.title}" //这里修改描述
    }
    </c:if>
    </c:forEach>
    
	];
   </script>
</html>
