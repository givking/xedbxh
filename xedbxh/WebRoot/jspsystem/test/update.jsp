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
  </head>
  <script type="text/javascript">
  var id=<%=request.getParameter("id")%>
  $(document).ready(function(){
        loadformdata();
             $(".btn").click(function(){
        if(formcheck()){    
              $.ajax({
                cache: true,
                type: "POST",
                url:"webcase/update",
                data:$('#myform').serialize(),// 你的formid
                async: false,
                error: function(request) {
                    alert("Connection error");
                },
                success: function(data) {
                   
                    window.location.href="<%=basePath%>jspsystem/webcase/list.jsp";
                    
                }
            });
         
         }
      });      

  
  
  });
  
  
  function loadformdata(){
  
  
  $.ajax({
            //提交数据的类型 POST GET
            type:"POST",
            //提交的网址
            url:"webcase/findbyid",
            //提交的数据
            data:{id:id},
            //返回数据的格式
            datatype: "json",//"xml", "html", "script", "json", "jsonp", "text".
            //成功返回之后调用的函数             
            success:function(data){
           
           if(data){
            $("input[name='id']")[0].value=data.id;
           $("input[name='title']")[0].value=data.title;
           $("input[name='createtime']")[0].value=data.createtime;
           $("input[name='casenum']")[0].value=data.casenum;
           $("input[name='caseunit']")[0].value=data.caseunit;
           var result = $("input[name='result']");
              var radios = $("input[name='state']");
              
              for(var i = 0;i<radios.length;i++){
             if(radios[i].value==data.state){
             radios[i].checked="true";
             }  
           }
           
           for(var i = 0;i<result.length;i++){
           
             if(result[i].value==data.result){
             result[i].checked="true";
             } 
           
           }
                  
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
  var casenum = $("input[name='casenum']")[0];
   if(!title.value || title.value==""){
   alert("标题不能为空");
   return false;
   }else if(!casenum.value || casenum.value==""){
   alert("编号不能为空");
   return false;
   }else{
   
     return true;   
   }
   
   
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
    <li><label>标题</label><input type="hidden" name="id"/><input name="title" type="text" class="dfinput" /><i>必填</i></li>
     <li><label>时间</label><input name="createtime" type="text" class="dfinput" /><i>可填</i></li>
       <li><label>办理事项</label><input name="casenum" type="text" class="dfinput" /><i>必填</i></li>
        <li><label>受理单位</label><input name="caseunit" type="text" class="dfinput" /><i>必填</i></li>
        <li><label>办结状态</label><cite><input name="result" type="radio" value="1" checked="checked" />是&nbsp;&nbsp;&nbsp;&nbsp;<input name="result" type="radio" value="0" />否</cite></li>
        <li><label>是否启用</label><cite><input name="state" type="radio" value="1" checked="checked" />是&nbsp;&nbsp;&nbsp;&nbsp;<input name="state" type="radio" value="0" />否</cite></li>
    <li><label>&nbsp;</label><input type="button" class="btn" value="确认保存"/></li>
    </ul>
    
    </div>
 </form>

</body>
</html>
