<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="<%=basePath%>">

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>
<script language="JavaScript" src="js/jquery.js"></script>
<script src="js/cloud.js" type="text/javascript"></script>
<script src="sweetalert.min.js"></script> 
<script type="text/javascript">
  
	function adminlogin() {
		var htmlobj = $.ajax({
			url : "UserAction!adminlogin.action",
			type : "POST",
			data : {
				"username" : $("#username").val(),
				"password" : $("#password").val(),
			},
			async : false
		});
		var jsonresult = JSON.parse(htmlobj.responseText);
		var result = jsonresult.flag;
		var error = jsonresult.error;
		if (result) {
			location.href = "admin.jsp";

		} else {
		/* $.MsgBox.Alert("温馨提示：", error);  */
		alert("温馨提示：用户名或密码错误");
	      swal({
				title : error,
				showCancelButton : true,
				showConfirmButton : false,
				cancelButtonText : "确认",
				
			});
		}
	}
	function keydown(e) {

		if ((e.keyCode || e.which) == 13) {
		
			login();
		}
	};
</script> 

<body>
	<center>
		<h1>用户信息</h1>
		<table border="2" width="700">
			<tr>
				<th>用户ID</th>
				<th>评论内容</th>
				<th>评论时间</th>
				<th>用户id</th>
				<th>用户姓名</th>
				<th>删除</th>
			</tr>

			<c:forEach items="${request.userList}" var="bean">
				<tr>
					<td align="center">${bean.id}</td>
					<td align="center">${bean.username}</td>
					<td align="center">${bean.password}</td>
					<td align="center">${bean.administra}</td>					
					<td align="center"><input type="button" value="编辑" onClick="edit()" ></td>
					<td align="center"><a href="${request.contextPath}/Parking/UserAction!delete.action?id=${bean.id} ">删除</td>
				
				</tr>

			</c:forEach>

		</table>
		<br> <a href="addUser.jsp">添加用户</a>
		<br><a href="LoginAction!UpdateUser.action?id=${bean.userid}">更新用户</a>
	</center>
</body>
</html>
