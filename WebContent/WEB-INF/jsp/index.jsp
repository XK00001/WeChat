<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
String username=(String)(session.getAttribute("username")); 
if(username==""||username==null){
	response.sendRedirect("/test1/LoginServlet");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>网上仓库管理系统</title>
    <link rel="stylesheet" type="text/css" href="./layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="./css/main.css">
    <script src="./layui/layui.js"></script>
    <script src="./js/jquery-1.8.3.min.js"></script>
    <script src="./js/main.js"></script>
</head>
<body>
	<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">
    <h2>仓库管理系统</h2>
    </div>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item layui-hide layui-show-md-inline-block">
        <a href="javascript:;">
          <img src="./image/user.jpg" class="layui-nav-img">
         	<%=username%>
        </a>
        <dl class="layui-nav-child user">
          <dd><a href="">个人信息</a></dd>
          <dd><div><a href="/test1/LoginServlet">退出系统</a></div></dd>
        </dl>
      </li>
    </ul>
  </div>
  
  <div class="layui-side ">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree" >
        <li class="layui-nav-item">
          <a class="" href="javascript:;"style="padding-left: 50px; font-size: 14px;">商品管理</a>
          <dl class="layui-nav-child">
            <dd><a href="./user/speclist.jsp" style="padding-left: 50px; font-size: 14px;">分类管理</a></dd>
            <dd><a href="./user/goodslist.jsp" style="padding-left: 50px; font-size: 14px;">商品管理</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">
          <a href="javascript:;" style="padding-left: 50px; font-size: 14px;">人员管理</a>
          <dl class="layui-nav-child">
            <dd><a href="./user/providerlist.jsp" style="padding-left: 50px; font-size: 14px;">供应商管理</a></dd>
            <dd><a href="./user/userlist.jsp" style="padding-left: 50px; font-size: 14px;">仓库管理员管理</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item"><a href="./user/storelist.jsp" style="padding-left: 50px; font-size: 14px;">仓库管理</a></li>
        <li class="layui-nav-item"><a href="./user/replenishmanage.jsp" style="padding-left: 50px; font-size: 14px;">补货管理</a></li>
        <li class="layui-nav-item">
          <a href="javascript:;" style="padding-left: 50px; font-size: 14px;">其他功能</a>
          <dl class="layui-nav-child">
            <dd><a href="./user/infomanage.jsp" style="padding-left: 50px; font-size: 14px;">资讯管理</a></dd>
            <dd><a href="./user/messagelist.jsp" style="padding-left: 50px; font-size: 14px;">用户留言</a></dd>
          </dl>
        </li>
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <iframe id="main" src="./user/speclist.jsp" style="width:1350px; height:590px"></iframe>
  </div>
  <div class="layui-footer">
   <p> 仓库管理系统</p>
  </div>
</div>

<script>
//JS 
layui.use(['element', 'layer', 'util'], function(){
  var element = layui.element
  ,layer = layui.layer
  ,util = layui.util
  ,$ = layui.$;
  
  //头部事件
  util.event('lay-header-event', {
    menuRight: function(){
      layer.open({
        type: 1
        ,content: '<div style="padding: 15px;">处理右侧面板的操作</div>'
        ,area: ['260px', '100%']
        ,offset: 'rt' //右上角
        ,anim: 5
        ,shadeClose: true
      });
    }
  });
  
});
</script>	
</body>
</html>