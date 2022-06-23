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
<title>用户留言</title>
<link rel="stylesheet" href="../layui/css/layui.css" media="all">
      <script src="../js/jquery-1.8.3.min.js"></script>
      <script src="../layui/layui.js"></script>
</head>
<body>
<div id="adddiv" style="display: none">
			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
  				<legend style="font-size:14px;font-weight:300;">用户留言</legend>
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
				      <textarea id="message" placeholder="请输入内容" class="layui-textarea"></textarea>
				    </div>
				</div>
			</form>
			<button onclick="add()" style="float:right; margin-right:160px; margin-top:10px;" type="button" class="layui-btn layui-btn-normal">发起留言</button>
			</div>
   	</div>
<div style="padding-top:20px;padding-left:20px; width:1250px;'">
   		<div class="location">
      		<p>你现在所在的位置是:</p>
      		<span>发起留言</span>
    	</div>
    	<br>
    	<div class="input">
    		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
  				<legend style="font-size:16px;">我的留言</legend>
  				<button id="add" style="float:right; margin-right:50px;" type="button" class="layui-btn layui-btn-normal">发起留言</button>
			</fieldset>
			<div id="info"></div>
    	</div>
    	
</div>
<script>
layui.use(['layer','form'], function(){
    var $=layui.jquery;
    var layer=layui.layer;
    var form=layui.form;
    $.ajax({
		async: false,
		url: '/test1/messageServlet',
		dataType: 'json',
		success: function(result){
			console.info(result);
			var str = "";//用来存储html内容
			if(result.length > 0){
		    	$.each(result, function(v, o){
		    		str += "<fieldset class='layui-elem-field' style='font-weight:300;'><legend style='font-size:16px;'>"+o.time+"</legend>";
		    		str += "<div style='padding-left:30px' class='layui-field-box'>"+o.message+"</div></fieldset>";
		    	});
		    	$("#info").html(str);
			}
		}
	});
    $('#add').on('click', function () {
        // 调用的layer弹窗
        layer.open({
          type: 1,
          title: '发起留言',
          area: ['400px', '400px'],
          content: $('#adddiv'), 
          end:function (){
              location.reload();
           }
        })
        	
      })
});
function add(){
		var username=$("#username").val();
		var time=$('#time').val();
		var message=$('#message').val();
		 $.ajax({
				type:'post',
				url:'/test1/addmessageServlet',
				data:{
					'username':username,
					'time':time,
					'message':message,
						},
				dataType:"text",
				success:function(res){
					if(res=="success"){
						layer.msg("留言成功！");
						layer.closeAll();
					}else{
                    layer.msg("留言失败！");
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
    </style>
</html>