<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
    String username=(String)(session.getAttribute("username"));
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>资讯管理</title>
	  <link rel="stylesheet" href="../layui/css/layui.css" media="all">
      <script src="../js/jquery-1.8.3.min.js"></script>
      <script src="../layui/layui.js"></script>
</head>
<body>
<div id="adddiv" style="display: none">
			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
  				<legend style="font-size:14px;font-weight:300;">添加资讯</legend>
			</fieldset>
			<div class="form" style="margin-left:10px; font-size:14px;font-weight:300;">
			<form class="layui-form" action="" style="float:left; padding-left:20px; padding-top:10px; font-size:14px;font-weight:300;">
				 <div class="layui-form-item">
				    <label class="layui-form-label" style="font-size:14px;font-weight:300;">添加时间:</label>
				     <div class="layui-input-inline">
				      <input id="time" type="text" placeholder="年-月-日" class="layui-input">
				    </div>
				</div>
				<div class="layui-form-item">
				    <label class="layui-form-label" style="font-size:14px;font-weight:300;">添加人员:</label>
				     <div class="layui-input-inline">
				      <input id="username" type="text" autocomplete="off" value="<%=username%>" class="layui-input">
				    </div>
				</div>
				<div class="layui-form-item">
				    <label class="layui-form-label" style="font-size:14px;font-weight:300;">内&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;容:</label>
				     <div class="layui-input-inline">
				      <textarea id="info" placeholder="请输入内容" class="layui-textarea"></textarea>
				    </div>
				</div>
			</form>
			<button onclick="add()" style="float:right; margin-right:160px; margin-top:10px;" type="button" class="layui-btn layui-btn-normal">添加资讯</button>
			</div>
   	</div>
	<div style="padding-top:20px;padding-left:20px; width:1250px;'">
   		<div class="location">
      		<p>你现在所在的位置是:</p>
      		<span>其他功能 >> 资讯管理</span>
    	</div>
    	<br>
    	<div class="form">
    		<button id="add" style="float:right;" type="button" class="layui-btn layui-btn-normal">添加资讯</button>
    		<button id="search" data-type="reload" style="width:75px;float:right; margin-right:760px; border-radius:4px;" type="button" class="layui-btn layui-btn-sm layui-btn-normal">搜索</button>
    		<label style="float:left;font-size:14px; padding-left:30px;padding-top:5px;margin-right:20px;">用户名:</label>
    		<input id="username" type="text" class="layui-input" style=" width: 200px;height: 30px;font-size: 15px;border-radius: 0.5em;" type="text" name="username" placeholder="输入用户名" >
    	</div>
    	<div style="padding-top:5px;">
    		<table id="demo" lay-filter="test"></table>
    	</div>
   	</div>
   	<script type="text/html" id="barDemo">
    	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del" >撤销</a>
    </script>
   	<script>
layui.use(['table','layer','form'], function(){
    var $=layui.jquery;
    var layer=layui.layer;
    var table = layui.table;
    var form=layui.form;
    table.render({
      elem: '#demo'
      ,height: 430
      ,id:'test'
      ,url: '/test1/infoServlet' 
      ,method:'get'
      ,parseData:function(respect){
      	return{
      		"code":0,
      		"msg":"",
      		"data":respect
      	}
      }
      ,cols: [[ //表头
        {field: 'id', title: 'ID',hide: true}
        ,{field: 'username', title: '添加人',width:120}
        ,{field: 'time', title: '添加时间',width:120}
        ,{field: 'info', title: '资讯内容'}
        ,{field: 'action',title: '操作',toolbar:'#barDemo',width:120}
      ]]
    }); 
    $('#add').on('click', function () {
        // 调用的layer弹窗
        layer.open({
          type: 1,
          title: '添加资讯',
          area: ['400px', '400px'],
          content: $('#adddiv'), 
          end:function (){
              location.reload();
           }
        })
        	
      })
      table.on('tool(test)',function(obj){
    	  var $=layui.jquery;
          var data=obj.data;
    	  if(obj.event=="del"){
    		  layer.confirm('您确定要撤销该资讯吗?',{btn: ['确定', '取消'],title:"提示"}, function(){
    		  $.ajax({
    			  url:"/test1/delinfoServlet",
    			  type:"post",
    			  data:{
  					'id':data.id,
  						},
    			  dataType:"text",
    			  success:function(data){
    				  if(data=="success"){
    					  location.reload();
    				  }else{
    					  alert("删除失败");
    				  }
    			  }
    		  });
    		  });
    	  }
      });
    var $=layui.$,active={
      	  reload: function(){
      	      var username = $('#username').val();
      	      //执行重载
      	      table.reload('test', {
      	      	where: {
      	            "Username": username
      	        }
      	      });
      	    }  
        };
        $('#search').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
})
function add(){
  		var username=$("#username").val();
  		var time=$('#time').val();
  		var info=$('#info').val();
  		 $.ajax({
  				type:'post',
  				url:'/test1/addinfoServlet',
  				data:{
  					'username':username,
  					'time':time,
  					'info':info,
  						},
  				dataType:"text",
  				success:function(res){
  					if(res=="success"){
  						layer.msg("添加成功！");
  						layer.closeAll();
  					}else{
                        layer.msg("添加失败！");
  					}
  				}
  			}) 
  	}
</script>
</body>
<style>
.location {
  text-align: left;
  height: 25px;
  line-height: 25px;
  border: 1px solid #e6eaf6;
  border-radius: 8px;
  background: linear-gradient(to bottom, #fefefe, #ffffff, #f6fafd);
  color: #4a4a4a;
  padding-left: 15px;
}
.location p {
  display: inline-block;
  padding-left: 15px;
  font-size: 14px;
}
.location span {
  color: #2179a9;
  font-size: 14px;
  font-weight: bold;
}
    </style>
</html>