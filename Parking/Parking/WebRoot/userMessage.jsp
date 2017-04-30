<%@ page contentType="text/html;charset=utf-8"%>
<head>
<style type="text/css">
<!--
body {
	background-color:#FFE4C4;
}
.STYLE6 {font-size: 24px; color: #FF0000; }
.STYLE15 {color: #0000FF}
.STYLE17 {font-size: 24px}
.STYLE19 {color: #009933}
.STYLE20 {font-size: 36px}
-->
</style>
</head>
<html>
<body>
	<center>
		<h1>用户信息</h1>
		<table border="2" width="700">
			<tr>
				<th>用户ID</th>
				<th>登录名</th>
				<th>密码</th>
			    <th>余额</th>
			</tr>

			
				<tr>
					<td align="center">${session.userMessage.id}</td>
					<td align="center">${session.userMessage.username}</td>
					<td align="center">${session.userMessage.password}</td>
					<td align="center">${session.userMessage.balance}</td>				
				</tr>

		

		</table>
		<br><a href="userXiugai.jsp">修改个人信息</a>
	</center>
</body>
</html>