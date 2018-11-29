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
                url:"donation/update",
                data:$('#myform').serialize(),// 你的formid
                async: false,
                error: function(request) {
                    alert("Connection error");
                },
                success: function(data) {
                   
                    window.location.href="<%=basePath%>jspsystem/donation/list.jsp";
                    
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
            url:"donation/findbyid",
            //提交的数据
            data:{id:id},
            //返回数据的格式
            datatype: "json",//"xml", "html", "script", "json", "jsonp", "text".
            //成功返回之后调用的函数             
            success:function(data){
           
           if(data){
            $("input[name='id']")[0].value=data.id;
           $("input[name='donor']")[0].value=data.donor;
           $("input[name='createtime']")[0].value=data.createtime;
           $("input[name='amount']")[0].value=data.amount;
           $("input[name='intention']")[0].value=data.intention;
          if(data.bill=="on"){
          	$("#b_dis").attr("checked","checked");
          	for ( var i = 1; i <= 5; i++) {
				document.getElementById('s' + i).style.display = "block";
				}
          	$("input[name='d_name']")[0].value=data.d_name;
		$("input[name='d_address']")[0].value=data.d_address;
		$("input[name='d_telephone']")[0].value=data.d_telephone;
		$("input[name='d_email']")[0].value=data.d_email;
          }
        }
                     
    }   ,
            //调用出错执行的函数
            error: function(){
                alert("数据查询错误");
            }         
         });
  
  
  }
  
     function formcheck() {
		var donor = $("input[name='donor']")[0];
		var amount = $("input[name='amount']")[0];
		var bill = $("#b_dis").is(':checked');
		var d_name = $("input[name='d_name']")[0];
		var d_address = $("input[name='d_address']")[0];
		var d_telephone = $("input[name='d_telephone']")[0];
		var d_email = $("input[name='d_email']")[0];
		if (!donor.value || donor.value == "") {
			alert("姓名/单位名称不能为空");
			return false;
		} else if (!amount.value || amount.value == "") {
			alert("捐款金额不能为空");
			return false;
		} else if(bill){
			if (!d_name.value || d_name.value == "") {
			alert("名称不能为空");
			return false;
			}else if(!d_address.value || d_address.value == "") {
			alert("详细地址不能为空");
			return false;
			}else if(!d_telephone.value || d_telephone.value == "") {
			alert("联系电话不能为空");
			return false;
			}else if(!d_email.value || d_email.value == "") {
			alert("邮编不能为空");
			return false;
			}else{
				return true;
			}
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
    <li><label>捐赠人</label><input name="donor" type="text" class="dfinput" /><i>必填</i></li>
    <li><label>捐赠金额</label><input name="amount" type="text" class="dfinput" /><i>必填</i></li>
    <li><label>捐赠意向</label><input name="intention" type="text" class="dfinput" /><i>可填</i></li>
    <li><label>捐赠时间</label><input name="createtime" type="text" class="dfinput" /><i>可填</i></li>   
    <li><label>申领发票：</label><input id="b_dis" type="checkbox"
					 name="bill"  onclick="bill_display()">(若需申领发票,为正确送达,请认真填写以下信息)</li>
					 
    <li id="s1" style="display:none;"><label>名称：</label><input
					type="text" name="d_name" class="dfinput" /></li>
				<li id="s2" style="display:none;"><label>详细地址：</label><input
					type="text" name="d_address" class="dfinput" /></li>
				<li id="s3" style="display:none;"><label>联系电话：</label><input
					type="text" name="d_telephone" class="dfinput" /></li>
				<li id="s4" style="display:none;"><label>邮编：</label><input
					type="text" name="d_email" class="dfinput" /></li>
				<li id="s5" style="display:none;"><label>备注：</label> <textarea
						name="remarks" rows="3" cols="40" class="dfinput"
						style="height:100px;resize:none;"></textarea></li>
    
    
    <li><label>&nbsp;</label><input type="button" class="btn" value="确认保存"/></li>
    </ul>
    
    </div>
 </form>

</body>
<script type="text/javascript">
	function bill_display() {
		if (document.getElementById('b_dis').checked) {
			for ( var i = 1; i <= 5; i++) {
				document.getElementById('s' + i).style.display = "block";
			}
		} else {
			for ( var i = 1; i <= 5; i++) {
				document.getElementById('s' + i).style.display = "none";
			}
		}
	}
</script>
</html>
