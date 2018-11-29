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
      var id=<%=request.getParameter("id")%>
        var ue;
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
    ue = UE.getEditor('editor');
    
          ue.addListener("ready",function(){
          
         loadresource();

});
     

            $(".btn").click(function(){
            loadcontent();
     if(formcheck()){
                 $("#myform").ajaxSubmit({
            type: 'post', // 提交方式 get/post
            url: 'webtable/updateasfile', // 需要提交的 url
            success: function(data) { // data 保存提交后返回的数据，一般为 json 数据
                window.location.href="<%=basePath%>jspsystem/webtable/list.jsp";
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
			cityObj.val(nodes[0].title);
			
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
		$.getJSON("menu/listall?",{random:Math.random},function(data){
		if(data){
		$.fn.zTree.init($("#treeDemo"), setting, data);	
		var zTree = $.fn.zTree.getZTreeObj("treeDemo");
		var allnodes = zTree.getCheckedNodes(false);
		for(var i = 0;i<allnodes.length;i++){
		
		if(allnodes[i].isParent){allnodes[i].chkDisabled=true;}
		
		}
		 loadformdata();
		}
		
		});
		
		}
  
  function loadcontent(){
  var html = UE.getEditor('editor').getContent();
 $("#content").val(html);
  }
  
  
  
  function loadformdata(){
  
  
  $.ajax({
            //提交数据的类型 POST GET
            type:"POST",
            //提交的网址
            url:"webtable/findbyid",
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
           ue.setContent(data.content);
 
         
         var rads = $("input[name='showid']");
         
             for(var i = 0;i<rads.length;i++){
         if(rads[i].value==data.showid){
         rads[i].checked="checked";
         }
         
         }
       
   
           $.get("menu/findbyid",{id:data.menu_id},function(data){
           if(data){
           $("#citySel").val(data.title);
           $("#res_id").val(data.id);
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
  
  
         function formcheck(){
  var title = $("input[name='title']")[0];
   var menu_id = $("input[name='menu_id']")[0];
   if(!title.value || title.value==""){
   alert("标题不能为空");
   return false;
   }else if(!menu_id.value || menu_id.value==""){
   alert("栏目不能为空");
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
    
    <div class="formtitle"><span>文章信息</span></div>
    
    <ul class="forminfo">
    <li><label>栏目</label>
    <input id="citySel" type="text" readonly value="" style="width:120px; border: 1px solid;" onClick="showMenu();" />
    <input type="hidden" id="res_id" name="menu_id"/>
    <input type="hidden" id="id" name="id"/>
    </li>
    <li><label>标题</label><input name="title" type="text" class="dfinput" /><input type="hidden" name="state" value="1"/><i>必填</i></li>
      <li><label>时间</label><input name="createtime" type="text" class="dfinput" /></li>
    <li><label>附件上传</label><input name="files" type="file" class="dfinput"/></li>
     <li><label>主页显示</label><cite><input name="showid" type="radio" value="1" checked="checked" />是&nbsp;&nbsp;&nbsp;&nbsp;<input name="showid" type="radio" value="0" />否</cite></li>
      <li style="margin-top:30px;"><label>内容:</label></li>
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
