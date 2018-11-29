<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'update.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
    <link href="<%=basePath%>resources/css/alefrom.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>resources/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="<%=basePath%>resources/js/jquery.min.js"></script>
  <script type="text/javascript" src="<%=basePath%>resources/js/jquery-form.js"></script>
  <script type="text/javascript" src="<%=basePath%>resources/js/jquery.ztree.core-3.5.js"></script>
   <script type="text/javascript" src="<%=basePath%>resources/js/jquery.ztree.excheck-3.5.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=basePath%>resources/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=basePath%>resources/ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=basePath%>resources/ueditor/lang/zh-cn/zh-cn.js"></script>
    
    <style type="text/css">
    .left_td{ background-color:#CCCCCC;}
.tbord{border:solid 1px #FFFFFF}
.tb{ background-color:#F7F7F7}
    
    
    </style>
    
  </head>
  
    <script type="text/javascript">
      var id=<%=request.getParameter("id")%>
      var m_type="";
      $(document).ready(function(){
      
      loadmailask();
      loadmailunser();
      
      });
      
      
  function loadmailask(){

  if(id){
  $.getJSON("mailask/findbyid",{id:id},function(data){
  if(data){
  $("input[name='a_id']")[0].value = data.id; 
  $("input[name='name']")[0].value = data.name;
   m_type = data.menu_type;
   if(data.type==0){
   $("#type").html("求助");
   }else if(data.type==1){
   $("#type").html("建议");
   }else if(data.type==2){
   $("#type").html("投诉");
   }else if(data.type==3){
   $("#type").html("咨询");
   }else{
   $("#type").html("其他");
   }
   $("#time").val(data.createtime);
   $("#address").html(data.address);
   $("#telnum").html(data.telnum);
    $("#email").html(data.email);
   $("input[name='title']")[0].value = data.title;
 
   $("textarea[name='content']")[0].innerHTML=data.content;
  
  }
    
  
  });
  
  }
  
  
  }    
   
  function loadmailunser(){
    
    if(id){
    
    $.getJSON("mailunser/getmailunserlist",{ask_id:id},function(data){
      
      if(data.length>0){
       $("#u_id").val(data[0].id);
       $("textarea[name='ucontent']")[0].innerHTML=data[0].ucontent;
      }
    
    });
    
    }
  
  } 
  
  
  function formsub(){

  if(formcheck()){
   $.ajax({
                cache: true,
                type: "POST",
                url:"mailunser/addaskunser",
                data:$('#myform').serialize(),// 你的formid
                async: false,
                error: function(request) {
                    alert("Connection error");
                },
                success: function(data) {
                   
                    window.location.href="<%=basePath%>jspsystem/mailask/list.jsp?type="+m_type;
                    
                }
            });
            
      }
  }
  
    function formcheck(){
  var title = $("input[name='title']")[0];
  var time = $("#time").val();
   var content = $("textarea[name='content']")[0];
   var ucontent = $("textarea[name='ucontent']")[0];
   if(!title.value || title.value==""){
   alert("标题不能为空");
   return false;
   }else if(time==""){
    alert("时间不能为空");
   }else if(!content.value || content.value==""){
      alert("信件内容不能为空");
   return false;
   }else{
   
   return true;
   }
   
   
  }
  
   
  </script>
  
  
  <body>
   
   <div class="place">
    <span>位置：</span>
    <ul class="placeul" style="list-style: none;">
    <li><a href="#">首页</a></li>
    <li>表单</li>
    </ul>
    </div>
   <form id="myform"  enctype="multipart/form-data">
    <div class="formbody">
    
      <div style="width: 752px; margin: 0 auto;">

      
<table width="752" height="362" border="0" cellpadding="0" cellspacing="0" class="tb">
  <tr>
    <td width="104" height="26" class="left_td tbord">写信人</td>
    <td class="tbord" width="262" align="center"><input type="text" name="name" style="width:242px; height:20px; border:solid 1px #CCCCCC"/></td>
    <td width="104" class="tbord">信件类型</td>
    <td class="tbord"><label id="type"></label><input type="hidden" name="a_id"/></td>
  </tr>
  <tr>
    <td height="26" class="left_td tbord">写信时间</td>
    <td class="tbord"><input id="time" type="text" name="createtime" style="width:242px; height:20px; border:solid 1px #CCCCCC"/></td>
    <td class="tbord">联系地址</td>
    <td class="tbord"><label id="address"></label></td>
  </tr>
  <tr>
    <td height="26" class="left_td tbord">联系电话</td>
    <td class="tbord"><label id="telnum"></label></td>
    <td class="tbord">邮箱</td>
    <td class="tbord"><label id="email"></label></td>
  </tr>
  <tr>
    <td height="26" class="left_td tbord">信件主题</td>
    <td colspan="3" class="tbord"><input type="text" name="title" style="width:286px; height:20px; border:solid 1px #CCCCCC"/></td>
  </tr>

  <tr>
    <td height="129" class="left_td tbord">信件内容</td>
    <td colspan="3" class="tbord"><textarea name="content" rows="12" cols="80" style=" border: 1px solid #ccc" ></textarea></td>
  </tr>
  
    <tr>
    <td height="26" class="tbord" colspan="4">&nbsp;</td>
  </tr>
  
    <tr>
    <td height="129" class="left_td tbord">信件回复<input id="u_id" type="hidden" name = "u_id"/></td>
    <td colspan="3" class="tbord"><textarea name="ucontent" rows="12" cols="80" style=" border: 1px solid #ccc"></textarea></td>
  </tr>
      <tr>
    <td height="26" class="tbord" colspan="4" align="center"><input type="button" class="btn" value="提交" onclick="formsub()"/>&nbsp;&nbsp;&nbsp;<input type="button" class="btn" value="返回" onclick="javascript:history.go(-1);"/></td>
  </tr>
</table>


</div>
    
    </div>
 </form>

   
  </body>
</html>
