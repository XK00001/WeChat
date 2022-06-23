<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>供应商管理</title>
	  <link rel="stylesheet" href="../layui/css/layui.css" media="all">
      <script src="../js/jquery-1.8.3.min.js"></script>
      <script src="../layui/layui.js"></script>
</head>
<body>
	<div id="editdiv"  style="display: none">
    <form class="layui-form layui-from-pane" action="">
    	<label style="float:left;font-size:14px; padding-left:60px;padding-top:5px;margin-right:20px;">商户代码:</label>
    	<input id="procode" class="layui-input" style="width: 200px;margin-top:25px;height: 30px;font-size: 15px;border-radius: 0.5em;" type="text">
    	<label style="float:left;font-size:14px; padding-left:60px;padding-top:15px;margin-right:20px;">商&nbsp;&nbsp;户&nbsp;&nbsp;ID:</label>
    	<input id="proid" class="layui-input" style="width: 200px;margin-top:10px;height: 30px;font-size: 15px;border-radius: 0.5em;" type="text">	
    	<label style="float:left;font-size:14px; padding-left:60px;padding-top:15px;margin-right:20px;">商&nbsp;&nbsp;户&nbsp;&nbsp;名:</label>
    	<input id="proname" class="layui-input" style="width: 200px;margin-top:10px;height: 30px;font-size: 15px;border-radius: 0.5em;" type="text">
    	<label style="float:left;font-size:14px; padding-left:60px;padding-top:15px;margin-right:20px;">主营项目:</label>
    	<input id="prodesc" class="layui-input" style="width: 200px;margin-top:10px;height: 30px;font-size: 15px;border-radius: 0.5em;" type="text" >
    	<label style="float:left;font-size:14px; padding-left:60px;padding-top:15px;margin-right:20px;">联&nbsp;&nbsp;系&nbsp;&nbsp;人:</label>
    	<input id="procontact" class="layui-input" style="width: 200px;margin-top:10px;height: 30px;font-size: 15px;border-radius: 0.5em;" type="text">
    	<label style="float:left;font-size:14px; padding-left:60px;padding-top:15px;margin-right:20px;">联系电话:</label>
    	<input id="prophone" class="layui-input" style="width: 200px;margin-top:10px;height: 30px;font-size: 15px;border-radius: 0.5em;" type="text">
    	<label style="float:left;font-size:14px; padding-left:60px;padding-top:15px;margin-right:20px;">地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址:</label>
    	<input id="proaddress" class="layui-input" style="width: 200px;margin-top:10px;height: 30px;font-size: 15px;border-radius: 0.5em;" type="text">
    	<button onclick="edit()" style="margin-top:20px;margin-left:150px;" type="button" class="layui-btn layui-btn-normal">修改商户</button>
    </form>
    </div>
    <div id="adddiv"  style="display: none">
    	<label style="float:left;font-size:14px; padding-left:60px;padding-top:5px;margin-right:20px;">商户代码:</label>
    	<input class="layui-input procode" style="width: 200px;margin-top:25px;height: 30px;font-size: 15px;border-radius: 0.5em;" type="text"  placeholder="输入商户代码" >	
    	<label style="float:left;font-size:14px; padding-left:60px;padding-top:15px;margin-right:20px;">商&nbsp;&nbsp;户&nbsp;&nbsp;名:</label>
    	<input class="layui-input proname" style="width: 200px;margin-top:10px;height: 30px;font-size: 15px;border-radius: 0.5em;" type="text"  placeholder="输入商户名" >
    	<label style="float:left;font-size:14px; padding-left:60px;padding-top:15px;margin-right:20px;">主营项目:</label>
    	<input class="layui-input prodesc" style="width: 200px;margin-top:10px;height: 30px;font-size: 15px;border-radius: 0.5em;" type="text"  placeholder="主营项目" >
    	<label style="float:left;font-size:14px; padding-left:60px;padding-top:15px;margin-right:20px;">联&nbsp;&nbsp;系&nbsp;&nbsp;人:</label>
    	<input class="layui-input procontact" style="width: 200px;margin-top:10px;height: 30px;font-size: 15px;border-radius: 0.5em;" type="text" placeholder="商户联系人" >
    	<label style="float:left;font-size:14px; padding-left:60px;padding-top:15px;margin-right:20px;">联系电话:</label>
    	<input class="layui-input prophone" style="width: 200px;margin-top:10px;height: 30px;font-size: 15px;border-radius: 0.5em;" type="text"  placeholder="联系电话" >
    	<label style="float:left;font-size:14px; padding-left:60px;padding-top:15px;margin-right:20px;">地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址:</label>
    	<input class="layui-input proaddress" style="width: 200px;margin-top:10px;height: 30px;font-size: 15px;border-radius: 0.5em;" type="text"  placeholder="供应商地址" >
    	<button onclick="add()" style="margin-top:20px;margin-left:150px;" type="button" class="layui-btn layui-btn-normal">添加商户</button>
   	</div>
   	<div style="padding-top:20px;padding-left:20px; width:1250px;'">
   		<div class="location">
      		<p>你现在所在的位置是:</p>
      		<span>人员管理 >> 供应商管理</span>
    	</div>
    	<br>
    	<div class="form">
    		<button id="add" style="float:right;" type="button" class="layui-btn layui-btn-normal">添加商户</button>
    		<button id="search" data-type="reload" style="width:75px;float:right; margin-right:760px; border-radius:4px;" type="button" class="layui-btn layui-btn-sm layui-btn-normal">搜索</button>
    		<label style="float:left;font-size:14px; padding-left:30px;padding-top:5px;margin-right:20px;">供应商名:</label>
    		<input id="proname1" type="text" class="layui-input" style=" width: 200px;height: 30px;font-size: 15px;border-radius: 0.5em;" type="text" name="username" placeholder="输入供应商名" >
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
        ,url: '/test1/providerlistServlet' 
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
          ,{field: 'procode', title: '供应商代码'}
          ,{field: 'proname', title: '供应商名'}
          ,{field: 'prodesc', title: '主营项目'} 
          ,{field: 'procontact', title: '联系人'}
          ,{field: 'prophone', title: '联系电话'}
          ,{field: 'proaddress', title: '地址'}
          ,{field: 'action',title: '操作',toolbar:'#barDemo'}
        ]]
      });  	
      table.on('tool(test)',function(obj){
    	  var $=layui.jquery;
          var data=obj.data;
    	  if(obj.event=="del"){
    		  layer.confirm('您确定要删除该供应商吗?',{btn: ['确定', '取消'],title:"提示"}, function(){
    		  $.ajax({
    			  url:"/test1/delproServlet",
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
    		 $("#proid").val(data.id)
    		 $("#procode").val(data.procode)
    		 $("#proname").val(data.proname)
    		 $("#prodesc").val(data.prodesc)
    		 $("#procontact").val(data.procontact)
    		 $("#prophone").val(data.prophone)
    		 $("#proaddress").val(data.proaddress)
    		 layer.open({
    			type:1,
    			title:"修改商户",
    			area:['400px', '450px'],
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
            title: '添加商户',
            area: ['400px', '400px'],
            content: $('#adddiv'), 
            end:function (){
                location.reload();
             }
          })
          	
        })
    	  
      	  var $=layui.$,active={
        	  reload: function(){
        	      var proname1= $('#proname1').val();
        	      //执行重载
        	      table.reload('test', {
        	      	where: {
        	            "Proname": proname1
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
    	 var id=$("#proid").val();
		 var procode=$("#procode").val();
		 var proname=$("#proname").val();
		 var prodesc=$("#prodesc").val();
		 var procontact=$("#procontact").val();
		 var prophone=$("#prophone").val();
		 var proaddress=$("#proaddress").val();
		 $.ajax({
            url:"/test1/updateproServlet",
            type: "post",
            dataType:"text",
            data:{
           	 	'id':id,
           		'procode':procode,
				'proname':proname,
				'prodesc':prodesc,
				'procontact':procontact,
				'prophone':prophone,
				'proaddress':proaddress,
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
    	 var procode=$(".procode").val();
		 var proname=$(".proname").val();
		 var prodesc=$(".prodesc").val();
		 var procontact=$(".procontact").val();
		 var prophone=$(".prophone").val();
		 var proaddress=$(".proaddress").val();
  		 $.ajax({
  				type:'post',
  				url:'/test1/addproServlet',
  				data:{
  					'procode':procode,
  					'proname':proname,
  					'prodesc':prodesc,
  					'procontact':procontact,
  					'prophone':prophone,
  					'proaddress':proaddress,
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