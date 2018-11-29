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
  $(".add").click(function(){
    window.location.href="<%=basePath%>jspsystem/webtable/add.jsp";
  });
    $(".update").click(function(){
    var flag=true;
  var count=0;
  var idarr=$("input[name='id']");
  var id;
if(idarr.length>0){
 for(var i = 0;i<idarr.length;i++){
    if(idarr[i].checked==true){
    id=idarr[i].value;
    count++;
    }   
 }
 
    if(count==0){
    flag=false;
    alert("请选择信息");
    }
    
    if(count>1){
    flag=false;
     alert("只能选择一条信息");
    }
 
 if(flag){
updateurl(id);
 
 }
 
}
  
  
  });
  
  $(".tiptop a").click(function(){
  $(".tip").fadeOut(200);
});

  $(".sure").click(function(){
  $(".tip").fadeOut(100);
});

  $(".cancel").click(function(){
  $(".tip").fadeOut(100);
});

loadtable();
});

function loadtable(){
$.getJSON("webtable/findmodelviewlist",{page:1,rows:10,random:Math.random},function(data){

if(data){
//加载数据
tablerows(data);
//分页

laypage({
        cont: 'page', //容器。值支持id名、原生dom对象，jquery对象。【如该容器为】：<div id="page1"></div>
        pages: data.pagecount, //通过后台拿到的总页数
        curr: 1, //初始化当前页
        jump: function(e){ //触发分页后的回调
        $.getJSON('webtable/findmodelviewlist', {page:e.curr,rows:10,random:Math.random}, function(res){
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
   var filename = "";
   var showname = "";
   if(list[i].showid==1){
   showname = "是";
   }else{
   showname = "否";
   }
   
   if(list[i].filename){
     filename=list[i].filename;
   }

   
       table.append("<tr><td><input onclick='allcheck()' name=\"id\" type=\"checkbox\" value=\""+list[i].id+"\" /></td><td><a href=\"javascript:updateshowid("+list[i].id+","+list[i].showid+")\">"+showname+"</a></td><td>"+list[i].title+"</td><td>"+list[i].createtime+"</td><td>"+list[i].anthor+"</td><td>"+list[i].menuname+"</td><td>"+filename+"</td><td><a href=\"javascript:docurl('"+list[i].d_id+"')\" class=\"tablelink\">下载</a>&nbsp;&nbsp;<a href=\"javascript:updateurl('"+list[i].id+"')\" class=\"tablelink\">编辑</a>&nbsp;&nbsp;<a href=\"javascript:del('"+list[i].id+"')\" class=\"tablelink\">删除</a></td></tr>");

    }
$('.tablelist tbody tr:odd').addClass('odd');
}


}


function checkbox(obj){
var idarr=$("input[name='id']");
if(idarr.length>0){
 for(var i = 0;i<idarr.length;i++){
idarr[i].checked = obj.checked;
 }
}

}

function allcheck(){

  var count = 0;
  var idarr=$("input[name='id']");
  if(idarr.length>0){
   for(var i =0 ;i<idarr.length;i++){
     if(idarr[i].checked==true){
     count++;
     }
     
   }
 
  if(count==idarr.length){
     $("#allcheck").attr("checked",true);
  }else{
   $("#allcheck").attr("checked",false);
  }
  
}

}


function alldel(){
  var flag = false;
  var idarr=$("input[name='id']");
  var ids="";
  if(idarr.length>0){
 for(var i = 0;i<idarr.length;i++){
    if(idarr[i].checked==true){
    ids+=idarr[i].value+",";
    flag=true;
    }   
 }
 var idarr=ids.substring(0,ids.lastIndexOf(","));
 if(flag){
  del(idarr);
   }else{
   alert("请选择信息");
   }
 
 }
 
}

function del(ids){
$.get("webtable/del",{ids:ids},function(data){
var json = eval("("+data+")");
if(json.result){
window.location.href="<%=basePath%>jspsystem/webtable/list.jsp";
}else{
alert(json.msg);
window.location.href="<%=basePath%>jspsystem/webtable/list.jsp";
}

});

} 

function updateurl(id){
 window.location.href="<%=basePath%>jspsystem/webtable/update.jsp?id="+id;

}

function updateshowid(id,showid){

$.get("webtable/updateshowid",{a_id:id,showid:showid},function(data){
 window.location.href="<%=basePath%>jspsystem/webtable/list.jsp";
});

}

function docurl(f_id){

if(f_id){
window.location.href="<%=basePath%>webtable/download?id="+f_id;
}

}

function titlesel(){

var tit = $("#titlesel").val();

$.getJSON("webtable/findmodelviewlist",{page:1,rows:10,titlekey:tit,random:Math.random},function(data){

if(data){
//加载数据
tablerows(data);
//分页

laypage({
        cont: 'page', //容器。值支持id名、原生dom对象，jquery对象。【如该容器为】：<div id="page1"></div>
        pages: data.pagecount, //通过后台拿到的总页数
        curr: 1, //初始化当前页
        jump: function(e){ //触发分页后的回调
        $.getJSON('webtable/findmodelviewlist', {page:e.curr,rows:10,titlekey:tit,random:Math.random}, function(res){
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
        <li class="add"><span><img src="<%=basePath%>resources/images/t01.png" /></span>添加</li>
        <li class="update"><span><img src="<%=basePath%>resources/images/t02.png" /></span>修改</li>
        <li onclick="alldel()"><span><img src="<%=basePath%>resources/images/t03.png" /></span>删除</li>
        <li style="width:360px"><div style="float:left;margin-left:10px; margin-top: 0px;"><span style="float: left">附件标题:</span><span style="float: left"><input id="titlesel" style="width:200px;height:22px;" type="text" name="titlesel"/></span><span style="float: left"><a href="javascript:titlesel();"><img src="resources/images/sel.png" width="26" height="26"/></a></span></div></li>
        </ul>
        
        
    
    </div>
    
    
    <table id="listtable" class="tablelist">
    	<thead>
    	<tr>
        <th><input id ="allcheck" type="checkbox" onclick="checkbox(this)"/></th>
         <th>主页显示</th>
        <th>标题<i class="sort"><img src="<%=basePath%>resources/images/px.gif" /></i></th>
        <th>创建时间</th>
        <th>上传者</th>
        <th>所属栏目</th>
         <th>附件名</th>
        <th>操作</th>
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
