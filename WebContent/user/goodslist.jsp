<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品管理</title>
 	  <link rel="stylesheet" href="../layui/css/layui.css" media="all">
      <script src="../js/jquery-1.8.3.min.js"></script>
      <script src="../layui/layui.js"></script>
</head>
<body>
	<div id="editdiv"  style="display: none">
    <form class="layui-form layui-from-pane" action="">
    	<label style="float:left;font-size:14px; padding-left:60px;padding-top:5px;margin-right:20px;">商品代码:</label>
    	<input id="gcode" class="layui-input" style="width: 200px;margin-top:25px;height: 30px;font-size: 15px;border-radius: 0.5em;" type="text">
    	<label style="float:left;font-size:14px; padding-left:60px;padding-top:15px;margin-right:20px;">商&nbsp;&nbsp;品&nbsp;&nbsp;ID:</label>
    	<input id="gid" readonly  unselectable="on" class="layui-input" style="width: 200px;margin-top:10px;height: 30px;font-size: 15px;border-radius: 0.5em;" type="text">	
    	<label style="float:left;font-size:14px; padding-left:60px;padding-top:15px;margin-right:20px;">商&nbsp;&nbsp;品&nbsp;&nbsp;名:</label>
    	<input id="gname" class="layui-input" style="width: 200px;margin-top:10px;height: 30px;font-size: 15px;border-radius: 0.5em;" type="text">
    	<label style="float:left;font-size:14px; padding-left:60px;padding-top:15px;margin-right:20px;">种类代码:</label>
    	<input id="speccode" class="layui-input" style="width: 200px;margin-top:10px;height: 30px;font-size: 15px;border-radius: 0.5em;" type="text" >
    	<label style="float:left;font-size:14px; padding-left:60px;padding-top:15px;margin-right:20px;">单&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位:</label>
    	<input id="gunit" class="layui-input" style="width: 200px;margin-top:10px;height: 30px;font-size: 15px;border-radius: 0.5em;" type="text">
    	<label style="float:left;font-size:14px; padding-left:60px;padding-top:15px;margin-right:20px;">商户代码:</label>
    	<input id="procode" class="layui-input" style="width: 200px;margin-top:10px;height: 30px;font-size: 15px;border-radius: 0.5em;" type="text">
    	<button onclick="edit()" style="margin-top:20px;margin-left:150px;" type="button" class="layui-btn layui-btn-normal">修改商品</button>
    </form>
    </div>
    <div id="adddiv"  style="display: none">
    	<label style="float:left;font-size:14px; padding-left:60px;padding-top:5px;margin-right:20px;">商品代码:</label>
    	<input class="layui-input gcode" style="width: 200px;margin-top:25px;height: 30px;font-size: 15px;border-radius: 0.5em;" type="text"  placeholder="输入商品代码" >	
    	<label style="float:left;font-size:14px; padding-left:60px;padding-top:15px;margin-right:20px;">商&nbsp;&nbsp;品&nbsp;&nbsp;名:</label>
    	<input class="layui-input gname" style="width: 200px;margin-top:10px;height: 30px;font-size: 15px;border-radius: 0.5em;" type="text"  placeholder="输入商品名" >
    	<label style="float:left;font-size:14px; padding-left:60px;padding-top:15px;margin-right:20px;">种类类型:</label>
    	<input class="layui-input speccode" style="width: 200px;margin-top:10px;height: 30px;font-size: 15px;border-radius: 0.5em;" placeholder="输入商品类型" >
    	<label style="float:left;font-size:14px; padding-left:60px;padding-top:15px;margin-right:20px;">商户代码:</label>
    	<input class="layui-input procode" style="width: 200px;margin-top:10px;height: 30px;font-size: 15px;border-radius: 0.5em;" placeholder="输入商户代码" >
    	<label style="float:left;font-size:14px; padding-left:60px;padding-top:15px;margin-right:20px;">单&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位:</label>
    	<input class="layui-input gunit" style="width: 200px;margin-top:10px;height: 30px;font-size: 15px;border-radius: 0.5em;" type="text"  placeholder="输入单位" >
    	<button onclick="add()" style="margin-top:20px;margin-left:150px;" type="button" class="layui-btn layui-btn-normal">添加商品</button>
   	</div>
   	<div style="padding-top:20px;padding-left:20px; width:1250px;'">
   		<div class="location">
      		<p>你现在所在的位置是:</p>
      		<span>商品管理 >> 商品管理</span>
    	</div>
    	<br>
    	<div class="form">
    		<button id="add" style="float:right;" type="button" class="layui-btn layui-btn-normal">添加商品</button>
    		<button id="search" data-type="reload" style="width:75px;float:right; margin-right:760px; border-radius:4px;" type="button" class="layui-btn layui-btn-sm layui-btn-normal">搜索</button>
    		<label style="float:left;font-size:14px; padding-left:30px;padding-top:5px;margin-right:20px;">商品名:</label>
    		<input id="gname1" type="text" class="layui-input" style=" width: 200px;height: 30px;font-size: 15px;border-radius: 0.5em;" type="text" name="username" placeholder="输入商品名" >
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
        ,url: '/test1/goodslistServlet' 
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
          ,{field: 'gcode', title: '商品代码'}
          ,{field: 'gname', title: '商品名'}
          ,{field: 'speccode', title: '种类代码'} 
          ,{field: 'gunit', title: '单位'}
          ,{field: 'procode', title: '供应商代码'}
          ,{field: 'action',title: '操作',toolbar:'#barDemo'}
        ]]
      });  	
      table.on('tool(test)',function(obj){
    	  var $=layui.jquery;
          var data=obj.data;
    	  if(obj.event=="del"){
    		  layer.confirm('您确定要删除该商品吗?',{btn: ['确定', '取消'],title:"提示"}, function(){
    		  $.ajax({
    			  url:"/test1/delgoodsServlet",
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
    		 $("#gid").val(data.id)
    		 $("#gcode").val(data.gcode)
    		 $("#gname").val(data.gname)
    		 $("#speccode").val(data.speccode)
    		 $("#gunit").val(data.gunit)
    		 $("#procode").val(data.procode)
    		 layer.open({
    			type:1,
    			title:"修改商品",
    			area:['400px', '400px'],
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
            title: '添加商品',
            area: ['400px', '350px'],
            content: $('#adddiv'), 
            end:function (){
                location.reload();
             }
          })
          	
        })
    	  
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
    });
    function edit(){
    	 var id=$("#gid").val();
		 var gcode=$("#gcode").val();
		 var gname=$("#gname").val();
		 var speccode=$("#speccode").val();
		 var gunit=$("#gunit").val();
		 var procode=$("#procode").val();
		 $.ajax({
            url:"/test1/updategoodsServlet",
            type: "post",
            dataType:"text",
            data:{
           	 	'id':id,
           		'gcode':gcode,
				'gname':gname,
				'speccode':speccode,
				'gunit':gunit,
				'procode':procode,
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
  		var gname=$(".gname").val();
  		var speccode=$('.speccode').val();
  		var gcode=$('.gcode').val();
  		var gunit=$('.gunit').val();
  		var procode=$('.procode').val();
  		 $.ajax({
  				type:'post',
  				url:'/test1/addgoodsServlet',
  				data:{
  					'gname':gname,
  					'speccode':speccode,
  					'gcode':gcode,
  					'gunit':gunit,
  					'procode':procode,
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