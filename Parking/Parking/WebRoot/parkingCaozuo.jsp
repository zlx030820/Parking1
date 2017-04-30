<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

 
    <h3 align="center">停车场管理</h3>
    <table width="100%">
    <tr>
     <td align="left" width="40%"><a href="index.jsp">返回首页</a></td>
     <td></td>
     <td align="right"  width="40%"><a href="admin.jsp">管理员操作</a></td>
    </tr>
    </table>


		<table border="2" width="100%;" align="center" >
			<tr>
				<th >停车场名字</th>
				<th >x</th>
				<th >y</th>
				<th>车位数目</th>
				<th>时间</th>
               <th>操作</th>
                <th></th>

			</tr>

			<c:forEach items="${usersList}" var="bean">
				<tr>
					<td align="center" ><input type="text" name="account" ></td>
					<td align="center" ><input type="text" name="account"></td>
					<td align="center" ><input type="text" name="account"></td>
					<td align="center" ><input type="text" name="account"></td>
					<td align="center" ><input type="text" name="account"></td>
				
					<td align="center"><a href="LoginAction!delete.action?id=${bean.userid}" />删除</td>
					
				</tr>

			</c:forEach>
			
		</table>
				<center><a href="addparking.jsp"><input type="button" value="添加新的停车场"></a></center>
		
		
	


		
		

  </body>
</html>
