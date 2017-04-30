<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>开始计费</title>
<style>
	ul#nav{ width:100%; height:60px; background:#00A2CA;margin:0 auto} 
ul#nav li{display:inline; height:60px} 
ul#nav li a{display:inline-block; padding:0 300px; height:60px; line-height:60px;
 color:#FFF; font-family:"\5FAE\8F6F\96C5\9ED1"; font-size:16px} 
ul#nav li a:hover{background:#0095BB}/*设置鼠标滑过或悬停时变化的背景颜色*/ 
body {
background:#FAEBD7;
}
	</style>
</head>
<body>
  <h2 align="center" style="color:#0000FF;">园区管理系统</h2>
    <ul id="nav" align="center"> 
        
        <li><a href="index.jsp">返回首页</a></li> 
        <li><a href="admin.jsp">管理员操作</a></li> 
        
    </ul>  

<table align="center" style="margin-top:200px;">
<tr>
<form id="x" >
<td style="color:red;">开始计时：</td>
<td><script type="text/javascript">document.write(Date())</script></td>
<td><a href="ParkAction!outSpace.action?id=${session.id} "><input type="button" value="结束用车"></a></td>
</tr>

</form>
</table>

</body>
</html>