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
var content="";
var arr = new Array();
$(document).ready(function(){
  $(".add").click(function(){
    window.location.href="<%=basePath%>jspsystem/menu/add.jsp";
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
$.getJSON("menu/listall?",{random:Math.random},function(data){

   if(data.length>0){

   loadtree(data,0);
tablerows(content);
   
  }

});

}

function tablerows(html){

var table=$("#listtable tbody");
table.append(html);

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
$.get("menu/del",{ids:ids},function(data){
var json = eval("("+data+")");
if(json.result){
window.location.href="<%=basePath%>jspsystem/menu/list.jsp";
}else{
alert(json.msg);
window.location.href="<%=basePath%>jspsystem/menu/list.jsp";
}

});

} 

function loadtree(list,root_id){

  if(list.length>0){
  for(var i = 0;i<list.length;i++){
   if(list[i].parent_id == root_id){
     var type="菜单";
   var zt="";
   if(list[i].state==1){
   zt="启用";
   }else{
   zt="停用";
   }
   
   var left = (list[i].level-1)*12;
   content+="<tr><td><input onclick='allcheck()' name=\"id\" type=\"checkbox\" value=\""+list[i].id+"\" /><td>"+list[i].id+"</td></td><td><span style='margin-left:"+left+"px'>"+list[i].title+"<span></td><td>"+list[i].identity+"</td><td>"+list[i].create_time+"</td><td>"+list[i].url+"</td><td><img src="+list[i].icon+" width='60' height='30'/></td><td id='showtype'>"+type+"</td><td>"+list[i].no+"</td><td id='showstate'>"+zt+"</td><td>"+list[i].parent_id+"</td><td><a href=\"javascript:updateurl('"+list[i].id+"')\" class=\"tablelink\">编辑</a>&nbsp;&nbsp;<a href=\"javascript:del('"+list[i].id+"')\" class=\"tablelink\">删除</a></td></tr>";
   loadtree(list,list[i].id);
    
      }   
   }

  }
}



function updateurl(id){
 window.location.href="<%=basePath%>jspsystem/menu/update.jsp?id="+id;

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
        </ul>
        

    </div>
    
    
    <table id="listtable" class="tablelist">
    	<thead>
    	<tr>
        <th><input id ="allcheck" type="checkbox" onclick="checkbox(this)"/></th>
        <th>ID</th>
        <th width="200">标题<i class="sort"><img src="<%=basePath%>resources/images/px.gif" /></i></th>
        <th>标识</th>
        <th>创建时间</th>
        <th width="300">链接</th>
        <th>图标</th>
         <th>类型</th>
         <th>排序</th>
          <th>可用状太</th>
          <th>上级ID</th>
        <th>操作</th>
        </tr>
        </thead>  
         <tbody>   
        </tbody>
    </table>

    
    </div>
    

</body>
</html>
