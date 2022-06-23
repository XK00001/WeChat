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
<title>补货管理</title>
	  <link rel="stylesheet" href="../layui/css/layui.css" media="all">
      <script src="../js/jquery-1.8.3.min.js"></script>
      <script src="../layui/layui.js"></script>
</head>
<body>
	<div id="adddiv" style="display: none">
			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
  				<legend style="font-size:14px;font-weight:300;">申请补货表单</legend>
			</fieldset>
			<div class="form" style="margin-left:20px; font-size:14px;font-weight:300;">
			<form class="layui-form" action="" style="float:left; padding-left:50px; padding-top:10px; font-size:14px;font-weight:300;">
				  <div class="layui-form-item">
				    <label class="layui-form-label" style="font-size:14px;font-weight:300;">商品类型:</label>
				     <div class="layui-input-inline">
				      <select name="gspec" id="gspec" lay-filter="gspec" lay-verify="required">
				        <option value="">选择类型</option>
				      </select>
				    </div>
				</div>
				<div class="layui-form-item">
				    <label class="layui-form-label" style="font-size:14px;font-weight:300;">商品名称:</label>
				     <div class="layui-input-inline">
				      <select name="goods" id="goods" lay-filter="goods" lay-verify="required">
				        <option value="">选择商品</option>
				      </select>
				    </div>
				</div>
				<div class="layui-form-item">
				    <label class="layui-form-label" style="font-size:14px;font-weight:300;">仓库名称:</label>
				     <div class="layui-input-inline">
				      <select name="store" id="store" lay-filter="store" lay-verify="required">
				        <option value="">选择仓库</option>
				      </select>
				    </div>
				</div>
				<div class="layui-form-item">
				    <label class="layui-form-label" style="font-size:14px;font-weight:300;">选择商户:</label>
				     <div class="layui-input-inline">
				      <select name="pro" id="pro" lay-filter="pro" lay-verify="required">
				        <option value="">选择商户</option>
				      </select>
				    </div>
				</div>
				<div class="layui-form-item">
				    <label class="layui-form-label" style="font-size:14px;font-weight:300;">选择单位:</label>
				     <div class="layui-input-inline">
				      <select name="gunit" id="gunit" lay-filter="gunit" lay-verify="required">
				        <option value="">选择单位</option>
				      </select>
				    </div>
				</div>
			</form>
			<form class="layui-form" action="" style="float:left; padding-left:30px; padding-top:10px; font-size:14px;font-weight:300;">
				  <div class="layui-form-item">
				    <label class="layui-form-label" style="font-size:14px;font-weight:300;">商品数量:</label>
				     <div class="layui-input-inline">
				      <input id="count" type="text" autocomplete="off" placeholder="请输入商品数量" class="layui-input">
				    </div>
				</div>
				 <div class="layui-form-item">
				    <label class="layui-form-label" style="font-size:14px;font-weight:300;">申请时间:</label>
				     <div class="layui-input-inline">
				      <input id="time" type="text" autocomplete="off" placeholder="年-月-日" class="layui-input">
				    </div>
				</div>
				<div class="layui-form-item">
				    <label class="layui-form-label" style="font-size:14px;font-weight:300;">申请人员:</label>
				     <div class="layui-input-inline">
				      <input id="username" type="text" autocomplete="off" value="<%=username%>" class="layui-input">
				    </div>
				</div>
			</form>
			<button onclick="add()" style="float:right; margin-right:180px; margin-top:30px;" type="button" class="layui-btn layui-btn-normal">申请补货</button>
			</div>
   	</div>
	<div style="padding-top:20px;padding-left:20px; width:1250px;'">
   		<div class="location">
      		<p>你现在所在的位置是:</p>
      		<span>发起补货</span>
    	</div>
    	<br>
    	<div class="form">
    		<button id="add" style="float:right;" type="button" class="layui-btn layui-btn-normal">发起补货</button>
    		<button id="search" data-type="reload" style="width:75px;float:right; margin-right:760px; border-radius:4px;" type="button" class="layui-btn layui-btn-sm layui-btn-normal">搜索</button>
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
    	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del" >撤销</a>
    {{#  } }}
    	
    </script>
<script>
layui.use(['table','layer','form'], function(){
    var $=layui.jquery;
    var layer=layui.layer;
    var table = layui.table;
    var form=layui.form;
    $.ajax({
		url:'/test1/gspecServlet',
		dataType: 'json',
        type: 'post',
        data:{
				'type':1,
					},
		success:function(data){
			//console.log(data);
			$.each(data,function(index,item){
				$('#gspec').append(new Option(item.specname,item.speccode))
			})
			layui.form.render("select");
		}
	})
	form.on('select(gspec)', function(data){
		$.ajax({
    		url:'/test1/gspecServlet',
    		async:true,
    		dataType: 'json',
            type: 'post',
            data:{
					'type':2,
					'speccode':data.value
						},
    		success:function(data){
    			$.each(data,function(index,item){
    				$('#goods').append(new Option(item.gname,item.gcode))
    			})
    			form.render('select');
    		}
    	});
		$.ajax({
    		url:'/test1/gspecServlet',
    		async:true,
    		dataType: 'json',
            type: 'post',
            data:{
					'type':3,
					'speccode':data.value
						},
    		success:function(data){
    			console.log(data);
    			$.each(data,function(index,item){
    				$('#store').append(new Option(item.sname,item.scode))
    			})
    			layui.form.render("select");
    		}
    	});
		$.ajax({
    		url:'/test1/gspecServlet',
    		async:true,
    		dataType: 'json',
            type: 'post',
            data:{
					'type':4,
					'speccode':data.value
						},
    		success:function(data){
    			console.log(data);
    			$.each(data,function(index,item){
    				$('#pro').append(new Option(item.proname,item.procode))
    			})
    			layui.form.render("select");
    		}
    	});

	});
	form.on('select(goods)', function(data){
		$.ajax({
    		url:'/test1/gspecServlet',
    		async:true,
    		dataType: 'json',
            type: 'post',
            data:{
					'type':5,
					'gcode':data.value
						},
    		success:function(data){
    			console.log(data);
    			$.each(data,function(index,item){
    				$('#gunit').append(new Option(item.gunit,item.gcode))
    			})
    			layui.form.render("select");
    		}
    	});
	})
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
	
    $('#add').on('click', function () {
        // 调用的layer弹窗
        layer.open({
          type: 1,
          title: '申请补货',
          area: ['800px', '450px'],
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
    		  layer.confirm('您确定要撤销该申请吗?',{btn: ['确定', '取消'],title:"提示"}, function(){
    		  $.ajax({
    			  url:"/test1/delreplenishServlet",
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
function add(){
  		var specname=$("#gspec option:selected").text();
  		var gname=$("#goods option:selected").text();
  		var proname=$("#pro option:selected").text();
  		var gunit=$("#gunit option:selected").text();
  		var username=$("#username").val();
  		var time=$("#time").val();
  		var count=$("#count").val();
  		var sname=$("#store option:selected").text();
  		 $.ajax({
  				type:'post',
  				url:'/test1/addreplenishServlet',
  				data:{
  					'specname':specname,
  					'gname':gname,
  					'proname':proname,
  					'gunit':gunit,
  					'username':username,
  					'time':time,
  					'sname':sname,
  					'count':count,
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