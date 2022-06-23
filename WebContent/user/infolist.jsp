<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>最新资讯</title>
	  <link rel="stylesheet" href="../layui/css/layui.css" media="all">
      <script src="../js/jquery-1.8.3.min.js"></script>
      <script src="../layui/layui.js"></script>
</head>
<body>
<div style="padding-top:20px;padding-left:20px; width:1250px;'">
   		<div class="location">
      		<p>你现在所在的位置是:</p>
      		<span>其他功能 >> 最新资讯</span>
    	</div>
    	<br>
    	<div class="input">
    		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
  				<legend style="font-size:16px;">最新资讯</legend>
			</fieldset>
			<div id="info"></div>
    	</div>
   	</div>
<script>
layui.use(['jquery', 'layer'], function () {
    var $ = layui.jquery,
    layer = layui.layer;
	$.ajax({
		async: false,
		url: '/test1/infoServlet',
		dataType: 'json',
		success: function(result){
			console.info(result);
			var str = "";//用来存储html内容
			if(result.length > 0){
		    	$.each(result, function(v, o){
		    		str += "<fieldset class='layui-elem-field' style='font-weight:300;'><legend style='font-size:16px;'>"+o.time+"</legend>";
		    		str += "<div style='padding-left:30px' class='layui-field-box'>"+o.info+"</div></fieldset>";
		    	});
		    	$("#info").html(str);
			}
		}
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
.input{
	  height: 450px;
	  width: 1250px;
	  border: 1px solid #e7e7e7;
	}
    </style>
</html>