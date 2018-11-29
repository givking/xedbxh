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
                url:"volunteer/update",
                data:$('#myform').serialize(),// 你的formid
                async: false,
                error: function(request) {
                    alert("Connection error");
                },
                success: function(data) {
                   
                    window.location.href="<%=basePath%>jspsystem/volunteer/list.jsp";
                    
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
            url:"volunteer/findbyid",
            //提交的数据
            data:{id:id},
            //返回数据的格式
            datatype: "json",//"xml", "html", "script", "json", "jsonp", "text".
            //成功返回之后调用的函数             
            success:function(data){
           if(data){
           $("input[name='id']")[0].value=data.id;
           $("input[name='volname']")[0].value=data.volname;
           $($("input[name='sex']")[data.sex]).attr("checked","checked");
           $("input[name='age']")[0].value=data.age;
           $("input[name='ident']")[0].value=data.ident;
           $("input[name='telephone']")[0].value=data.telephone;
           $("input[name='address']")[0].value=data.address;
           $("input[name='email']")[0].value=data.email;
           $("select[name='education']").val(data.education);
           $("input[name='job']")[0].value=data.job;
           $("select[name='workstate']").val(data.workstate);
           var tt=data.type.split(',');
           for(var i=0;i<tt.length;i++){
           $($("input[name='type']")[tt[i]-1]).attr("checked","checked");
           }; 
           $("input[name='volarea']")[0].value=data.volarea;
           $("input[name='voltime']")[0].value=data.voltime;
                  
        }
                     
    }   ,
            //调用出错执行的函数
            error: function(){
                alert("数据查询错误");
            }         
         });
  
  
  }
  
      function formcheck(){
  var volname = $("input[name='volname']")[0];
  var ident = $("input[name='ident']")[0];
   if(!volname.value || volname.value==""){
   alert("姓名不能为空");
   return false;
   }else if(!ident.value || ident.value==""){
   alert("身份证不能为空");
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
    <input name="id" type="hidden"/>
    <ul class="forminfo">
    <li><label>姓名</label><input name="volname" type="text" class="dfinput" /><i>必填</i></li>
    <li><label>性别</label>
       <input type="radio" name="sex" value="0"  />男
       <input type="radio" name="sex" value="1"  />女
    </li>
    <li><label>年龄</label><input name="age" type="text" class="dfinput" /><i>可填</i></li>
    <li><label>身份证号</label><input name="ident" type="text" class="dfinput" /><i>可填</i></li>
    <li><label>联系电话</label><input name="telephone" type="text" class="dfinput" /><i>可填</i></li>
    <li><label>现居地址</label><input name="address" type="text" class="dfinput" /><i>可填</i></li>
    <li><label>电子邮箱</label><input name="email" type="text" class="dfinput" /><i>可填</i></li>
    <li><label>受教育程度</label>
    <select name="education">
    	<option value="0" >请选择</option>
    	<option value="1">初中及以下</option>
    	<option value="2">高中</option>
    	<option value="3">专科</option>
    	<option value="4">本科</option>
    	<option value="5">研究生</option>
    	<option value="6">硕士</option>
    	<option value="7">博士及以上</option>
    </select>
    </li>
    <li><label>所从事职业</label><input name="job" type="text" class="dfinput" /><i>可填</i></li>
    <li><label>工作学习情况</label>
    <select name="workstate">
    	<option value="0" >请选择</option>
    	<option value="1">工作</option>
    	<option value="2">学习</option>
    </select>
    </li>
    <li><label>志愿服务类型</label>
    <ul>
    <li>
    <input name="type" type="checkbox" value="1" />独身老人陪聊
    <input name="type" type="checkbox" value="2" />学习功课辅导
    <input name="type" type="checkbox" value="3" />就业技能指导
    <input name="type" type="checkbox" value="4" />大型慈善活动
    <input name="type" type="checkbox" value="5" />街头慈善劝募
    </li>
    <li>
    <input name="type" type="checkbox" value="6" />社区宣传教育
    <input name="type" type="checkbox" value="7" />慈善援助策划
    <input name="type" type="checkbox" value="8" />法律咨询援助
    <input name="type" type="checkbox" value="9" />在家患病护理
    <input name="type" type="checkbox" value="10" />孤残儿童陪伴
    </li>
    <li>
    <input name="type" type="checkbox" value="11" />陪同就医治疗
    <input name="type" type="checkbox" value="12" />医疗保健咨询
    <input name="type" type="checkbox" value="13" />慈善物资整理
    <input name="type" type="checkbox" value="14" />援助项目调查
    <input name="type" type="checkbox" value="15" />家政清洁服务
    </li>
    <li>
    <input name="type" type="checkbox" value="16" />心里抑郁疏导
    <input name="type" type="checkbox" value="17" />慈善超市服务
    <input name="type" type="checkbox" value="18" />义工队伍管理
    <input name="type" type="checkbox" value="19" />其他
    </li>
    </ul>
    </li>
    <li><label>志愿服务地区</label><input name="volarea" type="text" class="dfinput" /><i>可填</i></li>
    <li><label>志愿服务时间</label><input name="voltime" type="text" class="dfinput" /><i>可填</i></li>   
    <li><label>&nbsp;</label><input type="button" class="btn" value="确认保存"/></li>
    </ul>
    
    </div>
 </form>

</body>
</html>
