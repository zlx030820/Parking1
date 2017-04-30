<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body style="background-color:#FDF5E6;">
<center>

	<h1 style="color:#00FF00;">用户充值</h1><hr style="color:#00FF00;">
	<form action="UserAction!Updatefeiyong.action?id=${id}" method="post" style="margin-top:100px">
	  充值： <input type="text" name="balance" /><br><br>
		<input type="submit" value="确定" />
	</form>
	</center>
    
</body>
</html>