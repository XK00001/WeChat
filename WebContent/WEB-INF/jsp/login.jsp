<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录-仓库管理系统</title>
	<script src="./js/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" type="text/css" href="./layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="./css/login.css">
</head>
<body>
<div class="wrap">
        <div class="loginForm">
        	<div class="logoHead">
                    <img src="./image/logo.png" class="imgStyle">
             </div>
            <form>
                <div class="usernameWrapDiv">
                    <div class="usernameLabel">
                        <label>用户名:</label>
                    </div>
                    <div class="usernameDiv">
                        <i class="layui-icon layui-icon-username adminIcon"></i>
                        <input id="loginUsername" class="layui-input adminInput" type="text" name="username" placeholder="输入用户名" >
                    </div>
                </div>
                <div class="usernameWrapDiv">
                    <div class="usernameLabel">
                        <label>密&nbsp;&nbsp;&nbsp;&nbsp;码:</label>
                    </div>
                    <div class="passwordDiv">
                        <i class="layui-icon layui-icon-password adminIcon"></i>
                        <input id="loginPassword" class="layui-input adminInput" type="password" name="password" placeholder="输入密码">
                    </div>
                </div>
                <div class="usernameWrapDiv">
                    <div class="usernameLabel">
                        <label>验证码:</label>
                    </div>
                    <div class="cardDiv">
                        <input id="loginCard" class="layui-input cardInput" type="text" name="card" placeholder="输入验证码">
                    </div>
                    <div class="codeDiv">
                        <input id="loginCode" class="layui-input codeInput"  type="button">
                    </div>
                </div>
                <div class="usernameWrapDiv">
                    <div class="submitLabel">
                        <label>没有账号？<a href="#" id="loginRegister">招聘信息</a></label>
                    </div>
                    <div class="submitDiv">
                        <input onclick="login()" id="loginBtn" type="button" class="submit layui-btn layui-btn-primary" value="登录"></input>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
<script type="text/javascript">
$(function () {
    // 页面初始化生成验证码
    window.onload = createCode('#loginCode');
    // 验证码切换
    $('#loginCode').click(function () {
        createCode('#loginCode');
    });
});
	function login(){
		var inputCode = $('#loginCard').val().toUpperCase();
        var cardCode = $('#loginCode').val();
		var username=$("#loginUsername").val();
		var password=$('#loginPassword').val();
		 if (inputCode == cardCode){
		 $.ajax({
			 	async:false,
				type:'post',
				url:'/test1/CheckServlet',
				data:{
					'username':username,
					'password':password,
						},
				dataType:"text",
				success:function(res){
					if(res=="success"){
						alert("登陆成功");
						window.location.href="/test1/successServlet"; 
					}else{

						alert("登陆失败");
					}
				}
			}) 
		 }
	}
	// 生成验证码
    function createCode(codeID) {
        var code = "";
        // 验证码长度
        var codeLength = 4;
        // 验证码dom元素
        var checkCode = $(codeID);
        // 验证码随机数
        var random = [0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R',
            'S','T','U','V','W','X','Y','Z'];
        for (var i = 0;i < codeLength; i++){
            // 随机数索引
            var index = Math.floor(Math.random()*36);
            code += random[index];
        }
        // 将生成的随机验证码赋值
        checkCode.val(code);
    }
</script>
</html>