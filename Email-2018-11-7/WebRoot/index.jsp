<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
request.setAttribute("ctx", path);
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>爱马仕邮箱登录界面</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- 引入ico图标 -->
	<link rel="shortcut icon" href="img/favicon.ico" />
	<link rel="bookmark"href="img/favicon.ico" />
	
  	<script type="text/javascript" src="${ctx }/js/jquery-3.3.1.js"></script>
  </head>
  
  <body style="margin: 0px;padding: 0px">
  <img alt="图片无法显示" src="img/268888_007.jpg" style="height: 100%;width: 100%">
  <div style="height: 45px;width: 400px;background-color: rgb(1,170,237);line-height: 10px; color: white;position: absolute; top: 155px; left: 870px; border-radius: 5px 5px 0px 0px">
	  	<h3 style="margin-left: 10px;" id="user">
	  		用户管理系统-用户登录
	  	</h3>
  	</div>
  	<!-- 本次登录注册界面显示引用淘宝简化方式 - 2018-11-6 -->
  <div style="height: 240px;width: 400px;background-color: white; position: absolute; top: 200px;left: 870px">
  	<!-- 用户登录表单 -->
   	 <form action="servlet/UserLogin" method="post" id="formlogin">
    		<label style="margin-left: 45px">用户名：</label><input type="text" id="name" name="name" style="margin-top: 45px;padding-top: 3px;padding-bottom: 3px" onblur="gos();"><span id="spans"></span><br><br>
    		<label style="margin-left: 45px">密&emsp;码：</label><input type="password" name="password" style="padding-top: 3px;padding-bottom: 3px"><br><br>
    		<input type="submit" value="登录" style="background-color: rgb(1,170,237);border-color:rgb(1,170,237);padding: 10px 55px 10px 55px;color: white;font-weight: 900px;margin-left: 120px">
   	 </form>
   	 
   	 <!-- 用户注册表单 -->
   	 <form action="servlet/UserAdd" method="post" id="formregister" style="display: none">
    		<label style="margin-left: 45px">用户名：</label><input type="text" id="uname" name="name" style="margin-top: 20px;padding-top: 3px;padding-bottom: 3px" onblur="selectname();"><span id="span"></span><br><br>
    		<label style="margin-left: 45px">密&emsp;码：</label><input type="password" name="password" style="padding-top: 3px;padding-bottom: 3px"><br><br>
    		<label style="margin-left: 45px">邮&emsp;箱：</label><input type="text" name="email" style="padding-top: 3px;padding-bottom: 3px"><br><br>
    		<input type="submit" value="注册" style="background-color: rgb(1,170,237);border-color:rgb(1,170,237);padding: 10px 55px 10px 55px;color: white;font-weight: 900px;margin-left: 120px">
   	 </form>
   	 <p id="login" onclick="login();" style="margin-left: 230px;margin-top: -3px">用户登录</p>
   	 <p id="register" onclick="register();" style="margin-left: 315px;margin-top: -37px">免费注册</p>
    </div>
  </body>
  <!-- 控制显示 -->
  <script type="text/javascript">
  		function login(){
  			$("#formlogin").css("display","block");
  			$("#formregister").css("display","none");
  			$("#user").html("用户管理系统-用户登录");
  		}
  		function register(){
  			$("#formlogin").css("display","none");
  			$("#formregister").css("display","block");
  			$("#user").html("用户管理系统-用户注册");
  		}
  </script>
  <script type="text/javascript">
  	function gos(){
  		var name = $("#name").val();
  		if(name==null||name==""){
  			$("#spans").html("&nbsp;不可为空").css("color","red");
  		}else{
  			$("#spans").html("");
  		}
  	}
  </script>
  <script type="text/javascript">
  	function selectname(){
  			var name = $("#uname").val();
  			if(name==null||name==""){
  				$("#span").html("&emsp;不可为空").css("color","red");
  			}else{
	  			$.ajax({
	  				type:"post",
	  				dataType:"text",
	  				url:"servlet/SelectUser",
	  				data:{"uname":name},
	  				success:function(data){
	  					if(data>0){
	  						$("#span").html("&emsp;用户名重复").css("color","red");
	  					}else{
	  						$("#span").html("&emsp;可以注册").css("color","blue");
	  					}
	  				}
	  			});
  			}
  		}
  </script>
</html>
