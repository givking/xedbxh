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
<script type="text/javascript" src="<%=basePath%>resources/layer/layer.js"></script>
<script type="text/javascript">
  var id=<%=request.getParameter("id")%>
$(document).ready(function(){

loadtable();
});

function loadtable(){
$.getJSON("examination/findexamlist",{page:1,rows:20,p_id:id,orderby:'id',random:Math.random},function(data){
if(data){
//加载数据
tablerows(data);
//分页

laypage({
        cont: 'page', //容器。值支持id名、原生dom对象，jquery对象。【如该容器为】：<div id="page1"></div>
        pages: data.pagecount, //通过后台拿到的总页数
        curr: 1, //初始化当前页
        jump: function(e){ //触发分页后的回调
        $.getJSON('examination/findexamlist', {page:e.curr,rows:20,p_id:id,orderby:'id',random:Math.random}, function(res){
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
   var zt = "";

   
   if(list[i].state==1){
   zt="启用";
   }else{
   zt="停用";
   }
       table.append("<tr><td><input onclick='allcheck()' name=\"id\" type=\"checkbox\" value=\""+list[i].id+"\" /></td><td>"+list[i].title+"</td><td>"+list[i].createtime+"</td></tr>");

    }
$('.tablelist tbody tr:odd').addClass('odd');
checkstatus(list);
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


function surecheck(){

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
 addexam(idarr);
   }else{
   window.parent.closelaye();
   }
 
 }


}

function addexam(idarr){

if(idarr!=""){
$.get("examination/setexams",{exids:idarr,id:id},function(data){
 window.parent.closelaye();
});


}

}


function checkstatus(data){

 var carr = $("input[name='id']");
 for(var i=0;i<data.length;i++){
   if(data[i].paper_id == id){
      for(var j = 0;j<carr.length;j++){
         if(data[i].id == carr[j].value){
            carr[j].checked= true;
         }
      
      }
   
   }
 

 }

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
    
    
    <table id="listtable" class="tablelist">
    	<thead>
    	<tr>
        <th><input id ="allcheck" type="checkbox" onclick="checkbox(this)"/></th>
        <th>标题<i class="sort"><img src="<%=basePath%>resources/images/px.gif" /></i></th>
        <th>创建时间</th>
        </tr>
        </thead>  
         <tbody>   
        </tbody>
    </table>
    
   
  <div class="pagin">
        <ul id="page" class="paginList">
       
        </ul>
    </div>
    
    <label>&nbsp;</label><input type="button" class="btn" value="确认" onclick="surecheck()"/>

    
    </div>
    

</body>
</html>
