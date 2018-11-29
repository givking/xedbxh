<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>南充市慈善网</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link href="<%=basePath%>jspclient/css/cs_style.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>jspclient/css/cs_volunteer.css" rel="stylesheet" type="text/css" />
	
	<script type="text/javascript" src="<%=basePath%>jspclient/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>jspclient/js/zzsc.js"></script>
	<script type="text/javascript" src="<%=basePath%>jspclient/js/bplayer.js"></script>

  </head>
  <script>
  $(document).ready(function(){
            $("#btn").click(function(){
       var ident = $("input[name='ident']")[0].value;
		$.ajax({
            //提交数据的类型 POST GET
            type:"POST",
            //提交的网址
            url:"volunteer/checkident",
            //提交的数据
             data:{ident:ident}, 
            //返回数据的格式
            //datatype: "json","xml", "html", "script", "json", "jsonp", "text".
            //成功返回之后调用的函数    
            success:function(data){
           			if(data=="fail"){
                   		alert("身份证号码已存在");
                   }
                   else{
                   		 if(formcheck()){
					            $.ajax({
					                cache: true,
					                type: "POST",
					                url:"volunteer/add",
					                data:$('#cs_form').serialize(),// 你的formid
					                async: false,
					                error: function(request) {
					                    alert("Connection error");
					                },
					                success: function(data) {
					                   
					                    window.location.href="<%=basePath%>webcenter/clienthome";
					                    
					                }
					            });
            
        				 }
                   }
    }   ,
            //调用出错执行的函数
            error: function(){
                alert("数据查询错误");
            }         
         });
         
              
            
            });
  
  
  });
   
  function formcheck(){
	  var volname = $("input[name='volname']")[0];
	  var age = $("input[name='age']")[0];
	  var ident = $("input[name='ident']")[0];	 
	  var telephone = $("input[name='telephone']")[0];
	  var address = $("input[name='address']")[0];
	  var email = $("input[name='email']")[0];

	  var volarea = $("input[name='volarea']")[0];
	  var voltime = $("input[name='voltime']")[0];
	  var reg = /^\w+((-\w+)|(\.\w+))*@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;  
    

		   if(!volname.value || volname.value==""){
		   		alert("姓名不能为空！");
		   			return false;
		   }else if(!age.value || age.value==""){
		  		alert("年龄证不能为空！");
		  			return false;
		  	}else if(!ident.value || ident.value==""){
		  		alert("身份证不能为空！");
		   			return false;
	   		}else if(!telephone.value || telephone.value==""){
	  			alert("联系电话不能为空！");
	   				return false;
	   		}else if(!address.value || address.value==""){
	  			alert("现居地址不能为空！");
	   				return false;						
			}else if(!email.value || email.value==""){
				alert("电子邮箱不能为空！");
					return false; 	  				
	  		}else if (!reg.test(email.value)) {  
		        alert("请输入正确的邮箱格式");  
		        	return false;		
			}else if(!volarea.value || volarea.value==""){
				alert("自愿服务地区不能为空！");
					return false;
			}else if(!voltime.value || voltime.value==""){
				alert("自愿服务时间不能为空！");
					return false;
		   }else{
		   
		     return true;   
		   }		   
	}
	
	
  
  </script>
  <body>
  		<jsp:include page="cs_top.jsp" /> 
  			<div id="vol_form">
				
				<form action="" method="post" name="form" id="cs_form">
					<div class="per_info"><span>个人基本资料</span></div>
					<table border="0" cellpadding="0" cellspacing="0" style="margin-left:60px;">
						<tr>
							<td align="left" style="width:80px;height:30px;color:#008bb6;">姓名：</td>
							<td><input name="volname" type="text"  maxlength="8" class="dfinput" width="160px" /><span  class="poin">*</span>（输入姓名或昵称，8个字以内）</td>
						</tr>
						<tr>
							<td align="left" style="width:80px;height:30px; color:#008bb6;">性别：</td>
							<td>
							 	<input type="radio" name="sex" value="0"  checked />男
								<input type="radio" name="sex" value="1"  />女
							</td>
						</tr>
						<tr>
							<td align="left" style="width:80px;height:30px;color:#008bb6;">年龄：</td>
							<td><input name="age" type="text"  maxlength="3" class="dfinput" /><span class="poin">*</span>（输入正确年龄）</td>
						</tr>
						<tr>
							<td align="left" style="width:80px; height:30px;color:#008bb6;">身份证号：</td>
							<td><input name="ident" type="text"  maxlength="18" class="dfinput" /><span class="poin">*</span>(有效身份证号，18个字符以内)</td>
						</tr>
						<tr>
							<td align="left" style="width:80px;height:30px; color:#008bb6;">联系电话：</td>
							<td><input name="telephone" type="text" class="dfinput" maxlength="13" /><span  class="poin">*</span>(联系手机，电话等，13个字符以内)</td>
						</tr>
						<tr>
							<td align="left" style="width:80px;height:30px; color:#008bb6;">现居地址：</td>
							<td><input name="address" type="text" class="dfinput"  maxlength="20" style="width:280px;" /><span class="poin">*</span>(输入准确地址，20个字符以内)</td>
						</tr>
						<tr>
							<td align="left"  style="width:80px; height:30px;color:#008bb6;">电子邮箱：</td>
							<td><input name="email" type="text" class="dfinput" maxlength="20" style="width:280px;"/><span  class="poin">*</span>(常用邮箱地址，20个字符以内）</td>
						</tr>
					
					</table>
					<div class="per_info"><span>个人义工资料</span></div>
					<table  border="0" cellpadding="0" cellspacing="0"  width="850" style="margin-left:60px;">
						<tr>
							<td align="left" style="width:100px;height:30px; color:#008bb6;">受教育程度：</td>
							<td>
								<select name="education">
										<option value="0" selected="selected">请选择</option>
										<option value="1">初中及以下</option>
										<option value="2">高中</option>
										<option value="3">专科</option>
										<option value="4">本科</option>
										<option value="5">研究生</option>
										<option value="6">硕士</option>
									<option value="7">博士及以上</option>
								</select>							
							</td>
						</tr>
						<tr>
							<td align="left" style="width:100px;height:30px; color:#008bb6;">所从事职业：</td>
							<td><input name="job" type="text" class="dfinput" /><span  class="poin">*</span>（可填）</td>
						</tr>
						<tr>
							<td align="left" style="width:100px;height:30px; color:#008bb6;">工作学习情况：</td>
							<td><select name="workstate">
									<option value="0" selected="selected">请选择</option>
									<option value="1">工作</option>
									<option value="2">学习</option>
								</select>
							</td>
						</tr>
						<tr>
							<td align="left" valign="middle" style="width:100px;height:30px; color:#008bb6;">自愿者类型：</td>
							<td style=" color:#008bb6;line-height:30px;">
								<input name="type" type="checkbox" value="1" />独身老人陪聊
								<input name="type" type="checkbox" value="2" />学习功课辅导
								<input name="type" type="checkbox" value="3" />就业技能指导
								<input name="type" type="checkbox" value="4" />大型慈善活动
								<input name="type" type="checkbox" value="5" />街头慈善劝募
								<br>
								<input name="type" type="checkbox" value="6" />社区宣传教育
								<input name="type" type="checkbox" value="7" />慈善援助策划
								<input name="type" type="checkbox" value="8" />法律咨询援助
								<input name="type" type="checkbox" value="9" />在家患病护理
								<input name="type" type="checkbox" value="10" />孤残儿童陪伴
								<br>
								<input name="type" type="checkbox" value="11" />陪同就医治疗
								<input name="type" type="checkbox" value="12" />医疗保健咨询
								<input name="type" type="checkbox" value="13" />慈善物资整理
								<input name="type" type="checkbox" value="14" />援助项目调查
								<input name="type" type="checkbox" value="15" />家政清洁服务
								<br>
								<input name="type" type="checkbox" value="16" />心里抑郁疏导
								<input name="type" type="checkbox" value="17" />慈善超市服务
								<input name="type" type="checkbox" value="18" />义工队伍管理
								<input name="type" type="checkbox" value="19" />其他
							
							</td>
						</tr>
						<tr>
							<td align="left"  style="width:100px; height:30px;color:#008bb6;">自愿服务地区：</td>
							<td><input name="volarea" type="text" class="dfinput" style="width:280px;"/><span  class="poin">*</span>（必填)</td>
						</tr>
						<tr>
							<td align="left" style="width:100px; height:30px;color:#008bb6;">自愿服务时间：</td>
							<td><input name="voltime" type="text" class="dfinput"  style="width:280px;"/><span  class="poin">*</span>（必填)</td>
						</tr>
						<tr>
							<td colspan="3" align="center"  height="80px" >
								<input type="button" name="btn" id="btn" class="btn1" value="填好了，提交资料"/>
								<input type="button" onclick="reset()" class="btn2" value="清空，重新填写"/>
							</td>							
						</tr>
					</table>
					
				</form>
		</div>
  			
    <jsp:include page="cs_foot.jsp" /> 
  </body>
  
</html>
