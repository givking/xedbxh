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
  $(document).ready(function(){
  $.ajax({
            //提交数据的类型 POST GET
            type:"POST",
            //提交的网址
            url:"donation/totalamount",
            //提交的数据
            /* data:{sum:sum}, */
            //返回数据的格式
            datatype: "json",//"xml", "html", "script", "json", "jsonp", "text".
            //成功返回之后调用的函数    
            success:function(data){
           
           if(data){
            $("input[name='total']")[0].value=data+"元";
          
                  
        }
                     
    }   ,
            //调用出错执行的函数
            error: function(){
                alert("数据查询错误");
            }         
         });
         
         
         
         $(".btn").click(function(){
         var myyear = $("input[name='myyear']")[0].value;
   alert(myyear);
    $.ajax({
            //提交数据的类型 POST GET
            type:"POST",
            //提交的网址
            url:"donation/ontimeamount",
            //提交的数据
             data:{myyear:myyear},
            //返回数据的格式
            datatype: "json",//"xml", "html", "script", "json", "jsonp", "text".
            //成功返回之后调用的函数    
            success:function(data){
           
           if(data!=null){
            $("input[name='ontime']")[0].value=data+"元";
          
                  
        }
                     
    }   ,
            //调用出错执行的函数
            error: function(){
                alert("数据查询错误");
            }         
         }); 
   });
   });
  
   
  
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
    <li><label>捐赠总金额</label><input readonly name="total" type="text" class="dfinput" /></li>
    <li><label style="width:120px">请输入需要查询的年份</label><input name="myyear" type="text" class="dfinput" ></li>
    <li><input type="button" class="btn" value="查询"></li>
    <li><label>查询捐赠金额为</label><input readonly name="ontime" type="text" class="dfinput" /></li>
    </ul>
    
    </div>
 </form>

</body>
</html>
