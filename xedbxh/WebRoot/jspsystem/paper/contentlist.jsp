<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>My JSP 'list.jsp' starting page</title>
<link href="<%=basePath%>resources/css/laypage.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>resources/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>resources/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/js/laypage.js"></script>
<script type="text/javascript">
$(document).ready(function(){

loadtable();
});

function loadtable(){
$.getJSON("paper/findmodelviewlist",{page:1,rows:10,random:Math.random},function(data){

if(data){
//加载数据
tablerows(data);
//分页

laypage({
        cont: 'page', //容器。值支持id名、原生dom对象，jquery对象。【如该容器为】：<div id="page1"></div>
        pages: data.pagecount, //通过后台拿到的总页数
        curr: 1, //初始化当前页
        jump: function(e){ //触发分页后的回调
        $.getJSON('paper/findmodelviewlist', {page:e.curr,rows:10,random:Math.random}, function(res){
            var indextable=$("#listtable tbody");
            indextable.html("");
          tablerows(res);
          });
        }
    });


//加载结束


}


});

}

function tablerows(data){

var table=$("#listtable tbody");
var list = data.datas;
if(list.length>0){
   for(var i = 0;i<list.length;i++){

   
       table.append("<tr><td><input onclick='allcheck()' name=\"id\" type=\"checkbox\" value=\""+list[i].id+"\" /></td><td>"+list[i].p_title+"</td><td>"+list[i].e_title+"</td><td>"+list[i].createtime+"</td><td width='400'>"+list[i].content+"</td></tr>");

    }
$('.tablelist tbody tr:odd').addClass('odd');
}


}


function sel(){

var tit = $("#sel").val();

$.getJSON("paper/findmodelviewlist",{page:1,rows:10,selkey:tit,random:Math.random},function(data){

if(data){
//加载数据
tablerows(data);
//分页

laypage({
        cont: 'page', //容器。值支持id名、原生dom对象，jquery对象。【如该容器为】：<div id="page1"></div>
        pages: data.pagecount, //通过后台拿到的总页数
        curr: 1, //初始化当前页
        jump: function(e){ //触发分页后的回调
        $.getJSON('paper/findmodelviewlist', {page:e.curr,rows:10,selkey:tit,random:Math.random}, function(res){
            var indextable=$("#listtable tbody");
            indextable.html("");
          tablerows(res);
          });
        }
    });


//加载结束


}


});


}

</script>

  </head>
  
<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a>首页</a></li>
    <li><a>数据表</a></li>
    <li><a>基本内容</a></li>

    </ul>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools">
    
  
    	<ul class="toolbar">
       
            <li style="width:360px"><div style="float:left;margin-left:10px; margin-top: 0px;"><span style="float: left">问卷标题:</span><span style="float: left"><input id="sel" style="width:200px;height:22px;" type="text" name="sel"/></span><span style="float: left"><a href="javascript:sel();"><img src="resources/images/sel.png" width="26" height="26"/></a></span></div></li>
        </ul>
        
  
    </div>
    
    
    <table id="listtable" class="tablelist">
    	<thead>
    	<tr>
        <th><input id ="allcheck" type="checkbox" onclick="checkbox(this)"/></th>
        <th>问卷标题<i class="sort"><img src="<%=basePath%>resources/images/px.gif" /></i></th>
        <th>问题</th>
        <th>时间</th>
        <th>回答</th>
        </tr>
        </thead>  
         <tbody>   
        </tbody>
    </table>
    
   
  <div class="pagin">
        <ul id="page" class="paginList">
       
        </ul>
    </div>
    

    
    </div>
    

</body>
</html>
