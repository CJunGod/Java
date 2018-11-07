<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%
String path = request.getContextPath();
request.setAttribute("ctx", path);
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'show.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
  <script type="text/javascript" src="${ctx }/js/jquery-3.3.1.js"></script>
  <style type="text/css">
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
  </head>
  
  <body style="margin: 0px;padding: 0px;">
  <c:if test="${index eq 0 }">
    <c:forEach items="${list }" var="li">
    		<tr>
    			<c:if test="${li.state==0 }">
    				<img src="img/sms_unReaded.png">
    			</c:if>
    			<c:if test="${li.state>0 }">
    				<img src="img/sms_readed.png">
    			</c:if>
    			<div style="margin-left: 35px;margin-top: -22px">
    				<td>${li.title }</td>
    			</div>
    			<div style="margin-left: 260px;margin-top: -22px" onclick="gotoi();">
    				<td>&nbsp;
    				<a href="servlet/Synchronous?list=one&iid=${li.msgid }">
	    				<c:if test="${fn:length(li.msgcontent) >= 8}">
							<c:out value="${fn:substring(li.msgcontent,0,7)}"/>....
						</c:if>
						<c:if test="${fn:length(li.msgcontent) < 8}">
							 <c:out value="${li.msgcontent}"/>
						</c:if>
					</a>	
					</td>
    			</div>
    			<div style="margin-left: 655px;margin-top: -24px">
	    			<td>
	   					<a href="servlet/DelEmail?id=${li.msgid }" style="display: ">删除</a>
	   					&emsp;
	   				</td>
	   				<td>
	    				<a href="servlet/EnterEmail?id=${li.msgid }" style="">回复</a>
	    				&emsp;
	  	 			</td>
   					<td>${li.msg_create_date }<td>
   				</div>
   			</tr>
   			<br>
   		</c:forEach>
   		</c:if>
   		<c:if  test="${index eq 1 }">
   			<div style="height: 67px;width: 100%;background-color: red;">
		    	&emsp;<img src="img/logo.png">
		    	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
		    	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
		    	<img src="img/banner.jpg" style="margin-top: 3px">
		    	<p id="pp" style="margin-top: -55px;margin-left: 300px">${username }<${email }></p>
		    	<p style="margin-top: -12px;margin-left: 300px"><span onclick="gotolist()">邮箱首页</span>&emsp;|&nbsp;设置 - 换肤</p>
		    	<p style="margin-top: -60px;margin-left: 1155px">反馈建议 | 帮助中心 | <span>退出</span></p>
		    </div>
		    <!-- 轮播图片 -->
    		<img alt="" src="img/2.jpg" class="fixed_img">
    		<img src="img/7.jpg" class="fixed_img1">
    		<!-- 展示数据 -->
   			<c:forEach items="${list }" var="li">
   				<p style="display: block;margin-left: 500px"><label>发件人：</label>${li.username }</p>
   				<p style="display: block;margin-left: 500px;margin-top: 20px"><label>标&emsp;题：</label>${li.title }</p>
   				<p style="display: block;margin-left: 500px;margin-top: 20px">正&emsp;文：</p><textarea rows="15px" cols="43%" readonly name="textindex" style="margin-left: 568px;margin-top: -35px;resize:none;font-size: 20px">${li.msgcontent }</textarea>  <br>
   				<span style="display: block;margin-left: 500px;margin-top:20px "><span>时&emsp;间:</span>&emsp;${li.msg_create_date }</span>
   				<br>
   				<span style="display: block;margin-left: 666px;height: 40px;width: 80px;background-color: red;text-align: center;"><a href="servlet/SetState?state=1&msgid=${li.msgid }" style="text-decoration: none;line-height: 40px;color: blue;font-weight: 900;font-size: 28px">返&nbsp;回</a></span>
   			</c:forEach>
   		</c:if>
  </body>
</html>
