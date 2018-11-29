<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>南充市住房和城乡建设局</title>
<link href="<%=basePath%>jspclient/css/global.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>jspclient/css/index.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=basePath%>jspclient/css/zzsc.css" type="text/css" media="screen" />
<script type="text/javascript" src="<%=basePath%>jspclient/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>jspclient/js/zzsc.js"></script>
<script type="text/javascript" src="<%=basePath%>jspclient/js/bplayer.js"></script>

<style type="text/css">
#pow{color:#FFFFFF;}
#pow:hover{color:#fbbe82}
#sb{color:#3890f3}
#sb:hover{color:#f0a90f}
</style>

<script type="text/javascript">
function sel(){
var title= $("#tt").val();

window.location.href="<%=basePath%>webcenter/webselarticle?tit="+title;

}

function qiehuan(id){
var a=document.getElementById("zx");
var b=document.getElementById("dc");
if(id=="zx"){
a.style.display="block";
b.style.display="none";
}else{
b.style.display="block";
a.style.display="none";

}

}

</script>


</head>

<body>
<!--滚动图片-->
<jsp:include page="top.jsp" />

<!--首页主体-->
<div class="main_body">
  <div class="news_scroll">
    <div class="news_scroll_news">
      <div class="scroll_news_dv1">热点新闻:</div>
      <div class="scroll_news_dv2">
        <marquee direction="left" onmouseout="this.start()" onmouseover="this.stop()" behavior="scroll" loop="3" scrollamount="1" scrolldelay="10">
          <c:forEach items="${news_hot}" var="art"><span class="dv2_s"><a href="webcenter/webarticlecontent?id=${art.id}&&menu_id=${art.menu_id}">${art.title}</a></span></c:forEach>
        </marquee>
      </div>
    </div>
    <div class="news_scroll_sel">
      <div class="scroll_sel_dv1">全文检索：</div>
      <div class="scroll_sel_dv2"><span class="sel_dv2_s1">
        <input type="text" id="tt" name="sel" style=" width:130px;height:18px; display:block" />
      </span><span class="sel_dv2_s2"><a href="javascript:sel()"><img src="jspclient/image/btn_sel.jpg" height="22"/></a></span></div>
    </div>
  </div>
  <!--end 全文检索-->
  <div class="main_middle">
    <div class="main_middle_l"> 
	
	
	<div id="header">
  <div class="wrap">
   <div id="slide-holder">
		<div id="slide-runner">
		<c:forEach items="${news_pic}" var="art" varStatus="stu">
			<a href="webcenter/webarticlecontent?id=${art.id}&&menu_id=${art.menu_id}" target="_blank"><img id="slide-img-${stu.count}" src="${art.imgpath}" class="slide" alt="${art.title}" width="520" height="316" /></a>
        </c:forEach>
			<div id="slide-controls">
			 <p id="slide-client" class="text"><strong></strong><span></span></p>
			 <p id="slide-desc" style="width:300px;height:16px;overflow: hidden" class="text"></p>
			 <p id="slide-nav"></p>
			</div>
		</div>
   </div>
   <script type="text/javascript">
    if(!window.slider) {
		var slider={};
	}

	slider.data= [
	<c:forEach items="${news_pic}" var="art" varStatus="stu">
	
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
  </div>
</div>


	
	
	
	
	
	
	
	
	 </div>
    <div class="main_middle_r">
      <div class="middle_r_c">
        <div style="width:450px; height:10px;"></div><c:if test=""></c:if>
        <div class="r_c_top"><span style="color:#2071c0; font-weight:600; float:left;">工作动态</span><span style="font-weight:600; float:right;"><a href="webcenter/webarticlelist?id=11" style="color:#2071c0;">更多>></a></span></div>
         <div style="width:450px;height:10px;"></div>
        <div class="r_c_list">
          <ul>
          <c:forEach items="${make_affairs}" var="art">
            <li><span style="float:left; width:360px; height:26px;line-height:26px; display:block; overflow:hidden"><a href="webcenter/webarticlecontent?id=${art.id}&&menu_id=${art.menu_id}">${art.title}</a></span><span style="width:80px; height:26px;float:right; display:block; overflow:hidden">[${art.createtime}]</span></li>
        </c:forEach>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <div style="width:1000px; height:81px; margin:0 auto; margin-top:5px;">
  
  <div class="topvebanner">
  <div id="myjQuery">
    <div id="myjQueryContent">
      <div><a target="_blank"><img src="jspclient/image/2012-1.jpg"/></a></div>
      <div class="smask"><a target="_blank"><img src="jspclient/image/2012-2.jpg"/></a></div>
      <div class="smask"><a  target="_blank"><img src="jspclient/image/2012-3.jpg"/></a></div>
    </div>
    <ul id="myjQueryNav">
      <li class="current">1</li>
      <li>2</li>
      <li>3</li>
    </ul>
  </div>
</div>
</div>
  
  
  </div>
  <!--ad_banner链接图片-->
  <!--zwgk start-->
  <div class="main_content">
    <div class="content_top_img"><img src="jspclient/image/zw_tp.jpg" width="1000" height="62"/></div>
    <div style=" width:1000px; height:30px;"></div>
    <div class="content_list_m">
      <div class="list_m_l">
        <div class="m_l_t1">
          <div class="l_t1_l">
            <div class="l_t1_tit"> <span style=" margin-left:34px; margin-top:14px; float:left; font-size:14px; color:#FFFFFF; display:block"><b>公示公告</b></span> <span style=" float:right; margin-right:10px; margin-top:11px;"><a href="webcenter/webarticlelist?id=6" style="color:#2071c0"><b>更多>></b></a></span> </div>
            <div class="l_t1_list">
              <ul>
              <c:forEach items="${make_notice}" var="art">
                <li><span style=" float:left; margin-left:10px; margin-top:8px;"><img src="jspclient/image/small.png" /></span><span style=" float:left; width:220px; height:20px; margin-left:3px; display:block; overflow:hidden"><a href="webcenter/webarticlecontent?id=${art.id}&&menu_id=${art.menu_id}">${art.title}</a></span><span style=" float:right; margin-right:10px;">${art.createtime}</span></li>
               </c:forEach>
              </ul>
            </div>
          </div>
          <div class="l_t1_r">
            <div class="l_t1_tit"> <span style=" margin-left:34px; margin-top:14px; float:left; font-size:14px; color:#FFFFFF; display:block"><b>公文公报</b></span> <span style=" float:right; margin-right:10px; margin-top:11px;"><a href="webcenter/webgwreport?menu_id=5" style="color:#2071c0"><b>更多>></b></a></span> </div>
            <div class="l_t1_list">
              <ul>
              <c:forEach items="${make_file}" var="art">
                <li><span style=" float:left; margin-left:10px; margin-top:8px;"><img src="jspclient/image/small.png" /></span><span style=" float:left; width:220px; height:20px; margin-left:3px; display:block; overflow:hidden"><a href="webcenter/webarticlecontent?id=${art.id}&&menu_id=${art.menu_id}">${art.title}</a></span><span style=" float:right; margin-right:10px;">${art.createtime}</span></li>
                </c:forEach>
              </ul>
            </div>
          </div>
        </div>
        <!--上线2个区块分界处-->
        <div style="width:700px; height:20px;"></div>
        <div class="m_l_t1">
          <div class="l_t1_l">
            <div class="l_t1_tit"> <span style=" margin-left:34px; margin-top:14px; float:left; font-size:14px; color:#FFFFFF; display:block"><b>政策法规</b></span> <span style=" float:right; margin-right:10px; margin-top:11px;"><a href="webcenter/webarticlelist?id=8" style="color:#2071c0"><b>更多>></b></a></span> </div>
            <div class="l_t1_list">
              <ul>
              <c:forEach items="${make_law}" var="art">
                <li><span style=" float:left; margin-left:10px; margin-top:8px;"><img src="jspclient/image/small.png" /></span><span style=" float:left; width:220px; height:20px; margin-left:3px; display:block; overflow:hidden"><a href="webcenter/webarticlecontent?id=${art.id}&&menu_id=${art.menu_id}">${art.title}</a></span><span style=" float:right; margin-right:10px;">${art.createtime}</span></li>
                </c:forEach>
              </ul>
            </div>
          </div>
          <div class="l_t1_r">
            <div class="l_t1_tit"> <span style=" margin-left:34px; margin-top:14px; float:left; font-size:14px; color:#FFFFFF; display:block"><b>行业信息</b></span> <span style=" float:right; margin-right:10px; margin-top:11px;"><a href="webcenter/webarticlelist?id=9" style="color:#2071c0"><b>更多>></b></a></span> </div>
            <div class="l_t1_list">
              <ul>
               <c:forEach items="${news_industry}" var="art">
                <li><span style=" float:left; margin-left:10px; margin-top:8px;"><img src="jspclient/image/small.png" /></span><span style=" float:left; width:220px; height:20px; margin-left:3px; display:block; overflow:hidden"><a href="webcenter/webarticlecontent?id=${art.id}&&menu_id=${art.menu_id}">${art.title}</a></span><span style=" float:right; margin-right:10px;">${art.createtime}</span></li>
               </c:forEach>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div class="list_m_r">
        <div class="m_r_zwxx">
          <div class="m_r_top"><span style=" float:left; margin-left:20px; font-size:14px; margin-top:11px; color:#3372a5"><b>政府信息公开</b></span></div>
          <div class="m_r_list">
            <ul>
            <c:forEach items="${affairs}" var="aff">
              <li><span style=" float:left; margin-left:60px; margin-top:10px; font-size:14px"><a href="${aff.url}">${aff.title}</a></span></li>
             </c:forEach>
            </ul>
          </div>
        </div>
        <div style="width:270px; height:58px; margin-top:21px;"><a href="http://www.zzgsc.gov.cn/info/index/511300000"><img src="jspclient/image/xx_zl.png" width="270" height="58"/></a></div>
        <div style="width:270px; height:58px; margin-top:15px;"><a href="http://t.qq.com/jinxi198499"><img src="jspclient/image/xx_txweb.png" width="270" height="58"/></a></div>
        <div style="width:270px; height:58px; margin-top:12px;"><a href="webcenter/wxtwo"><img src="jspclient/image/xx_xlweb.jpg" width="270" height="58"/></a></div>
      </div>
    </div>
    <!--互动交流区-->
    <div class="content_top_img"><img src="jspclient/image/bs_top.jpg" width="1000" height="62"/></div>
    <div style=" width:1000px; height:30px;"></div>
    <div class="bs_main">
      <div class="bs_main_l">
        <div class="bs_m_s1">
          <div style="width:672px; height:70px;"><span style="float:left;width:148px;height:38px;margin-left:16px;margin-top:16px;font-size:16px;display:block;"><a id="pow" href="webcenter/webpowerlist" ><b>建设项目办理公示</b></a></span><span style="float:right;width:80px;height:28px;font-size:13px;margin-top:20px"><a id="sb" href="http://egov.scnczw.gov.cn/egh/hall/UserLogin.aspx" target="_blank"><b>在线申报</b></a></span></div>
          <div style="width:660px; height:263px; margin:0 auto">
            <table width="660" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="120" height="33" style="font-size:14px; font-weight:600; text-align:center">办理事项</td>
                <td width="200" style="font-size:14px; font-weight:600; text-align:center">申请单位</td>
                <td width="200" style="font-size:14px; font-weight:600; text-align:center">项目名称</td>        
                <td width="60" style="font-size:14px; font-weight:600; text-align:center">状态</td>
                  <td width="80" style="font-size:14px; font-weight:600; text-align:center">时间</td>
              </tr>
              <tr>
                <td height="230"colspan="5" valign="top"><table width="660" border="0" cellspacing="0" cellpadding="0" class="power_main">
                <c:forEach items="${powerlist}" var="power">
                  <tr>
                    <td width="120" height="36" align="center">${power.casenum}</td>
                    <td width="200" align="center">${power.caseunit}</td>
                    <td width="200" align="center">${power.title}</td>
                    <td width="60" align="center"><c:if test="${power.result=='0'}">未办</c:if><c:if test="${power.result=='1'}">办结</c:if></td>
                    <td width="80" align="center">${power.createtime}</td>
                  </tr>
               </c:forEach>
                </table></td>
              </tr>
            </table>
          </div>
        </div>
        <!-- s1 结束了-->
        <div class="bs_m_s2">
        <div style="width:672px; height:20px"></div>
          <div style="width:672px; height:35px"><img src="jspclient/image/hd_bg.png" /></div>
          <div style="width:672px; height:20px"></div>
          <div class="s2_main">
            <div class="s2_list_l">
              <div class="s2_list_l_tit"> <span class="mail_s"><a href="webcenter/webmailasklist?menu_id=18" style="color:#FFFFFF"><b>领导信箱</b></a></span> <span style="float:left; margin-left:60px; margin-top:10px;"><a href="webcenter/webmailaskview?menu_id=18"><b>我要写信</b></a></span> </div>
              <div class="s2_list_c">
                <ul>
                <c:forEach items="${mlist}" var="mail">
                  <li><span style="float:left; margin-left:8px; margin-top:10px"><img src="jspclient/image/small.png" /></span> <span style="float:left; width:206px; height:26px; margin-left:3px; overflow:hidden; display:block"><a href="webcenter/webmailaskcontent?id=${mail.id}&&menu_id=${mail.menu_id}">${mail.title}</a></span> <span style="float:right; margin-right:10px">${mail.createtime}</span></li>
                  </c:forEach>
                </ul>
              </div>
            </div>
            <div class="s2_list_r">
              <div class="s2_list_l_tit"> <span class="mail_s"><a href="webcenter/webmailasklist?menu_id=19" style="color:#FFFFFF" onmouseover="qiehuan('zx')"><b>在线咨询</b></a></span> <span style="float:left; margin-left:40px; margin-top:10px;"><a href="webcenter/webonlineaskview?menu_id=19"><b>我要咨询</b></a></span> <span class="ask_s"><a href="webcenter/webpaperlist?menu_id=20" style="color:#FFFFFF" onmouseover="qiehuan('dc')"><b>在线调查</b></a></span> </div>
              <div id="zx" class="s2_list_c">
                <ul>
                  <c:forEach items="${alist}" var="ask">
                  <li><span style="float:left; margin-left:8px; margin-top:10px"><img src="jspclient/image/small.png" /></span> <span style="float:left; width:206px; height:26px; margin-left:3px; overflow:hidden; display:block"><a href="webcenter/webmailaskcontent?id=${ask.id}&&menu_id=${ask.menu_id}">${ask.title}</a></span> <span style="float:right; margin-right:10px">${ask.createtime}</span></li>
                 </c:forEach>
                </ul>
              </div>
              
                <div id="dc" class="s2_list_c" style="display:none">
                <ul>
                  <c:forEach items="${paperlist}" var="paper">
                  <li><span style="float:left; margin-left:8px; margin-top:10px"><img src="jspclient/image/small.png" /></span> <span style="float:left; width:206px; height:26px; margin-left:3px; overflow:hidden; display:block"><a href="webcenter/webpaper?id=${paper.id}&&menu_id=20">${paper.title}</a></span> <span style="float:right; margin-right:10px">${paper.createtime}</span></li>
                 </c:forEach>
                </ul>
              </div>
              
              
            </div>
          </div>
        </div>
      </div>
      <div class="bs_main_r">
      <div style="width: 310px;height:5px;"></div>
        <div class="m_r_c1">
          <div class="c1_tit"> <span style="float:left; margin-left:16px; margin-top:12px; color:#1c76fe; font-weight:600; font-size:14px;">办事指南</span> <span style="float:right; margin-right:10px;; margin-top:12px; font-weight:600;"><a href="webcenter/webarticlelist?id=14" style="color:#1c76fe;">更多>></a></span> </div>
          <div class="c1_list">
            <ul>
            <c:forEach items="${bszn}" var="art">
              <li><span style="float:left; margin-left:8px; margin-top:10px"><img src="jspclient/image/small.png" /></span> <span style="float:left; width:200px; height:26px; margin-left:3px;overflow:hidden"><a href="webcenter/webarticlecontent?id=${art.id}&&menu_id=${art.menu_id}">${art.title}</a></span> <span style="float:right; margin-right:10px">${art.createtime}</span></li>
             </c:forEach>
            </ul>
          </div>
        </div>
        <div class="m_r_c1" style="margin-top:8px;">
          <div class="c1_tit"> <span style="float:left; margin-left:16px; margin-top:12px; color:#1c76fe; font-weight:600; font-size:14px;">附件下载</span> <span style="float:right; margin-right:10px;; margin-top:12px; font-weight:600;"><a href="webcenter/webtablelist?menu_id=15" style="color:#1c76fe;">更多>></a></span> </div>
          <div class="c1_list" style="height:142px">
            <ul>
            <c:forEach items="${web_table}" var="doc">
              <li><span style="float:left; margin-left:8px; margin-top:10px"><img src="jspclient/image/small.png" /></span> <span style="float:left; width:200px; height:26px; margin-left:3px;overflow:hidden"><a href="webcenter/downloaddoc?id=${doc.d_id}">${doc.title}</a></span> <span style="float:right; margin-right:10px">${doc.createtime}</span></li>
            </c:forEach>
            </ul>
          </div>
        </div>
        <!--专题专栏-->
        <div style="width:310px; height:20px"></div>
        <div class="m_r_zt">
          <div class="c1_tit"> <span style="float:left; margin-left:16px; margin-top:12px; color:#1c76fe; font-weight:600; font-size:14px;">专题专栏</span> <span style="float:right; margin-right:10px;; margin-top:12px; font-weight:600;"><a href="webcenter/webarticlelist?id=30" style="color:#1c76fe;">更多>></a></span> </div>
          <div class="zt_list">
            <ul>
              <li><a href="webcenter/webarticlelist?id=33"><img src="jspclient/image/zhuanti_1.jpg" /></a></li>
               <li><a href="webcenter/webarticlelist?id=32"><img src="jspclient/image/zhuanti_7.jpg" /></a></li>
               <li><a href="webcenter/webarticlelist?id=34"><img src="jspclient/image/dflzjs.jpg" /></a></li>
              <li><a href="webcenter/webarticlelist?id=31"><img src="jspclient/image/zhuanti_5.jpg" /></a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div style="width:1000px; height:30px;"></div>
  <div class="friend_url">
    <ul>
      <li style=" border-right:1px solid #999999"> <span style="width:150px; height:33px; float:left; background-color:#0060bf; line-height:33px; text-align:center; margin-left:5px; margin-top:6px; font-size:14px; color:#FFFFFF;display:block"> <b>友情链接</b></span> </li>
      <li><span style=" float:left; margin-left:8px; margin-top:6px"><a href="http://www.gov.cn/" target="_blank"><img src="jspclient/image/link_01.jpg" /></a></span></li>
      <li><span style=" float:left; margin-left:8px; margin-top:6px"><a href="http://www.mohurd.gov.cn/" target="_blank"><img src="jspclient/image/link_03.jpg" /></a></span></li>
      <li><span style=" float:left; margin-left:8px; margin-top:6px"><a href="http://www.sc.gov.cn/" target="_blank"><img src="jspclient/image/link_02.jpg" /></a></span></li>
      <li><span style=" float:left; margin-left:8px; margin-top:6px"><a href="http://www.scjst.gov.cn/main/home.html" target="_blank"><img src="jspclient/image/link_05.jpg" /></a></span></li>
      <li><span style=" float:left; margin-left:8px; margin-top:6px"><a href="http://nanchong.gov.cn/" target="_blank"><img src="jspclient/image/link_04.jpg" /></a></span></li>
    </ul>
  </div>
  <div style="width:1000px; height:20px;"></div>
  <!--网页尾部添加-->

<jsp:include page="foot.jsp" />
</body>
</html>
