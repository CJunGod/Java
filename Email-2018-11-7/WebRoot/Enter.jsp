<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
request.setAttribute("ctx", path);
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Enter.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  <script type="text/javascript" src="${ctx }/js/jquery-3.3.1.js"></script>
  </head>
  
  <body style="margin: 0px;padding: 0px;">
  <div style="height: 67px;width: 100%;background-color: red;">
    	&emsp;<img src="img/logo.png">
    	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
    	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
    	<img src="img/banner.jpg" style="margin-top: 3px">
    	<p id="pp" style="margin-top: -55px;margin-left: 300px">${username }<${email }></p>
    	<p style="margin-top: -12px;margin-left: 300px"><span onclick="gotolist()">邮箱首页</span>&emsp;|&nbsp;设置 - 换肤</p>
    	<p style="margin-top: -60px;margin-left: 1155px">反馈建议 | 帮助中心 | <span onclick="go();">退出</span></p>
    </div>
    <div style="margin-left: 200px;margin-top: 30px">
    	<c:forEach items="${lists }" var="ls">
    	<form action="servlet/insertEmail" method="post">
		    <label>收件人：</label><input type="text" name="usname" style="height: 20px;width: 40%" value="${ls.username }"><br><br>
		    <label>标&emsp;题：</label><input type="text" name="title" style="height: 20px;width: 40%"><br><br>
		    <p>正&emsp;文：</p><textarea rows="20px" cols="63%" name="textindex" style="margin-left: 65px;margin-top: -35px;resize:none"></textarea>  <br><br>
		    <label>发件人：</label>${username }<${email }><br><br>
		    <input type="hidden" name="sendto" value="${username }">
		    <span style="margin-left: 66px"><input type="submit" value="发&nbsp;送"></span>
		 </form>
		 </c:forEach>
		 
	 </div>
	 <script type="text/javascript">
 		function gotolist(){
 			window.location.href="EmailList.jsp";
 		}
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
  </body>
</html>
