<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'user.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="https://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<style>
	ul#nav{ width:100%; height:60px; background:#00A2CA;margin:0 auto} 
ul#nav li{display:inline; height:60px} 
ul#nav li a{display:inline-block; padding:0 120px; height:60px; line-height:60px;
 color:#FFF; font-family:"\5FAE\8F6F\96C5\9ED1"; font-size:16px} 
ul#nav li a:hover{background:#0095BB}/*设置鼠标滑过或悬停时变化的背景颜色*/ 
	</style>

  </head>
  
  <body>

 
    <h3 align="center">评论管理</h3>
    <h3 align="right"><a href="index.jsp">返回首页</a></h3>
 
<center>
		<table border="2" width="700">
			<tr>
				<th >用户名：</th>
				<th>消息</th>
               <th>操作</th>

			</tr>

			<c:forEach items="${usersList}" var="bean">
				<tr>
					<td id=${bean.num} align="center">${bean.num}</td>
					<td id=${bean.using}  align="center">${bean.num}</td>
				
					<td align="center"><a
						href="LoginAction!delete.action?id=${bean.userid}" />删除</td>
					
				</tr>

			</c:forEach>

		</table>
		
	</center>
  </body>
</html>
