<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <!DOCTYPE html>
    <html>
    <head>
      <meta charset="utf-8">
      <title>用户管理</title>
      <link rel="stylesheet" href="../layui/css/layui.css" media="all">
      <script src="../js/jquery-1.8.3.min.js"></script>
      <script src="../layui/layui.js"></script>
    </head>
    <body>
    <div id="editdiv"  style="display: none">
    <form class="layui-form layui-from-pane" action="">
    	<label style="float:left;font-size:14px; padding-left:60px;padding-top:5px;margin-right:20px;">用户代码:</label>
    	<input id="editcode" class="layui-input" style="width: 200px;margin-top:25px;height: 30px;font-size: 15px;border-radius: 0.5em;" type="text">
    	<label style="float:left;font-size:14px; padding-left:60px;padding-top:15px;margin-right:20px;">用&nbsp;&nbsp;户&nbsp;&nbsp;ID:</label>
    	<input id="editid" readonly  unselectable="on" class="layui-input" style="width: 200px;margin-top:10px;height: 30px;font-size: 15px;border-radius: 0.5em;" type="text">	
    	<label style="float:left;font-size:14px; padding-left:60px;padding-top:15px;margin-right:20px;">用&nbsp;&nbsp;户&nbsp;&nbsp;名:</label>
    	<input id="editname" class="layui-input" style="width: 200px;margin-top:10px;height: 30px;font-size: 15px;border-radius: 0.5em;" type="text">
    	<label style="float:left;font-size:14px; padding-left:60px;padding-top:15px;margin-right:20px;">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:</label>
    	<input id="editpassword" class="layui-input" style="width: 200px;margin-top:10px;height: 30px;font-size: 15px;border-radius: 0.5em;" type="password" >
    	<label style="float:left;font-size:14px; padding-left:60px;padding-top:15px;margin-right:20px;">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:</label>
    	<input id="editgender" class="layui-input" style="width: 200px;margin-top:10px;height: 30px;font-size: 15px;border-radius: 0.5em;" type="text">
    	<label style="float:left;font-size:14px; padding-left:60px;padding-top:15px;margin-right:20px;">出生年月:</label>
    	<input id="editbirthday" class="layui-input" style="width: 200px;margin-top:10px;height: 30px;font-size: 15px;border-radius: 0.5em;" type="text">
    	<button onclick="edit()" style="margin-top:20px;margin-left:150px;" type="button" class="layui-btn layui-btn-normal">修改用户</button>
    </form>
    </div>
    <div id="adddiv"  style="display: none">
    	<label style="float:left;font-size:14px; padding-left:60px;padding-top:5px;margin-right:20px;">用户代码:</label>
    	<input class="layui-input usercode" style="width: 200px;margin-top:25px;height: 30px;font-size: 15px;border-radius: 0.5em;" type="text"  placeholder="输入用户代码" >	
    	<label style="float:left;font-size:14px; padding-left:60px;padding-top:15px;margin-right:20px;">用&nbsp;&nbsp;户&nbsp;&nbsp;名:</label>
    	<input class="layui-input username" style="width: 200px;margin-top:10px;height: 30px;font-size: 15px;border-radius: 0.5em;" type="text"  placeholder="输入用户名" >
    	<label style="float:left;font-size:14px; padding-left:60px;padding-top:15px;margin-right:20px;">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:</label>
    	<input class="layui-input password" style="width: 200px;margin-top:10px;height: 30px;font-size: 15px;border-radius: 0.5em;" type="password"  placeholder="输入密码" >
    	<label style="float:left;font-size:14px; padding-left:60px;padding-top:15px;margin-right:20px;">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:</label>
    	<input class="layui-input gender" style="width: 200px;margin-top:10px;height: 30px;font-size: 15px;border-radius: 0.5em;" type="text" name="username" placeholder="男或女" >
    	<label style="float:left;font-size:14px; padding-left:60px;padding-top:15px;margin-right:20px;">出生年月:</label>
    	<input class="layui-input birthday" style="width: 200px;margin-top:10px;height: 30px;font-size: 15px;border-radius: 0.5em;" type="text" name="username" placeholder="年-月-日" >
    	<button onclick="add()" style="margin-top:20px;margin-left:150px;" type="button" class="layui-btn layui-btn-normal">添加用户</button>
   	</div>
   	<div style="padding-top:20px;padding-left:20px; width:1250px;'">
   		<div class="location">
      		<p>你现在所在的位置是:</p>
      		<span>人员管理 >> 仓库管理员管理</span>
    	</div>
    	<br>
    	<div class="form">
    		<button id="add" style="float:right;" type="button" class="layui-btn layui-btn-normal">添加用户</button>
    		<button id="search" data-type="reload" style="width:75px;float:right; margin-right:760px; border-radius:4px;" type="button" class="layui-btn layui-btn-sm layui-btn-normal">搜索</button>
    		<label style="float:left;font-size:14px; padding-left:30px;padding-top:5px;margin-right:20px;">用户名:</label>
    		<input id="username" type="text" class="layui-input" style=" width: 200px;height: 30px;font-size: 15px;border-radius: 0.5em;" type="text" name="username" placeholder="输入用户名" >
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
        ,url: '/test1/userlistServlet' 
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
          ,{field: 'usercode', title: '用户代码'}
          ,{field: 'username', title: '用户名'}
          ,{field: 'password', title: '密码'} 
          ,{field: 'gender', title: '性别'}
          ,{field: 'birthday', title: '生日'}
          ,{field: 'userrole', title: '身份',hide: true}
          ,{field: 'action',title: '操作',toolbar:'#barDemo'}
        ]]
      });  	
      table.on('tool(test)',function(obj){
    	  var $=layui.jquery;
          var data=obj.data;
    	  if(obj.event=="del"){
    		  layer.confirm('您确定要删除该用户吗?',{btn: ['确定', '取消'],title:"提示"}, function(){
    		  $.ajax({
    			  url:"/test1/deluserServlet",
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
    		 $("#editid").val(data.id)
    		 $("#editcode").val(data.usercode)
    		 $("#editname").val(data.username)
    		 $("#editpassword").val(data.password)
    		 $("#editgender").val(data.gender)
    		 $("#editbirthday").val(data.birthday)
    		 layer.open({
    			type:1,
    			title:"修改用户",
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
            title: '添加用户',
            area: ['400px', '350px'],
            content: $('#adddiv'), 
            end:function (){
                location.reload();
             }
          })
          	
        })
    	  
      	  var $=layui.$,active={
        	  reload: function(){
        	      var username = $('#username').val();
        	      console.log(username);
        	      //执行重载
        	      table.reload('test', {
        	      	where: {
        	            "Username": username
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
    	 var id=$("#editid").val();
		 var usercode=$("#editcode").val();
		 var username=$("#editname").val();
		 var password=$("#editpassword").val();
		 var gender=$("#editgender").val();
		 var birthday=$("#editbirthday").val();
		 $.ajax({
            url:"/test1/updateuserServlet",
            type: "post",
            dataType:"text",
            data:{
           	 	'id':id,
           		'username':username,
				'password':password,
				'usercode':usercode,
				'gender':gender,
				'birthday':birthday,
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
  		var username=$(".username").val();
  		var password=$('.password').val();
  		var usercode=$('.usercode').val();
  		var gender=$('.gender').val();
  		var birthday=$('.birthday').val();
  		 $.ajax({
  				type:'post',
  				url:'/test1/adduserServlet',
  				data:{
  					'username':username,
  					'password':password,
  					'usercode':usercode,
  					'gender':gender,
  					'birthday':birthday,
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