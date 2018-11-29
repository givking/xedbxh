<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <link href="<%=basePath%>resources/css/style.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="<%=basePath%>resources/js/jquery.min.js"></script>
  <script type="text/javascript" src="<%=basePath%>resources/layer/layer.js"></script>
  </head>
  <script type="text/javascript">
  var id="<%=request.getParameter("id")%>";
  var extype = "<%=request.getParameter("type")%>";
  $(document).ready(function(){
        loadformdata();
      loadunser();
  
  });
  
  
  function loadformdata(){
  
  
  $.ajax({
            //提交数据的类型 POST GET
            type:"POST",
            //提交的网址
            url:"examination/findbyid",
            //提交的数据
            data:{id:id},
            //返回数据的格式
            datatype: "json",//"xml", "html", "script", "json", "jsonp", "text".
            //成功返回之后调用的函数             
            success:function(data){
           
           if(data){
       
           $("input[name='title']")[0].value=data.title;

           
                  
        }
                     
    }   ,
            //调用出错执行的函数
            error: function(){
                alert("数据查询错误");
            }         
         });
  
  
  }
  
     function formcheck(){
  var title = $("input[name='title']")[0];
   if(!title.value || title.value.trim()==""){
   alert("标题不能为空");
   return false;
   }else{
   
     return true;   
   }
   
   
  }
  
  function winopen(){
  
 layer.open({
        type: 2,
        skin: 'layui-layer-lan',
        offset: 100,
        title: '添加答案',
        fix: false,
        shadeClose: true,
        maxmin: true,
        area: ['600px', '360px'],
        content: ['<%=basePath%>jspsystem/examunser/add.jsp?id='+id]

    });
  
  
  
  }
  
  function loadunser(){
  var uhtml="";
  $.getJSON("examunser/findunserlist",{id:id,rand:Math.random()},function(data){
  
  if(data){
  if(extype=='1'){
   for(var i = 0;i<data.length;i++){
    uhtml+="<input name='id' type='radio' value='"+data[i].id+"' />"+data[i].title+"&nbsp;&nbsp;&nbsp;&nbsp;";
    }
  }else if(extype=='2'){
  for(var i = 0;i<data.length;i++){
      uhtml+="<input name='id' type='checkbox' value='"+data[i].id+"' />"+data[i].title+"&nbsp;&nbsp;&nbsp;&nbsp;";
     }
  }  
}
  
$("#unser").html(uhtml);
  
  });
  
  }
  
  function delunser(){
  flag = false;
  var ras = $("input[name='id']");
   if(ras){
   
   for(var i = 0;i<ras.length;i++){
    if(ras[i].checked==true){
    flag=true;
    del(ras[i].value);
    }
  }
   
   }
   
   if(!flag){
     alert("请选择信息");
   }
  
  }
  
  function del(id){
  
  $.get("examunser/del",{ids:id},function(data){
  
 location.reload();
  
  });
  
  }
  
  
      function closelaye(){

 location.reload();

}
  
  function comeback(){
   window.location.href="<%=basePath%>jspsystem/examination/list.jsp";
  
  }
  
  
  </script>
  
<body>


	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li>表单</li>
    </ul>
    </div>
   <form id="myform">
    <div class="formbody">
    
    <div class="formtitle"><span>基本信息</span></div>
    
    <ul class="forminfo">
    <li><label>题目</label><input name="title" type="text" class="dfinput" /><i>必填</i></li>
     <li><label>答案:</label><cite id="unser"></cite></li>     
    <li><label>&nbsp;</label><input type="button" class="btn" onclick="winopen()" style="width:100px;" value="添加"/> <label>&nbsp;</label><input type="button" class="btn" value="删除" onclick="delunser()" style="width:100px;"/><label>&nbsp;&nbsp;</label>&nbsp;&nbsp;<input type="button" class="btn" value="返回" style="width:100px;" onclick="comeback()"/></li>
    </ul>
    
    </div>
 </form>

</body>
</html>
