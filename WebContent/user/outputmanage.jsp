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
<title>出库管理</title>
	  <link rel="stylesheet" href="../layui/css/layui.css" media="all">
      <script src="../js/jquery-1.8.3.min.js"></script>
      <script src="../layui/layui.js"></script>
</head>
<body>
<div style="padding-top:20px;padding-left:20px; width:1250px;'">
   		<div class="location">
      		<p>你现在所在的位置是:</p>
      		<span>出库管理</span>
    	</div>
    	<div class="input" style="margin-top:20px;">
    		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
  				<legend style="font-size:14px;font-weight:300;">出库表单填写</legend>
			</fieldset>
			<div class="form" style="margin-left:120px; margin-top:30px; font-size:14px;font-weight:300;">
			<form class="layui-form" action="" style="float:left; padding-left:50px; padding-top:50px; font-size:14px;font-weight:300;">
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
			<form class="layui-form" action="" style="float:left; padding-left:30px; padding-top:50px; font-size:14px;font-weight:300;">
				  <div class="layui-form-item">
				    <label class="layui-form-label" style="font-size:14px;font-weight:300;">商品数量:</label>
				     <div class="layui-input-inline">
				      <input id="count" type="text" autocomplete="off" placeholder="请输入商品数量" class="layui-input">
				    </div>
				</div>
				 <div class="layui-form-item">
				    <label class="layui-form-label" style="font-size:14px;font-weight:300;">出库时间:</label>
				     <div class="layui-input-inline">
				      <input id="time" type="text" autocomplete="off" placeholder="年-月-日" class="layui-input">
				    </div>
				</div>
				<div class="layui-form-item">
				    <label class="layui-form-label" style="font-size:14px;font-weight:300;">出库人员:</label>
				     <div class="layui-input-inline">
				      <input id="username" type="text" autocomplete="off" value="<%=username%>" class="layui-input">
				    </div>
				</div>
				<div class="layui-form-item">
				    <label class="layui-form-label" style="font-size:14px;font-weight:300;">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注:</label>
				     <div class="layui-input-inline">
				      <textarea id="remark" placeholder="请输入内容" class="layui-textarea"></textarea>
				    </div>
				</div>
			</form>
			<button id="out" onclick="out()" style="float:right; margin-right:80px; margin-top:280px;" type="button" class="layui-btn layui-btn-normal">提交出库</button>
			</div>
			
    	</div>
    </div>
<script type="text/javascript">
    layui.use('form',function(){
    	var $ = layui.jquery;
        var form = layui.form;
        
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
        	
        	
    });
    
    function out(){
  		var specname=$("#gspec").val();
  		var gname=$('#goods').val();
  		var sname=$('#store').val();
  		var proname=$('#pro').val();
  		var gunit=$('#gunit').val();
  		var count=$('#count').val();
  		var time=$('#time').val();
  		var username=$('#username').val();
  		var remark=$('#remark').val();
  		 $.ajax({
  				type:'post',
  				url:'/test1/outServlet',
  				data:{
  					'specname':specname,
  					'gname':gname,
  					'sname':sname,
  					'proname':proname,
  					'gunit':gunit,
  					'count':count,
  					'time':time,
  					'username':username,
  					'remark':remark,
  						},
  				dataType:"text",
  				success:function(res){
  					if(res=="success"){
  						location.reload();
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
.input{
	  height: 450px;
	  width: 1250px;
	  border: 1px solid #e7e7e7;
	}
.form{
	border: 1px solid #e7e7e7;
	height: 350px;
	  width: 1000px;
}
</style>
</html>