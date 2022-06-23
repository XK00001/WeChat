 layui.use('element',function(){
  var $=layui.jquery;
    	$(document).ready(function(){
    		$('dd>a').click(function (e){
    			e.preventDefault();
    			$('#main').attr("src",$(this).attr("href"));
    		});
			$('li>a').click(function (e){
    			e.preventDefault();
    			$('#main').attr("src",$(this).attr("href"));
    		});
    	});
    });