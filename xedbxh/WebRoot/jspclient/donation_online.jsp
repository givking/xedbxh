<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>南充市慈善网在线捐赠</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link href="<%=basePath%>jspclient/css/cs_donation_online.css" rel="stylesheet" type="text/css" />
	
	<script type="text/javascript" src="<%=basePath%>jspclient/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>jspclient/js/zzsc.js"></script>
	<script type="text/javascript" src="<%=basePath%>jspclient/js/bplayer.js"></script>
	<script type="text/javascript">
		function bill_display(){
			if(document.getElementById('b_dis').checked){
					for(var i= 1;i<=10;i++){
				document.getElementById('s'+i).style.display="block";
				}
			 }else{
			 		for(var i= 1;i<=10;i++){
				document.getElementById('s'+i).style.display="none";
				}
			}
		}
	</script>
  </head>
  <script>
  $(document).ready(function(){
  
            $("#btn").click(function(){
       if(formcheck()){
            $.ajax({
                cache: true,
                type: "POST",
                url:"donation/add",
                data:$('#form').serialize(),// 你的formid
                async: false,
                error: function(request) {
                    alert("Connection error");
                },
                success: function(data) {
                   
                    window.location.href="<%=basePath%>webcenter/clienthome";
                    
                }
            });
            
         }   
              
            
            });
  
  
  });
  
  
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
  		
  		<div></div>
	<br />
	<div id="cs_don_cont">
  		<div id="cs_t">
  			<ul>
  				<li class="f"><a href="" target="_blank">支付宝首页</a></li>
  				<li class="f"><a href="" target="_blank">商家服务</a></li>
  				<li><a href="" target="_blank">帮助中心</a></li>
  			</ul>
  		</div>
  			
		
			<div id="titlt_way">(南充慈善网)支付宝即时到账交易接口快速通道</div>
			<div id="t_nav">
				<ol>
					<li id="c_u">1、确认信息→</li>
					<li>2、点击确认→</li>
					<li>3、确认完成</li>
				</ol>			
			</div>
				<form  method="post" name="form" id="form">
						
					<div id="d_info">捐赠信息:</div>
					<table style="margin-left:50px;">
							<tr>
								<td height="30" width="160" align="right">捐赠意向：</td>
								<td><input type="text" name="intention" style="width:200px;"/></td>
							</tr>
							<tr>
								<td height="30" width="160" align="right">金额：</td>
								<td><input type="text" name="amount" style="width:200px;"/><span>&nbsp;元</span></td>
							</tr>
							<tr>
								<td height="30" width="160" align="right" valign="top">爱心留言：</td>
								<td><textarea  name="msg" rows="3" cols="40" style="width:200px; height:50px;resize:none;" ></textarea></td>
							</tr>
						</table>													
					<div id="d_per">捐赠人基本信息:</div>
					<table style="margin-left:50px;">
							<tr>
								<td height="30" width="160" align="right">个人/单位:</td>
								<td>
									<select name="org">
										<option value="0" selected="selected">个人</option>
										<option value="1">单位</option>
									</select>
								</td>
							</tr>
							<tr>
								<td height="30" width="160" align="right">姓名/单位名称：</td>
								<td><input type="text" name="donor"  style="width:200px;"/></td>
							</tr>
							<tr>
								<td height="30" width="160" align="right">联系地址：</td>
								<td><input type="text" name="address"  style="width:200px;"/></td>
							</tr>
							<tr>
								<td height="30" width="160" align="right" style="color:#FF0000; font-weight:bold;">申领发票：</td>
								<td><input  id="b_dis" type="checkbox" name="bill" onclick="bill_display()"/><span style="color:#999999;">(若需申领发票,为正确送达,请认真填写以下信息)</span></td>
							</tr>
							
						
					</table>
					<dl>
						<dt id="s1" style="height:20px; width:160px; display:none;">名称：</dt>
						<dd id="s2" style="display:none;"><input type="text" name="d_name"  style="width:200px;"/></dd><br>
						<dt id="s3" style="height:20px; width:160px;display:none;">详细地址：</dt>
						<dd id="s4" style="display:none;"><input type="text" name="d_address"  style="width:200px;"/></dd><br>
						<dt id="s5" style="height:20px; width:160px;display:none;">联系电话：</dt>
						<dd id="s6" style="display:none;"><input type="text" name="d_telephone"  style="width:200px;"/></dd><br>
						<dt id="s7" style="height:20px; width:160px;display:none;">邮编：</dt>
						<dd id="s8" style="display:none;"><input type="text" name="d_email"  style="width:200px;"/></dd><br>
						<dt id="s9" style="height:20px; width:160px;display:none;">备注：</dt>
						<dd id="s10" style="display:none;"><textarea  name="remarks" rows="3" cols="40" style="width:200px; height:50px;resize:none;" ></textarea></dd><br>
						
						<dt style="height:20px; width:160px;"></dt>						
						<dd><input type="button" name="btn" id="btn" value="确认"/></dd>
						
					</dl>
					
				</form>
				
		</div>

		<div id="footer_online">
			<ul>
				<li><font id="f_s">如果您点击“确认”按钮，即表示您同意该次的执行操作。</font></li>
				<li>支付宝版权所有 2011-2015 ALIPAY.COM</li>
			</ul>
						
		</div>

  			
  </body>
  
</html>
