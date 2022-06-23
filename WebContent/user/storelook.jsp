<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>仓库查看</title>
	  <link rel="stylesheet" href="../layui/css/layui.css" media="all">
      <script src="../js/jquery-1.8.3.min.js"></script>
      <script src="../layui/layui.js"></script>
</head>
<body>
   	<div style="padding-top:20px;padding-left:20px; width:1250px;'">
   		<div class="location">
      		<p>你现在所在的位置是:</p>
      		<span>仓库查看</span>
    	</div>
    	<br>
    	<div class="form">
    		<button id="search" data-type="reload" style="width:75px;float:right; margin-right:850px; border-radius:4px;" type="button" class="layui-btn layui-btn-sm layui-btn-normal">搜索</button>
    		<label style="float:left;font-size:14px; padding-left:30px;padding-top:5px;margin-right:20px;">仓库名:</label>
    		<input id="Sname" type="text" class="layui-input" style=" width: 200px;height: 30px;font-size: 15px;border-radius: 0.5em;" type="text" name="username" placeholder="输入仓库名" >
    	</div>
    	<div style="padding-top:5px;">
    		<table id="demo" lay-filter="test"></table>
    	</div>
   	</div>
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
        ,url: '/test1/storelookServlet' 
        ,method:'get'
        ,parseData:function(respect){
        	return{
        		"code":0,
        		"msg":"",
        		"data":respect
        	}
        }
        ,cols: [[ //表头
          {field: 'sname', title: '仓库名'}
          ,{field: 'saddress', title: '仓库地址'}
          ,{field: 'specname', title: '类型名'} 
          ,{field: 'gname', title: '商品名'}
          ,{field: 'count', title: '数量'}
          ,{field: 'gunit', title: '单位'}
        ]]
      });  	
    	  
      	  var $=layui.$,active={
        	  reload: function(){
        	      var sname = $('#Sname').val();
        	      //执行重载
        	      table.reload('test', {
        	      	where: {
        	            "Sname": sname
        	        }
        	      });
        	    }  
          };
          $('#search').on('click', function(){
              var type = $(this).data('type');
              active[type] ? active[type].call(this) : '';
          });
    });
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