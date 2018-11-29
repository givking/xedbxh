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
    <link href="<%=basePath%>resources/css/alefrom.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>resources/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>resources/css/demo.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="<%=basePath%>resources/js/jquery.min.js"></script>
  <script type="text/javascript" src="<%=basePath%>resources/js/jquery-form.js"></script>
  <script type="text/javascript" src="<%=basePath%>resources/js/jquery.ztree.core-3.5.js"></script>
   <script type="text/javascript" src="<%=basePath%>resources/js/jquery.ztree.excheck-3.5.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=basePath%>resources/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=basePath%>resources/ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=basePath%>resources/ueditor/lang/zh-cn/zh-cn.js"></script>
  </head>
  <script type="text/javascript">
  		var setting = {
			check: {
				enable: true,
				chkStyle: "radio",
				radioType: "all"
			},
			view: {
				dblClickExpand: false
			},
			data: {
			key: {
			name: "title"
		},
				simpleData: {
					enable: true,
			        idKey: "id",
			        pIdKey: "parent_id",
			        rootPId: -1
				}
			},
			callback: {
				onClick: onClick,
				onCheck: onCheck
			},
			view: {
		showIcon: false
	}
		};


		 
  $(document).ready(function(){
   var ue = UE.getEditor('editor');
  loadresource();
  
            $(".btn").click(function(){
            loadcontent();
      if(formcheck()){
      $(".btn").val("正在保存中，请稍等");
      $(".btn").css({'background':'grey'});
      $(".btn").attr('disabled',"true");
                 $("#myform").ajaxSubmit({
            type: 'post', // 提交方式 get/post
            url: 'article/addasfile', // 需要提交的 url
            success: function(data) { // data 保存提交后返回的数据，一般为 json 数据
                window.location.href="<%=basePath%>jspsystem/article/list.jsp";
            }
            
        });
   }
            
       });     

  
  });
  
  function onClick(e, treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			zTree.checkNode(treeNode, !treeNode.checked, null, true);
			return false;
		}

		function onCheck(e, treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
			nodes = zTree.getCheckedNodes(true),
			v = "";
			var cityObj = $("#citySel");
			cityObj.attr("value", nodes[0].title);
			
			$("#res_id").val(nodes[0].id);
		}

		function showMenu() {
			var cityObj = $("#citySel");
			var cityOffset = $("#citySel").offset();
			$("#menuContent").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");

			$("body").bind("mousedown", onBodyDown);
		}
		function hideMenu() {
			$("#menuContent").fadeOut("fast");
			$("body").unbind("mousedown", onBodyDown);
		}
		function onBodyDown(event) {
			if (!(event.target.id == "menuBtn" || event.target.id == "citySel" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) {
				hideMenu();
			}
		}
		
		
		function loadresource(){
		$.getJSON("menu/listall?is_article$is_article=1",{random:Math.random},function(data){
		if(data){
		$.fn.zTree.init($("#treeDemo"), setting, data);	
		var zTree = $.fn.zTree.getZTreeObj("treeDemo");
		var allnodes = zTree.getCheckedNodes(false);
		for(var i = 0;i<allnodes.length;i++){

		if(allnodes[i].isParent){allnodes[i].chkDisabled=true;}
		
		}
		
		}
		
		});
		
		}
  
  function loadcontent(){
  var html = UE.getEditor('editor').getContent();
 $("#content").val(html);
  }
  
       function formcheck(){
  var title = $("input[name='title']")[0];
   var menu_id = $("input[name='menu_id']")[0];
   var createtime = $("input[name='createtime']")[0];
   var daytime = /^(\d{4})-(\d{2})-(\d{2})$/;
   if(!title.value || title.value==""){
   alert("标题不能为空");
   return false;
   }else if(!menu_id.value || menu_id.value==""){
   alert("栏目不能为空");
     return false;
   }else if( createtime.value==""){
   
  	return true;
   }else if(!daytime.test(document.getElementById("createtime").value)){
   	 alert("日期格式不正确,正确格式YYYY-MM-DD");
     return false;
   }
   else{
   
   return true;
   }
   
  }
  
  
 /*  $(function(){ 
	$('form :input').blur(function(){ 
		var $parent=$(this).parent(); 
		$parent.find(".formtips").remove(); 
		var regcreatetime=/^1[34578]\d{9}$/;
		if($(this).is('#createtime')) { 
		if(regcreatetime.test(this.value)==false){ 
			 alert("日期格式不正确");
			}
		} 
		
		
	}).keyup(function(){ 
	$(this).triggerHandler("blur"); 
	}).focus(function(){ 
	$(this).triggerHandler("blur"); 
	}) ;
}) ; */
  
  </script>
  
<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul" style="list-style: none;">
    <li><a>首页</a></li>
    <li>表单</li>
    </ul>
    </div>
   <form id="myform"  enctype="multipart/form-data">
    <div class="formbody">
    
    <div class="formtitle"><span>文章信息</span></div>
    
    <ul class="forminfo">
    <li><label>栏目</label>
    <input id="citySel" type="text" readonly value="" style="width:120px; border: 1px solid;" onClick="showMenu();" />
    <input type="hidden" id="res_id" name="menu_id"/>
    </li>
    <li><label>标题</label><input name="title" type="text" class="dfinput" /><input type="hidden" name="state" value="1"/><i>必填</i></li>
     <li><label>发布时间</label><input id="createtime" name="createtime" type="text" class="dfinput" /><i>可填&nbsp;(格式为YYYY-MM-DD)</i></li>
     <li><label>来源</label><input name="shortitle" type="text" class="dfinput" /><i>可填</i></li>
    <li><label>图片</label><input name="files" type="file" class="dfinput"/></li>
    <li><label>级别</label><select name="level" style="border: solid 1px #666666"><option selected="selected" value="0">普通</option><option value="1">推荐</option></select></li>
     <li><label>主页显示</label><cite><input name="showid" type="radio" value="1" checked="checked" />是&nbsp;&nbsp;&nbsp;&nbsp;<input name="showid" type="radio" value="0" />否</cite></li>
      <li style="margin-top:50px;"><label>内容:</label></li>
     <li><script id="editor" type="text/plain" style="width:800;height:500px;"></script><input id="content" type="hidden" name="content"/></li>
    <li><label>&nbsp;</label><input type="button" class="btn" value="确认保存"/></li>
    </ul>
    
    </div>
 </form>
 <div id="menuContent" class="menuContent" style="display:none; position: absolute;">
	<ul id="treeDemo" class="ztree" style="margin-top:0; width:180px; height: 300px;"></ul>
</div>

</body>
</html>
