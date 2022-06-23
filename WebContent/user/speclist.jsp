<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品分类</title>
	  <link rel="stylesheet" href="../layui/css/layui.css" media="all">
      <script src="../js/jquery-1.8.3.min.js"></script>
      <script src="../layui/layui.js"></script>
</head>
<body>
	<div id="editdiv"  style="display: none">
    <form class="layui-form layui-from-pane" action="">
    	<label style="float:left;font-size:14px; padding-left:60px;padding-top:5px;margin-right:20px;">种类代码:</label>
    	<input id="speccode" class="layui-input" style="width: 200px;margin-top:25px;height: 30px;font-size: 15px;border-radius: 0.5em;" type="text">
    	<label style="float:left;font-size:14px; padding-left:60px;padding-top:15px;margin-right:20px;">种&nbsp;&nbsp;类&nbsp;&nbsp;ID:</label>
    	<input id="specid" class="layui-input" type="text" readonly  unselectable="on" style="width: 200px;margin-top:10px;height: 30px;font-size: 15px;border-radius: 0.5em;" >	
    	<label style="float:left;font-size:14px; padding-left:60px;padding-top:15px;margin-right:20px;">种&nbsp;&nbsp;类&nbsp;&nbsp;名:</label>
    	<input id="specname" class="layui-input" style="width: 200px;margin-top:10px;height: 30px;font-size: 15px;border-radius: 0.5em;" type="text">
    	<button onclick="edit()" style="margin-top:20px;margin-left:150px;" type="button" class="layui-btn layui-btn-normal">修改类型</button>
    </form>
    </div>
    <div id="adddiv"  style="display: none">
    	<label style="float:left;font-size:14px; padding-left:60px;padding-top:5px;margin-right:20px;">种类代码:</label>
    	<input class="layui-input speccode" style="width: 200px;margin-top:25px;height: 30px;font-size: 15px;border-radius: 0.5em;" type="text"  placeholder="输入种类代码" >	
    	<label style="float:left;font-size:14px; padding-left:60px;padding-top:15px;margin-right:20px;">种&nbsp;&nbsp;类&nbsp;&nbsp;名:</label>
    	<input class="layui-input specname" style="width: 200px;margin-top:10px;height: 30px;font-size: 15px;border-radius: 0.5em;" type="text"  placeholder="输入种类名" >
    	<button onclick="add()" style="margin-top:20px;margin-left:150px;" type="button" class="layui-btn layui-btn-normal">添加类型</button>
   	</div>
   	<div style="padding-top:20px;padding-left:20px; width:1250px;'">
   		<div class="location">
      		<p>你现在所在的位置是:</p>
      		<span>商品管理 >> 分类管理</span>
    	</div>
    	<br>
    	<div class="form">
    		<button id="add" style="float:right;" type="button" class="layui-btn layui-btn-normal">添加种类</button>
    		<button id="search" data-type="reload" style="width:75px;float:right; margin-right:760px; border-radius:4px;" type="button" class="layui-btn layui-btn-sm layui-btn-normal">搜索</button>
    		<label style="float:left;font-size:14px; padding-left:30px;padding-top:5px;margin-right:20px;">种类名:</label>
    		<input id="specname1" type="text" class="layui-input" style=" width: 200px;height: 30px;font-size: 15px;border-radius: 0.5em;" type="text" name="username" placeholder="输入种类名" >
    	</div>
    	<div style="padding-top:5px;">
    		<table id="demo" lay-filter="test"></table>
    	</div>
   	</div>
    <script type="text/html" id="barDemo">
    	<a class="layui-btn layui-btn-xs" lay-event="edit" >编辑</a>
    	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del" >删除</a>
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
        ,url: '/test1/goodspeclistServlet' 
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
          ,{field: 'speccode', title: '种类代码'}
          ,{field: 'specname', title: '种类名'}
          ,{field: 'action',title: '操作',toolbar:'#barDemo'}
        ]]
      });  	
      table.on('tool(test)',function(obj){
    	  var $=layui.jquery;
          var data=obj.data;
    	  if(obj.event=="del"){
    		  layer.confirm('您确定要删除该种类吗?',{btn: ['确定', '取消'],title:"提示"}, function(){
    		  $.ajax({
    			  url:"/test1/delgoodspecServlet",
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
    	  }else if(obj.event=="edit"){
    		 $("#specid").val(data.id)
    		 $("#speccode").val(data.speccode)
    		 $("#specname").val(data.specname)
    		 layer.open({
    			type:1,
    			title:"修改类型",
    			area:['400px', '280px'],
    			content:$("#editdiv"),
    			end:function (){
                    location.reload();
                 }
    		 });
    	  }
    	  
     	 });
      $('#add').on('click', function () {
          // 调用的layer弹窗
          layer.open({
            type: 1,
            title: '添加类型',
            area: ['400px', '230px'],
            content: $('#adddiv'), 
            end:function (){
                location.reload();
             }
          })
          	
        })
    	  
      	  var $=layui.$,active={
        	  reload: function(){
        	      var specname = $('#specname1').val();
        	      //执行重载
        	      table.reload('test', {
        	      	where: {
        	            "Specname": specname
        	        }
        	      });
        	    }  
          };
          $('#search').on('click', function(){
              var type = $(this).data('type');
              active[type] ? active[type].call(this) : '';
          });
    });
    function edit(){
    	 var id=$("#specid").val();
		 var speccode=$("#speccode").val();
		 var specname=$("#specname").val();
		 $.ajax({
            url:"/test1/updategoodspecServlet",
            type: "post",
            dataType:"text",
            data:{
           	 	'id':id,
           		'speccode':speccode,
				'specname':specname,
            },
            success:function (res){
                if (res=="success"){
                    layer.msg("编辑成功");
                    layer.closeAll();
                }else{
                    layer.msg("编辑失败");
                }
            } 
        });
    }
    function add(){
  		var specname=$(".specname").val();
  		var speccode=$('.speccode').val();
  		 $.ajax({
  				type:'post',
  				url:'/test1/addgoodspecServlet',
  				data:{
  					'speccode':speccode,
  					'specname':specname,
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