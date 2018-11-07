<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%
String path = request.getContextPath();
request.setAttribute("ctx", path);
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>爱马仕邮箱信息页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- 引入ico图标 -->
	<link rel="shortcut icon" href="img/favicon.ico" />
	<link rel="bookmark"href="img/favicon.ico" />
	<style type="text/css">
		a{
			text-decoration: none;
		}
		.fixed_img{
    		bottom:130px;
    		display:block;
   			height:350px;
    		position:fixed;
   			right:20px;
    		width:100px;
			}
		.fixed_img1{
    		bottom:130px;
    		display:block;
   			height:350px;
    		position:fixed;
   			left:20px;
    		width:100px;
			}
	</style>
  <script type="text/javascript" src="${ctx }/js/jquery-3.3.1.js"></script>
  <!-- 雪花特效 -->
  <script type="text/javascript">
	(function($){
		$.fn.snow = function(options){
		var $flake = $('<div id="snowbox" />').css({'position': 'absolute','z-index':'9999', 'top': '-50px'}).html('&#10052;'),
		documentHeight 	= $(document).height(),
		documentWidth	= $(document).width(),
		defaults = {
			minSize		: 10,
			maxSize		: 20,
			newOn		: 1000,
			flakeColor	: "ff0000" /* 此处可以定义雪花颜色，若要白色可以改为#FFFFFF */
		},
		options	= $.extend({}, defaults, options);
		var interval= setInterval( function(){
		var startPositionLeft = Math.random() * documentWidth - 100,
		startOpacity = 0.5 + Math.random(),
		sizeFlake = options.minSize + Math.random() * options.maxSize,
		endPositionTop = documentHeight - 200,
		endPositionLeft = startPositionLeft - 500 + Math.random() * 500,
		durationFall = documentHeight * 10 + Math.random() * 5000;
		$flake.clone().appendTo('body').css({
			left: startPositionLeft,
			opacity: startOpacity,
			'font-size': sizeFlake,
			color: options.flakeColor
		}).animate({
			top: endPositionTop,
			left: endPositionLeft,
			opacity: 0.2
		},durationFall,'linear',function(){
			$(this).remove()
		});
		}, options.newOn);
	    };
			})(jQuery);
			$(function(){
			    $.fn.snow({ 
				    minSize: 5, /* 定义雪花最小尺寸 */
				    maxSize: 50,/* 定义雪花最大尺寸 */
				    newOn: 300  /* 定义密集程度，数字越小越密集 */
	    		});
			});
	</script>
  <style type="text/css">
		  	<!--
		a:link {
		color: #669933;
		text-decoration: none;
		}
		a:hover {
		text-decoration: none;
		color: #FF0000;
		}
		a:active {
		text-decoration: none;
		color: #FF00FF;
		}
		-->
	</style> 
  </head>
  <body style="margin: 0px;padding: 0px" onload="one();">
    <div style="height: 67px;width: 100%;background-color: red;">
    	&emsp;<img src="img/logo.png">
    	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
    	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
    	<img src="img/banner.jpg" style="margin-top: 3px">
    	<p id="pp" style="margin-top: -55px;margin-left: 300px">${username }<${email }></p>
    	<p style="margin-top: -12px;margin-left: 300px"><span onclick="gotolist()">邮箱首页</span>&emsp;|&nbsp;设置 - 换肤</p>
    	<p style="margin-top: -60px;margin-left: 1155px">反馈建议 | 帮助中心 | <span onclick="go();">退出</span></p>
    </div>
    <!-- 轮播图片 -->
    <img alt="" src="img/2.jpg" class="fixed_img">
    <img src="img/7.jpg" class="fixed_img1">
    <!-- 邮箱内容 -->
    <table style="margin-left:200px;margin-top: 20px">
    	<tbody id="tbody">
    	
    	</tbody>
     </table>
     
     <!-- 代码特效 -->
        <div id="FlowStatistics1" style="width: 0px; height: 0px; margin: 0px auto;">
		<span style="color: #DD3023">
		<span style="font-size: 24px">
		<span style="font-size: 14px">
		<span style="font-size: 16px">
		<MARQUEE style="LEFT: 270px; POSITION: absolute; TOP: 65px; WIDTH: 1000px; HEIGHT: 25px" scrollAmount=3 scrollDelay=10 direction=left >
		<strong><a href="EmailList.jsp" target="_blank">尊敬的用户你好:欢迎登陆爱马仕邮箱,我们给您提供一流的服务和技术,解决您的日常烦恼,如有任何反馈,欢迎致电我们。</a></strong>
		</MARQUEE></span> </span> </span> </span></div>
     <p style="text-align:center;">
	<iframe marginwidth="0" marginheight="0" src="http://db-cache.t57.cn/fmp/index.html" frameborder="0" width="965" scrolling="no" height="24"> 	</iframe> </p>
  
  </body>
 	<script type="text/javascript">
 			$.ajax({
  			type:"post",//提交方式
  			dataType:"html",//xml,json,html,text   成功后返回数据的格式
  			url:"servlet/Synchronous?list=list",// 提交的路径
  			data:{},// json 数据格式
  			success:function(data){//成功后的回调函数
  				$("#tbody").html(data);
  			},
  		});
 	</script>
 	<script type="text/javascript">
 		function go(){
	 		$.ajax({
	  			type:"post",//提交方式
	  			dataType:"text",//xml,json,html,text   成功后返回数据的格式
	  			url:"servlet/goindex",// 提交的路径
	  			data:{},// json 数据格式
	  			success:function(data){//成功后的回调函数
	  				if(data>0){
	  					alert("退出成功");
	  					window.location.href="index.jsp";
	  				}else{
  						alert("退出失败");
  					}
  				},
  			});
  		}
 	</script>
 	<script type="text/javascript">
 		function gotolist(){
 			window.location.href="EmailList.jsp";
 		}
 	</script>
</html>
