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
  </head>
   <script type="text/javascript">
     var id=<%=request.getParameter("id")%>
     
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
         loadresource();
            $(".btn").click(function(){
            
      if(formcheck()){
                 $("#myform").ajaxSubmit({
            type: 'post', // 提交方式 get/post
            url: 'resource/updateasfile', // 需要提交的 url
            success: function(data) { // data 保存提交后返回的数据，一般为 json 数据
                window.location.href="<%=basePath%>jspsystem/resource/list.jsp";
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
            url:"resource/findbyid",
            //提交的数据
            data:{id:id},
            //返回数据的格式
            datatype: "json",//"xml", "html", "script", "json", "jsonp", "text".
            //成功返回之后调用的函数             
            success:function(data){
           
           if(data){
            $("input[name='id']")[0].value=data.id;
           $("input[name='title']")[0].value=data.title;
            $("input[name='identity']")[0].value=data.identity;
           $("input[name='url']")[0].value=data.url;
           $("input[name='no']")[0].value=data.no;
              var navs = $("input[name='type']");
              var radios = $("input[name='state']");
              
                  for(var i = 0;i<navs.length;i++){
             if(navs[i].value==data.type){
             navs[i].checked="true";
             }  
           }
              
              for(var i = 0;i<radios.length;i++){
             if(radios[i].value==data.state){
             radios[i].checked="true";
             }  
           }
           $.get("resource/findbyid",{id:data.parent_id},function(data){
           if(data){
           $("#citySel").val(data.title);
           $("#res_id").val(data.id);
           }else{
                      $("#citySel").val("顶级资源");
           $("#res_id").val(0);
           
           }
           
           });
           
           
                  
        }
                     
    }   ,
            //调用出错执行的函数
            error: function(){
                alert("数据查询错误");
            }         
         });
  
  
  }
  
  
  function onClick(e, treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			zTree.checkNode(treeNode, !treeNode.checked, null, true);
			return false;
		}

		function onCheck(e, treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
			nodes = zTree.getCheckedNodes(true),
			v = "";
			for (var i=0, l=nodes.length; i<l; i++) {
				v += nodes[i].title + ",";
			}
			if (v.length > 0 ) v = v.substring(0, v.length-1);
			var cityObj = $("#citySel");
			cityObj.attr("value", v);
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
		$.getJSON("resource/listall",function(data){
		if(data){
		$.fn.zTree.init($("#treeDemo"), setting, data);
		 loadformdata();
		}
		
		});
		
		}
  
     function formcheck(){
  var title = $("input[name='title']")[0];
   var identity = $("input[name='identity']")[0];
   var parent_id = $("input[name='parent_id']")[0];
   if(!title.value || title.value==""){
   alert("标题不能为空");
   return false;
   }else if(!identity.value || identity.value==""){
      alert("标识不能为空");
   return false;
   }else if(!parent_id.value || parent_id.value==""){
      alert("上级资源不能为空");
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
   <form id="myform"  enctype="multipart/form-data">
    <div class="formbody">
    
    <div class="formtitle"><span>资源信息</span></div>
    
    <ul class="forminfo">
     <li><label>上级资源</label>
    <input id="citySel" type="text" readonly value="" style="width:120px; border: 1px solid;" onClick="showMenu();" />
    <input type="hidden" id="res_id" name="parent_id"/>
    </li>
    <li><label>标题</label><input type="hidden" name="id"/><input name="title" type="text" class="dfinput" /><i>必填</i></li>
    <li><label>标识</label><input name="identity" type="text" class="dfinput" /><i>必填</i></li>
    <li><label>链接</label><input type="text" name="url" class="dfinput"/></li>
    <li><label>排序</label><input name="no" type="text" class="dfinput" /><i>可填</i></li>
    <li><label>图标</label><input name="files" type="file" class="dfinput"/></li>
     <li><label>类型</label><cite><input name="type" type="radio" value="0" checked="checked" />目录&nbsp;&nbsp;&nbsp;&nbsp;<input name="type" type="radio" value="1" />菜单&nbsp;&nbsp;&nbsp;&nbsp;按钮<input name="type" type="radio" value="2" /></cite></li>
        <li><label>是否启用</label><cite><input name="state" type="radio" value="1" checked="checked" />是&nbsp;&nbsp;&nbsp;&nbsp;<input name="state" type="radio" value="0" />否</cite></li>
    <li><label>&nbsp;</label><input type="button" class="btn" value="确认保存"/></li>
    </ul>
    
    </div>
 </form>
 
  <div id="menuContent" class="menuContent" style="display:none; position: absolute;">
	<ul id="treeDemo" class="ztree" style="margin-top:0; width:180px; height: 300px;"></ul>
</div>
</body>
</html>
