<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<link href="<%=basePath%>jspclient/css/list.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>jspclient/js/jquery.min.js"></script>
<style type="text/css">
#p1 td{border:1px solid #cccccc}
</style>

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
    
        window.location.href="<%=basePath%>webcenter/webpowerlist?page="+obj.value;
    }
 
 
}

</script>

</head>

<body>
<!--滚动图片-->
<jsp:include page="top.jsp" />
<!--列表页主题-->
<div class="list_main">

   <div class="list_location">
   <span class="t1"><img src="jspclient/image/t_ico.jpg" /></span>
    <span class="t2">当前位置：></span>
   <span class="t2"><a href="webcenter/clienthome">首页></a></span>
   <span class="t3">建设项目办理公示</span>
  </div>
  
  <div class="list_contain">
  
  <div style=" width:1000px; height:20px"></div>
  
  <div class="contain_bd">
  

  
  
     <div class="r_top" style="width:1000px;"><span style="width:5px; height:29px; margin-top:10px; margin-left:20px; float:left; display:block"><img src="jspclient/image/menu_list.png" /></span><span style="margin-top:18px; margin-left:10px; float:left; font-size:16px; font-weight:600; display:block">建设项目办理公示</span></div>
  
  <div class="r_list" style="width:780px;margin-left:100px;">
            <table id="p1"  width="760" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="150" height="33" style="font-size:14px; font-weight:600; text-align:center">办理事项</td>
                <td width="220" style="font-size:14px; font-weight:600; text-align:center">申请单位</td>
                <td width="220" style="font-size:14px; font-weight:600; text-align:center">项目名称</td>
                <td width="70" style="font-size:14px; font-weight:600; text-align:center">状态</td>
                <td width="100" style="font-size:14px; font-weight:600; text-align:center">时间</td>
              </tr>
              <tr>
                <td colspan="5" valign="top"><table width="760" border="0" cellspacing="0" cellpadding="0" class="power_main">
                <c:forEach items="${plist}" var="power">
                  <tr>
                    <td width="150" height="36" align="center">${power.casenum}</td>
                    <td width="220" align="center">${power.caseunit}</td>
                    <td width="220" align="center">${power.title}</td>
                    <td width="70" align="center"><c:if test="${power.result=='0'}">未办</c:if><c:if test="${power.result=='1'}">办结</c:if></td>
                    <td width="100" align="center">${power.createtime}</td>
                  </tr>
               </c:forEach>
                </table></td>
              </tr>
            </table>
  </div>
  
  <div class="list_page" style="width:760px;margin-left:100px;">
  
  <table width="100%" border="0" align="center" cellpadding="0"
										cellspacing="0" style="background-color: #e6e7e8">
										<tr>
											<td width="50%" style="height:30px;">
												共
												<span class="right-text09">${page.pagecount}</span>
												页 | 第
												<span class="right-text09">${page.curentpage}</span>
												页
											</td>
											<td width="49%" align="right">
												[
												<a href="webcenter/webpowerlist?page=1"
													class="right-font08">首页</a> |
												<a
													href="webcenter/webpowerlist?page=${page.pagebefroe}"
													class="right-font08">上一页</a> |
												<a
													href="webcenter/webpowerlist?page=${page.pageafter}"
													class="right-font08">下一页</a> |
												<a
													href="webcenter/webpowerlist?page=${page.pagecount}"
													class="right-font08">末页</a>   转到:<input id="yema" type="text" name="yema" style="width:30px;height:16px"/><input type="button" name="go" value="GO" onclick="gogo()"/>] 
											</td>
										</tr>
									</table>
  
  </div>
  

  
  
  </div>
  
  </div>
  

</div>
<!--网页尾部添加-->
<jsp:include page="foot.jsp" />

</body>
</html>
