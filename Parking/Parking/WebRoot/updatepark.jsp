<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'index.jsp' starting page</title>
<style type="text/css">
<!--
body {
	background-color:#ADD8E6;
}

.STYLE19 {color: #009933}

</style>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>

<body >

<center>
<h1 style="color: #009933;" align="center">园区停车场管理系统</h1>
	
	<form action="ParkAction!updatePark.action?id=${id}" method="post"style="margin-top:55px;">
	  停车场名： <input type="text" name="name" style="margin-bottom:5px;margin-left:1px;"/><br>
		x坐标：&nbsp;&nbsp;&nbsp;<input type="text" name="x" style="margin-bottom:5px;margin-left:10px;" /><br>
		y坐标:&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="y" style="margin-bottom:5px;margin-left:12px;"/><br> 
		车位数:&nbsp;&nbsp;&nbsp;<input type="text" name="spaceNum" style="margin-bottom:5px;margin-left:12px;" /><br> 
		<input type="submit" value="更改" style="margin-left:82px;"/>
	</form>
	</center>
</body>
</html>
