<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>补货管理</title>
	  <link rel="stylesheet" href="../layui/css/layui.css" media="all">
      <script src="../js/jquery-1.8.3.min.js"></script>
      <script src="../layui/layui.js"></script>
</head>
<body>
	<div style="padding-top:20px;padding-left:20px; width:1250px;'">
   		<div class="location">
      		<p>你现在所在的位置是:</p>
      		<span>补货管理</span>
    	</div>
    	<br>
    	<div class="form">
    		<button id="search" data-type="reload" style="width:75px;float:right; margin-right:850px; border-radius:4px;" type="button" class="layui-btn layui-btn-sm layui-btn-normal">搜索</button>
    		<label style="float:left;font-size:14px; padding-left:30px;padding-top:5px;margin-right:20px;">商品名:</label>
    		<input id="gname1" type="text" class="layui-input" style=" width: 200px;height: 30px;font-size: 15px;border-radius: 0.5em;" type="text" name="username" placeholder="输入商品名" >
    	</div>
    	<div style="padding-top:5px;">
    		<table id="demo" lay-filter="test"></table>
    	</div>
   	</div>
   	<script type="text/html" id="barDemo">
   	{{#  if(d.state ==2){ }}
    	<a class="layui-btn layui-btn-xs">已处理</a>
    {{# }if(d.state ==1) { }}
    	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="do" >未处理</a>
    {{#  } }}
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
      ,url: '/test1/replenishServlet' 
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
        ,{field: 'specname', title: '类型名'}
        ,{field: 'gname', title: '商品名'}
        ,{field: 'proname', title: '供应商名'} 
        ,{field: 'count', title: '数量'}
        ,{field: 'gunit', title: '单位'}
        ,{field: 'username', title: '申请用户'}
        ,{field: 'time', title: '申请时间'}
        ,{field: 'action',title: '操作',toolbar:'#barDemo'}
      ]]
    });  	
    table.on('tool(test)',function(obj){
  	  var $=layui.jquery;
        var data=obj.data;
  	  if(obj.event=="do"){
  		  layer.confirm('您确定处理完该申请了吗?',{btn: ['确定', '取消'],title:"提示"}, function(){
  		  $.ajax({
  			  url:"/test1/replenishstateServlet",
  			  type:"post",
  			  data:{
					'id':data.id,
						},
  			  dataType:"text",
  			  success:function(data){
  				  if(data=="success"){
  					  location.reload();
  				  }else{
  					  alert("处理失败");
  				  }
  			  }
  		  });
  		  });
  	  }
    });
    var $=layui.$,active={
      	  reload: function(){
      	      var gname = $('#gname1').val();
      	      //执行重载
      	      table.reload('test', {
      	      	where: {
      	            "Gname": gname
      	        }
      	      });
      	    }  
        };
        $('#search').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
})
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